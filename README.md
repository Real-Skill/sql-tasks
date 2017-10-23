# PostgreSQL - JSON builiding and aggregation

## Summary

PostgreSQL 9.3 has introduced JSON support. One of many improvements is ability to aggregate the row set into JSON array. 
The next version - 9.4 has introduced building JSON in a convenient way on the data query language level. 
This task examines knowledge of both those capabilities.

## Goal

The `breed` table describes dog breeds with a few basic characteristics like origin, original function or sizes. 
The goal of this task is to aggregate breeds by their origin so that it gives a 3-column result set as shown in the table below.

| origin | count | breeds |
|--------|-------|--------|
| Canada | 2 | JSON |
| China | 1 | JSON |
| England | 4 | JSON |
| France | 1 | JSON |
| Germany | 4 | JSON |
| Great Britain | 1 | JSON |
| Ireland | 1 | JSON |
| Japan | 1 | JSON |
| Mexico | 1 | JSON |
| Scotland | 2 | JSON |
| United States | 1 | JSON |
| Yugoslavia | 1 | JSON |

The `count` column should be a total number of breeds from each origin. 
The `breeds` field should contain json array of objects with breeds originated from a given country. 
Each object of this array should have two properties: `name` and `family` which are values of the corresponding `breed` table columns. 
The listing below represents `breeds` column value for the first group - Canada.

```
[
    {
        "name" : "Labrador Retriever", 
        "family" : "gundog, retriever"
    }, 
    {
        "name" : "Newfoundland",
        "family" : "livestock dog, sheepdog, mastiff"
    }
]
```

Finally, sort the results alphabetically by origin.  
*For the tests assertion purpose, please cast breeds `json` field into `text` data type.*

## Setup

### Install dependencies 

```
npm install
```
 
### Database connection

You are required to provide a valid connection to working PostgreSQL instance. This scaffolding is tested on PostgreSQL 9.4, however, it should work on other 
database server versions. 
If you have just installed a fresh version of PostgreSQL server don't forget to enable listening by setting `listen_address = 'localhost'` in PostgreSQL configuration
 file (on most *nix systems it's located at `/etc/postgresql/9.4/main/postgresql.conf`). You may also have to adjust Host Based Authentication Policy that is 
 described in `pg_hba.conf` file (recommended authentication method is MD5).
 
## User, database and schema

### Configuration on *nix systems

You can manually prepare a database connection or use the command below to create the user and database, and to set appropriate ownerships.
*The command below must be run from postgres system user* (switch to the root user then switch to postgres by `su postgres`). When prompted for password, enter
 password `realskill`.
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

Open Windows Command Prompt as administrator ([see help](https://technet.microsoft.com/en-us/library/cc947813.aspx)).

Create `realskill` user with `realskill` password.

```
createuser -P -U postgres -W realskill
```

You will be prompted for the new user password twice, then postgres superuser password (default is **postgres**).

Create the `realskill` database and set ownership to the `realskill` user (you will be prompted for **postgres** password).

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
