# Hints and Fixes during DWA Challenge



## Hints

1. Please use the schema without constraints for the load
   There is always a  schema file with "&#95;[webshop|roadshow]&#95;DDL&#95;[day#].sql" that can be used for that.





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











