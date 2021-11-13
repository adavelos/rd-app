### Build WF Extended Image
        *** with cache ***
                docker build --tag=wildfly_rdapp .

        *** without using cache ***
                docker build --tag=wildfly_rdapp --no-cache .

### Build Postgress Extended Image
        docker build --tag=postgres_rdapp -f Dockerfile.pg

### Run Postgres Extended Image
        docker run -v pgdata:/var/lib/postgresql/data --network rdapp_network --rm --hostname postgres --name postgres_rdapp -e POSTGRES_PASSWORD=password -d -p 5432:5432 postgres_rdapp

### Run WF Extended Image
        docker run --network rdapp_network --rm --name wildfly_rdapp  -p 8080:8080 -p 9990:9990 wildfly_rdapp

### Run PSQL CLI (execute queries, verify proper startup)

        enter into postgresql container console: 
                docker exec -it postgres_rdapp /bin/bash 
                su - postgres 
        connect to [rd_app] database as [rd_user] user:
                psql -d rd_app -U rd_user
        check that schema is created
                select * from entry; 

### Run WF Image (non-extended) with Admin
        - enter into postgresql container console :
                docker run --rm -p 8080:8080 -p 9990:9990 -it jboss/wildfly /opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
        - enter into wildfly container console :
                docker exec -it wildfly_rdapp /bin/bash 
        - run JBOSS CLI from container not bound to localhost:
                /opt/jboss/wildfly/bin/jboss-cli.sh -c --file=~/test --controller=ac21c2d8e212:9990

### Create Network (before running any container)
        docker network create rdapp_network
        
        (1) Connect:
                docker network connect postgres_rdapp
                docker network connect wildfly_rdapp
        (2) Create:
                docker run --network rdapp_network ...

        Inspect:
                docker network inspect rdapp_network

### Docker Volumes
        
        create postgresql volume:
                docker volume create pgdata