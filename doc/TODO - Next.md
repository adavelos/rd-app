## Target:

  - Implement: RD Entry Consultation
    - REST API (JAX-RA)
    - Service Layer (CDI)
    - Data Layer (JPA)
    - Unit Tests (simple / not in-memory DB nor Weld)
  - Specs:
    - Simple Key
  - Infra:
    - Maven Parents (simple abstraction)
    - Wildfly
    - Postgresql
    - Docker Compose
  - Test: 
    - Postman
    - Test FWk
  


## TODO:

  1) Implement Missing REST API and Resources
    - Missing:
      - Implement UPDATE and LIST operations
  2) Refactor Maven
      - separate module: domain model
      - parent modules (simplified)
      - BOM
  3) Dockerize:
      - Remove published postgresql port
      - Docker Compose
  4) Unit tests:
      - Simple
      - In memory DB + Weld
      - Spock
  5) Implement Spring version
      - New Module
      - Common: domain model

      

