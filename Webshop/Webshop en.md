# Test data for the webshop

This directory contains all relevant files (DDL and data) for the test data of the webshop. The three directories each mirror a periodic snapshot delivery. The description of the data model can be found in the directory ../Datenmodell.

The file _Clean_DB.sql contains an SQL for cleaning the database (SQL Server).

The directories Test Data Period 1-3 each contain:

- _Test Data Generator.xlsx - Excel file in which the test data and the INSERT statements are created.

- _Test Data_DDL.sql - complete DDL with all constraints
- _Test Data_DDL__[Period].sql - complete DDL without constraints for parallel holding of all 3 test data periods
- one INSERT_[Entity].sql per entity with insert statements in SQL Server syntax
- One [entity].csv each with a header and the data

Based on the test data generator, the INSERT-SQL for SQL Server were created, they can be reproduced at any time and/or provided with modified syntax.

For each table there is also a .csv file available.

Notes on the test data:

## Customer
Period 1: 300 records

Period 2: 350 records

Period 3: 410 records

from 1 to 2: 50 inserts, 16 updates, 1 delete

from 2 to 3: 61 inserts, 42 updates (customer ID 70 reappears)

## Residence
Period 1: 700 records

Period 2: 795 records

Period 3: 965 records

from 1 to 2: 103 inserts, 4 updates, 8 deletes

from 2 to 3: 232 inserts, 10 updates, 62 deletes

Deletes from 1 to 2 (no update of from date) each with customer ID and from date

- 3 24.07.1990
- 15 02.07.1990
- 15 25.06.1991
- 29 28.03.2019
- 300 29.07.1986
- 300 07.07.1987

Deletions from 2 to 3 (no update of date)

- 24 30.07.2016
- 24 28.10.2018


## Delivery address
Period 1: 806 records

Period 2: 905 records

Period 3: 1025 sets

from 1 to 2: 115 inserts, 16 deletes

from 2 to 3: 120 inserts. 89 updates

6 records without an equivalent in the customer (customer ID 997, 998, 999)

## AssociationPartner
Period 1: 6 records

Period 2: 7 records

Period 3: 7 records

from 1 to 2: 1 insert

from 2 to 3: 1 Insert, 1 Update, 1 Delete (renaming of the club partner Ruhrmorig to Morgenstern)

## Category
Period 1: 64 sets

Period 2: 64 sets

Period 3: 64 sets

from 1 to 2: 64 inserts, 64 deletes

from 2 to 3: 64 inserts, 64 deletes

## Product
Period 1: 126 sets

Period 2: 126 sets

Period 3: 126 sets

from 1 to 2: 126 updates

from 2 to 3: 126 updates

## Order
Period 1: 800 sets

Period 2: 1537 sets

Period 3: 2062 sets

from 1 to 2: 737 inserts

from 2 to 3: 525 inserts

Deletions:

-Between periods 1 and 2, Purchase OrderID 99, 220 and 465.

-Between periods 2 and 3 the order ID 1470 and 1288.

- [ ] Change of desired date

## Position
Period 1: 2000 records

Period 2: 3843 records

Period 3: 4368 records

from 1 to 2: 1843 inserts, 7 Deletes

from 2 to 3: 525 inserts, 6 Deletes

- [ ] Changes in delivery address

## Delivery
Period 1: 80 records

Period 2: 80 records

Period 3: 80 records

from 1 to 2: 2 inserts, 2 deletes

from 2 to 3: no changes

## Delivery service
Period 1: 1951 records

Period 2: 3769 records

Period 3: 4319 records

from 1 to 2: 1818 inserts

from 2 to 3: 550 inserts



## Reference table product type

Currently only in period 1 in the file 'ref_produkttyp.csv'.
