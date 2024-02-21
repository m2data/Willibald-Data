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

  

- 22.2.23

  On the roadshow day 1 there was a wrong name on the VereinsPartner. Day 1 of Roadshow had 'GlueckAuf' instead of the correct name 'GlückAuf'.

  The described deletion in Bestellung (order) and Position (order item) was not in the data. Now the specified records get deleted on the second and third delivery.

  The prices on the roadshow were too high. The webshop was 1000 times higher than the roadshow. The roadshow is still more profitable than a week of webshop.

  There were no open deliveries, so I deleted some entries from Lieferung on all 3 deliveries. now we have 20 open after first week, 30 after second week and 32 after third week.

  

- 27.2.23

  On 'Webshop Periode 1/Lieferung.csv' removal of empty lines.

  On 'Webshop Periode 3/Bestellung.csv' correction of falsely formatted date attributes on the last 5 lines.

  

- 19.4.23

  There aren't as many changes in the pattern a->b->a on the relationship between Kunde and VereinsPartner as announced. This has been corrected:

  - Testdaten Periode 3/Kunde: KundeID = '12' has now 'VolleRose' in VereinsPartnerID
  - Testdaten Periode 3/Kunde: KundeID = '13' has now NULL in VereinsPartnerID
  - Testdaten Periode 2/Kunde: KundeID = '16' has now 'VolleRose' in VereinsPartnerID

  

- 20.4.23

  The content of 'Testperiode 2/Lieferung.csv' was wrong. It didn't had the changes on the file done on the 22.2.23 'no open deliveries' in it. So I now have done the deletes in there as well.
  The 'Testdaten Periode 2/INSERT_Lieferung.csv' was correct. Testing is so far only done on the insert statements, this will have to expanded to the csv files as well.

  

- 22.5.2023

  Only in all 3 of the position.csv where € symbols in the price attribute. The insert files where without it. This has been corrected. In 'Testdaten Periode 3/wohnort.csv' the missing attribute 'Land' has been added.

  

- 24.5.2023

  If you count the simple revenue (Menge/Amount * Preis/Price) for the Roadshow from the delivered files and compare it with the simple revenue of the Roadshow on the 26. of March, the figure should be the same. In reality you will get a difference of 336,- €.
  There are 2 IDs in Roadshow Delivery 2 that are also in Roadshow Delivery 3 - data quality issues...
  
  
  
- 21.2.2024

  Added a ';' to each line in the 'INSERT_<Table>.sql' - Statements.
