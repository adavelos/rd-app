STANDALONE:

### (1) In-Memory Data Source (pre-configured):

                <datasource jndi-name="java:jboss/datasources/RDInMemoryDS" pool-name="RDInMemoryDS" enabled="true" use-java-context="true">
                    <connection-url>jdbc:h2:mem:rdapp-inmemory;DB_CLOSE_ON_EXIT=FALSE;DB_CLOSE_DELAY=-1</connection-url>
                    <driver>h2</driver>
                    <security>
                        <user-name>sa</user-name>
                        <password>sa</password>
                    </security>
                </datasource>

### (2) Postgres Data Source:

                <datasource jndi-name="java:jboss/datasources/RDPSQLDS" pool-name="RDPSQLDS">
                    <connection-url>jdbc:postgresql://localhost:5432/rd_app</connection-url>
                    <driver>postgresql</driver>
                    <security>
                        <user-name>rd_user</user-name>
                        <password>rd_user</password>
                    </security>
                </datasource>        

### (3) H2 Driver (pre-configured):

                <driver name="h2" module="com.h2database.h2">
                    <xa-datasource-class>org.h2.jdbcx.JdbcDataSource</xa-datasource-class>
                </driver>

### (4) Postgres Driver:

                <driver name="postgresql" module="org.postgresql">
                    <driver-class>org.postgresql.Driver</driver-class>
                </driver>
            
### (5) Module:

    - directory: modules/org/postgresql/main
    - files:
        - module.xml
        - postgresql-[version].jar
    
### module.xml:

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