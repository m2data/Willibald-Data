# Hints and Fixes during DWA Challenge



## Hints

1. Please use the schema without constraints for the load
   There is always a  schema file with "&#95;[webshop|roadshow]&#95;DDL&#95;[day#].sql" that can be used for that.
2. duplicates and missing business keys
   The test cases for duplicates and missing business keys are not included in the loadfiles. They have to be added through the sql scripts in the directiory 'Testcases'. This is because these test cases have the potential to cause an abort while loading.
   You can add them immediately or after everything else is running. And you can add them on any of the 3 set of loadfiles for the webshop. 





## Fixes

- 11.1.23

  Wrong name and datatype in day 2 of roadshow
  changed the order of the csv file to match the order in the schema of RS_Bestellung

  

- 12.1.23

  Namechange on the 10 days early entry in the historized reference table Termintreue (description and excel file)

  

- 13.1.23

  Removed the WohnHistID from the wohnort.csv in Testdaten Periode 1+2. The csv File has now the same number of attributes as the insert-statement-file. Testdaten Periode 3/wohnort.csv was already correct,

  

- 16.1.23

  In the diagram of the Roadshow, the Product ID in the Roadshow Order (RS_Bestellung) is not marked as primary key. That has been corrected. Now in all diagrams with the Roadshow Order (RS_Bestellung) the ProduktID is marked as primary key.

  The header on the csv-file for delivery service (lieferdienst.csv) was missing on 'Testdaten Periode 1'.

  The csv-file for the reference file product type (ref_produkt_typ.csv) has now a header as well.

  

- 7.2.23

  Deleted duplicate row with KundeID 350 in 'Testdaten Periode 2/Kunde.csv'
  Minor error in the testcase description fixed

- 13.2.23
  Changed the Bestelldatum 

  - on webshop delivery 1 to 5.-11.3.2022
  - on webshop delivery 2 to 12.-18.3.2022
  - on webshop delivery 2 to 19.-25.3.2022

  The Kaufdatum on the roadshow is

  - 5.3.2022 for Day 1
  - 13.3.2022 for Day 2
  - 19.3.2022 for Day 3

  The credit card number was wrong in some cases. This is now fixed and they match between Customer and RS_Bestellung. However, please use only credit card and GueltigBis. The credit card company has some data quality issues...

  

  

  











