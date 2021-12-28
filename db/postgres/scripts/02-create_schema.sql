-- connect as rd_user in rd_app database
\c rd_app rd_user;

-- create 'entry' table
create table entry (
    key character varying(255) not null,
    entity character varying(255) not null,
    description character varying(255),
    attributes character varying(255),
    PRIMARY KEY (entity, key)
);