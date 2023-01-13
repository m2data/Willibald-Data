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











