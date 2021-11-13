FROM jboss/wildfly

# Note: the image is based on the BITFORCE-IT paradigm on extending wilfly image in a pragmatic situation (https://github.com/BITFORCE-IT/WildFlyApp)

# login as 'root' to do copy and access rights actions
USER root

# Enable for debugging purposes
# RUN yum -y install net-tools

# copy scripts to the image
RUN mkdir /start
RUN mkdir $JBOSS_HOME/custom
RUN mkdir -p $JBOSS_HOME/modules/system/layers/base/org/postgresql/main
COPY scripts/wf/entrypoint.sh /start
COPY scripts/wf/install.sh $JBOSS_HOME/custom
COPY scripts/wf/postgress_datasource.cli $JBOSS_HOME/custom
COPY libs/postgresql-42.3.1.jar $JBOSS_HOME/modules/system/layers/base/org/postgresql/main

# configure script access rights
RUN chown -R jboss:jboss /start
RUN chown -R jboss:jboss $JBOSS_HOME/custom
RUN chown -R jboss:jboss $JBOSS_HOME/modules/system/layers/base/org/postgresql
RUN chown 775 /start/entrypoint.sh
RUN chown 775 $JBOSS_HOME/custom/install.sh

# login as 'jboss' to start initialization
USER jboss

# expose WF and WF admin ports
EXPOSE 8080 9990

# environment variables - can be overwritten in execution
ENV DB_HOST postgres
ENV DB_PORT 5432
ENV DB_USER rd_user
ENV DB_PASSWORD rd_user
ENV DB_SCHEMA rd_app

# create admin user
RUN $JBOSS_HOME/bin/add-user.sh admin admin --silent
# run script to start, configure and stop WF
RUN $JBOSS_HOME/custom/install.sh

# cannot start WF otherwise
RUN rm -rf /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current

# copy the binary file in deployments
COPY target/RD-1.0-SNAPSHOT.war ${JBOSS_HOME}/standalone/deployments

# declare the entrypoint
ENTRYPOINT [ "/start/entrypoint.sh" ]

# pseudo command to trigger WF from entrypoint or alternatively, do other stuff as init
CMD ["jboss"]