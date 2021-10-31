FROM jboss/wildfly

ADD target/RD-1.0-SNAPSHOT.war /opt/jboss/wildfly/standalone/deployments

EXPOSE 8080