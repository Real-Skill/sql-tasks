# PostgreSQL - simple view

## Summary

A primitive one-table schema with 20 sample records is provided. 
The table contains too specific information about the dog breeds' sizes. 
The task is to provide SQL view that will horizontally aggregate sizes and also convert the measure units.

## Goal

The provided `breed` table contains the following breed size description columns:

```
male_height_min
male_height_max
male_weight_min
male_weight_max
female_height_min
female_height_max
female_weight_min
female_weight_max
```
We want to be able to roughly order breeds by height and weight. With the structure above it's a bit difficult and may cause unnecessary query complexity. 
The way it has to be solved is to horizontally aggregate height and weight; regardless of minimum, maximum or whether it is male or female. 
In other words, we want to calculate the average value of height and the average value of weight for each breed. Finally, the height and weight should be casted to an integer.

The second part of this task is to convert US measure units to the metric SI standard. 
The `breed` table describes all height values in inches and weight in pounds, but the desired units are centimeters and kilograms. 
For the dimensions use 2.54 multiplier to get centimeters and for weight 0.4536 multiplier to get kilograms.
The result data set should be ordered by weight and height, both in descending order.

Your aim is to combine all the requirements above and provide SQL view named `view_breed`. 
The view should contain the following columns: `id`, `name`, `origin`, `height`, `weight`.
Please save the view creation script in the file `solution/view_breed.sql`. 

The table below shows the results set of `SELECT * FROM view_breed` of the valid solution. 

|id|name|origin|height|weight|
|----|--------------|--------|----|----|
| 14 | Newfoundland | Canada | 69 | 57 |
| 16 | Rottweiler | Germany | 61 | 45 |
| 1 | Akita | Japan | 64 | 44 |
| 20 | German Shepherd Dog | Germany | 61 | 39 |
| 13 | Labrador Retriever | Canada | 58 | 30 |
| 12 | Irish Setter | Ireland | 66 | 29 |
| 11 | Golden Retriever | England | 58 | 29 |
| 4 | Boxer | Germany | 58 | 29 |
| 8 | Collie | Scotland | 61 | 28 |
| 7 | Chow Chow | China | 46 | 26 |
| 5 | Bull Terrier | England | 53 | 25 |
| 10 | Dalmatian | Yugoslavia | 53 | 23 |
| 9 | Border Collie | Great Britain | 51 | 17 |
| 2 | American Cocker Spaniel | United States | 38 | 12 |
| 3 | Beagle | England | 36 | 11 |
| 18 | Shetland Sheepdog | Scotland | 36 | 9 |
| 19 | Poodle (Miniature) | Germany | 30 | 7 |
| 15 | Papillon | France | 23 | 4 |
| 17 | Yorkshire Terrier | England | 20 | 3 |
| 6 | Chihuahua | Mexico | 18 | 3 |

## Setup

### Install dependencies 

```
npm install
```
 
### Database connection

You are required to provide the valid connection to working PostgreSQL instance. This scaffolding is tested on PostgreSQL 9.4, however, it should work on other 
database versions. 
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

Open Windows Command Prompt as the administrator ([see help](https://technet.microsoft.com/en-us/library/cc947813.aspx)).

Create `realskill` user with `realskill` password.

```
createuser -P -U postgres -W realskill
```

You will be prompted for the new user password twice, then postgres superuser password (default is **postgres**).

Create the `realskill` database and set ownership to `realskill` user (you will be prompted for **postgres** password).

```
createdb -O realskill -U postgres -W realskill
```

Change the schema public (of realskill database) ownership to `realskill` user (you will be prompted for **postgres** password).

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
    
