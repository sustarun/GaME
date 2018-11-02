# GaME
Database project (CS387)

# Contributors
##### Sudhanshu Raj(160050041)
##### Ankit(160050044)
##### Aryan(160050053)
##### Sushant Tarun(160050055)

## Instructions to import database into your machine
1. `cd` into the directory containing the file `game.sql`.
1. Open `psql` in that directory and create a new database with the name `game`:
  `create database game`
1. Now connect to that database:
  `\c game`
1. Now import the file:
  `\i game.sql`
1. Now check if the database import succeeded:
  `\d`
    * If you don't see the tables, connect to `postgres` database by typing `\c postgres` and then type : `grant all on schema public to public;`
    * Now check again.
### Don't forget to change the database credentials in the login_details.py file.
