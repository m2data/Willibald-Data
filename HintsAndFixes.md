# Hints and Fixes during DWA Challenge



## Hints

1. Please use the schema without constraints for the load
   There is always a  schema file with "&#95;[webshop|roadshow]&#95;DDL&#95;[day#].sql" that can be used for that.
2. duplicates and missing business keys
   The test cases for duplicates and missing business keys are not included in the loadfiles. They have to be added through the sql scripts in the directiory 'Testcases'. This is because these test cases have the potential to cause an abort while loading.
   You can add them immediately or after everything else is running. And you can add them on any of the 3 set of loadfiles for the webshop. 

