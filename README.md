# PostgreSQL stored procedures & triggers for nested categories

## Summary

Get all the products from a given category or any child category with a single query.
 
# Goal

We have a simple shop schema with products associated with only one category. Categories may be parent categories.
Until now we have only been displaying products associated directly with a given category.

```
SELECT
  product.id,
  product.name,
  product.category_id
FROM product
WHERE product.category_id=?
```

Now we want to be able to retrieve all products from a given category or any of its child categories in a single query.
Read about [Storing Hierarchical Data in a Database](http://www.sitepoint.com/hierarchical-data-database-2/) by Gijs Van Tulder and adjust the schema appropriately.
Keep in mind that `lft` and `rtg` must be recalculated whenever the category tree changes, so you will need to add stored procedures and triggers
to update the `lft` and `rtg` values.

You can modify `solution/schema.sql`, `solution/select_all_bikes.sql` and `solution/select_all_cars.sql`

`select_all_bikes.sql` should contain a query that retrieves all products (id,name,category_id) from the category named `Bikes` or any of its child categories, ordered by product id.
 
`select_all_cars.sql` should contain a query that retrieves all products (id,name,category_id) from the category named `Cars` or any of its child categories, ordered by product id.

## Setup

### To install dependencies 

```
npm install
```

## PgSQL test runner

### Database connection

You are required to provide a valid connection to working PostgreSQL instance. This scaffolding is tested on PostgreSQL 9.4, however, it should work on other 
database versions. 
If you just installed a fresh version of PostgreSQL server don't forget to enable listening, setting `listen_address = 'localhost'` in PostgreSQL configuration
 file (on most *nix system it's located at `/etc/postgresql/9.4/main/postgresql.conf`). You may also have to adjust Host Based Authentication Policy that is 
 described in `pg_hba.conf` file (recommended authentication method is MD5).
 
## User, database and schema

### Configuration on *nix systems

You can manually prepare the database connection or use the command below to create the user and database, and to set  appropriate ownerships.
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

Open Windows Command Prompt as the administrator ([see help](https://technet.microsoft.com/en-us/library/cc947813.aspx)).

Create the `realskill` user with `realskill` password.

```
createuser -P -U postgres -W realskill
```

You will be prompted for the new user password twice, then postgres superuser password (default is **postgres**).

Create the `realskill` database and set the ownership to  `realskill` user (you will be prompted for **postgres** password).

```
createdb -O realskill -U postgres -W realskill
```

Change the schema public (of realskill database) ownership to  `realskill` user (you will be prompted for **postgres** password).

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
