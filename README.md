# PostgreSQL - NOT NULL column on the existing database 

## Summary
Sometimes it happens that you need to change the schema of the table. In this task, a `users` table (already containing some data), needs an additional column.

## Goals

Add **email** column to the `users` table. It must be ***NOT NULL*** and at the same time ***UNIQUE***. 

The initial `users` table structure:

| user       | 
|------------|
| id (PK)    |
| nickname   |
| first_name |
| last_name  |
| birth_date |


Complete the missing emails' field according to the pattern:
**test${rowID}`@`test.com** for example: **test1`@`test.com**

The table below shows the results of the valid solution.

|  id   | nickname    | first_name | last_name  | birth_date | email            |
|-------|-------------|------------|------------|------------|------------------|
|  1    | cfisher0    | Chris      | Fisher     | 1985-09-30 | test1@test.com   |
|  2    | kmatthews1  | Kimberly   | Matthews   | 1990-06-25 | test2@test.com   |
|  3    | tpeters2    | Todd       | Peters     | 1988-09-08 | test3@test.com   |
|  4    | blee3       | Betty      | Lee        | 1997-10-07 | test4@test.com   |
|  5    | smoreno4    | Sharon     | Moreno     | 1989-06-15 | test5@test.com   |
|  6    | imiller5    | Irene      | Miller     | 1986-03-26 | test6@test.com   |
|  7    | jlopez6     | John       | Lopez      | 1993-08-24 | test7@test.com   |
|  8    | acole7      | Anthony    | Cole       | 1997-09-07 | test8@test.com   |
|  9    | rcruz8      | Rachel     | Cruz       | 1971-04-10 | test9@test.com   |
|  10   | dparker9    | Denise     | Parker     | 1967-02-24 | test10@test.com  |

Write your solution in `solution/query.sql` file.

## Setup

### Install dependencies 

```
npm install
```
 
### Database connection

You are required to provide a valid connection to working PostgreSQL instance. This scaffolding is tested on PostgreSQL 9.4, however, it should work on other 
database server versions. 
If you have just installed a fresh version of PostgreSQL server don't forget to enable listening by setting `listen_address = 'localhost'` in PostgreSQL configuration
 file (on most *nix system it's located at `/etc/postgresql/9.4/main/postgresql.conf`). You may also have to adjust Host Based Authentication Policy that is 
 described in `pg_hba.conf` file (recommended authentication method is MD5).
 
## User, database and schema

### Configuration on *nix systems

You can manually prepare the database connection or use the command below to create user, and database, and to set appropriate ownerships.
*The command below must be run from postgres system user* (switch to the root user, then switch to postgres by `su postgres`). When prompted for password, enter
 `realskill`.
```  
createuser realskill -P && createdb realskill -O realskill && psql -d realskill -c 'ALTER SCHEMA public OWNER TO realskill;'
```

### Configuration on Windows systems

#### Using GUI tools
Use pgadmin to set the following configuration:
```
user: realskill
password: realskill
database: realskill
schema: public
```
The database and schema owner must be set to `realskill` user.

#### Using the command line

Open Windows Command Prompt as the administrator ([see help](https://technet.microsoft.com/en-us/library/cc947813.aspx)).

Create a `realskill` user with `realskill` password.

```
createuser -P -U postgres -W realskill
```

You will be prompted for the new user password twice, then postgres superuser password (default is **postgres**).

Create  `realskill` database and set ownership to  `realskill` user (you will be prompted for **postgres** password).

```
createdb -O realskill -U postgres -W realskill
```

Change the schema public (of realskill database) ownership to the `realskill` user (you will be prompted for **postgres** password).

```
psql -d realskill -U postgres -W -c "ALTER SCHEMA public OWNER TO realskill;"
```

### Alternative configuration

All you need is to install `docker` and `docker-compose`

* [docker](https://docs.docker.com/engine/installation/)
* [docker-compose](https://docs.docker.com/compose/install/)

Then you can prepare the environment for the task on each system and should not worry about configuration thanks to the command:
    
    docker-compose up

Don't forget to turn off PostgreSQL if you have it already installed. 

### Run tests

    grunt test

Good luck!
