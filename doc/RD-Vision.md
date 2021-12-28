## Project Attributes

	Major Characteristics:
		- RD Consultation
		- RD Admin
		- Dynamic Filters / Logical RD
		- Dynamic Views: define subsystems / subdomains
		- Supports Replication
		- Subscriptions
	Non-Functional:
		- Performant
		- Microservices Architecture
		- Extensible
		- Schemaless support
		- Adaptable
		- Containerized / Scalable => Docker + Kubernetes

	Experiment with different solutions
		- Framework
			- JEE
			- Spring
			- Micronaut
			- Quarkus
			- DI alternatives (HK2)
		- Database:
			- RDBMS (PostgreSQL)
			- Graph (Neo4J)
			- Distributed (Cassandra) or other?
		- Cache:
			- Distributed Caching (memcache, hazelcast, redis)
		- Replication
			- App level
			- DB level (distributed DB)
		- CI/CD
			- Maven
			- Test Framework
			- Jenkins
			- Sonar
			- Docker
			- Kubernetes
			- Ansible / Terraform (?)
		- Monitoring
			- Glowroot
			- Mesos (?)
			- ELK

## Phase 0: Exploring and Experimentation

    Docker
    DBs (Postgresql, MongoDB, Neo4J, Cassandra)
    Distributed Caching (Redis, Hazelcast)
    Frameworks (JEE/Wildfly, Spring Boot, Micronaut, Quarkus)
    Languages (NodeJS, Python, Scala)
    Tools (Kubernetes, Mesos, Prometheus)
    Map/Reduce, Analytics and Batch Processing (Spark)

## Phase 1: Basic Release

    Basic API
        RD Entry Management
        RD Entry Consultation
        Unit Test
    DB Options:
        Relational (Postgresl)
        Document (Mongo)
        Graph (Neo4J)
        Distributed (Cassandra)
    Java Frameworks
        JEE/WF
        Spring Boot
        Micronaut / Quarkus
    Docker
        Each solution will have it's own docker composition with required technologies

## Phase 1.1: Alternatives

    DB Options:
        Document (Mongo)
        Graph (Neo4J)
        Distributed (Cassandra)
    Java Frameworks
        Spring Boot
        Micronaut / Quarkus

## Phase 1.2: Integration
    
    Testing:
        Unit Test (integrate DI and DB)
        Integration Test framework => extract from CSMIS2 codebase
        [*] Spock framework (Groovy+Spock on top of Java and JUnit)
    CI/CD Pipeline: [TODO: explore options]
        Build + Unit Tests
        Generate Container
        Run Container
        Execute IT

## Phase 1.3: Performance

    Data loader
    Performance Tool
    Single Node / Multiple Nodes (no clustering / no LB)
    Kubernetes: clustering 

## Phase 2: RD App Enhancements

    Composite Keys
    Meta Model (filters, views, logical entities, rules)
    Subscriptions

## Phase 3: RD App Architecture

    Event Driven model [decouple meta model from entry model]
    Example RD Consumer application
    Distributed app model / Messaging integration [Kafka]
    Distributed db model / DB integration [Cassandra]
    
## Phase 4: Real RD Consumer Application

    ICS2 Core [STI => CR => NES]
        Kafka / REST / JSON / Postgresql
    Filing simplified abstraction
    Business Flows & Rules simplified abstraction
    Replication models: distributed DB vs. distributed APP
    Distributed RD Cache [redis, hazelcast]
    SEDA
    
    

    
        
    
    