# bookmark-manager

## Domain Model

![](https://docs.google.com/drawings/d/e/2PACX-1vR85-6dI9tAD4e1UIiSludAaKdhDcoh2G9LYwjY6Cg-wzZeMZQU18rk9_qXSbtYH4_O1qDEhW248i21/pub?w=960&h=720)

## User Stories

*Show a list of bookmarks*
As a user.
So that I can visit my favourite sites quickly.
I want to see a list of my favourite sites.

*Creating bookmarks*
As a user.
So that I can save a favourite site.
I want to add a bookmark to Bookmark Manager

*Delete Bookmarks*
As a user
So I can remove my bookmark from Bookmark Manager
I want to delete a bookmark

*Update Bookmark*
As a user
So I can change a bookmark in Bookmark Manager
I want to update a bookmark

*Validating URL*
As a user
So that the bookmarks I save are useful
I want to only save a valid URL


## Database Setup

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

## Test Database Setup

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager_test;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql
