### Docker container: POSTGRESQL (current: 14)

		- run: docker run --rm -e POSTGRES_PASSWORD=password -p 5432:5432 -d postgres
		- exec in container:
			- su - postgres
			- psql
			- create database
				- create database rd_app
			- create user: 
				- create user rd_user
			- set password: 
				- ALTER USER rd_user with password 'rd_user';
			- create database: rd_app
			- grant access to user
				GRANT ALL PRIVILEGES ON DATABASE rd_app to rd_user;
				
### PSQL reference:

        \c [database] => connect to database
        \du			=> list users and roles
        \q			=> exit psql

### Wildfly Integration:

		- Download JDBC Driver 
		- Create WF Module:
			- Directory: [WF]\modules\system\layers\base
			- Create Directory: org/postgresql/main
			- Copy JAR 
			- Create module.xml 
			
				<?xml version='1.0' encoding='UTF-8'?> 
				<module xmlns="urn:jboss:module:1.1" name="org.postgresql"> 				 
					<resources> 
						<resource-root path="postgresql-42.3.1.jar"/> 
					</resources> 				 
					<dependencies> 
						<module name="javax.api"/> 
						<module name="javax.transaction.api"/> 
					</dependencies> 
				</module> 
				
			- Update 'standalone.xml':
				- Add Driver to <drivers>:

                    <driver name="postgresql" module="org.postgresql">
                        <driver-class>org.postgresql.Driver</driver-class>
                    </driver>					
					
				- Add Datasource to <datasources>
				
					<datasource jndi-name="java:jboss/datasources/RDPSQLDS" pool-name="RDPSQLDS" enabled="true" use-java-context="true">
						<connection-url>jdbc:postgresql://localhost:5432/rd_app</connection-url>
						<driver-class>org.postgresql.Driver</driver-class>
						<driver>postgresql</driver>
						<security>
							<user-name>rd_user</user-name>
							<password>rd_user</password>
						</security>
					</datasource>				
					
				- Use Datasource in persistence.xml:
				
					<persistence-unit name="primary">
						<jta-data-source>java:jboss/datasources/RDPSQLDS</jta-data-source>
						<properties>
							<!-- Properties for Hibernate -->
							<property name="hibernate.hbm2ddl.auto" value="create-drop"/>
							<property name="hibernate.show_sql" value="false"/>
							<property name="hibernate.dialect" value="org.hibernate.dialect.PostgreSQLDialect"/>
						</properties>
					</persistence-unit>		

				*** Attention: declare the dialect, otherwise DS fails to init
			
			- Important Note: all PSQL objects are in lower case, even if declared with upper case
			