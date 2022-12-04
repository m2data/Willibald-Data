-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DECLARE @dropAllConstraints NVARCHAR(MAX) = N'';

SELECT @dropAllConstraints  += N'
ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id))
    + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + 
    ' DROP CONSTRAINT ' + QUOTENAME(name) + ';'
FROM sys.foreign_keys;
EXEC sp_executesql @dropAllConstraints 

DROP TABLE IF EXISTS [Kunde];
DROP TABLE IF EXISTS [Wohnort];
DROP TABLE IF EXISTS [Lieferadresse];
DROP TABLE IF EXISTS [VereinsPartner];
DROP TABLE IF EXISTS [Kategorie];
DROP TABLE IF EXISTS [Produkt];
DROP TABLE IF EXISTS [Bestellung];
DROP TABLE IF EXISTS [Position];
DROP TABLE IF EXISTS [Lieferung];
DROP TABLE IF EXISTS [LieferDienst];

DROP TABLE IF EXISTS [Kunde_1];
DROP TABLE IF EXISTS [Wohnort_1];
DROP TABLE IF EXISTS [Lieferadresse_1];
DROP TABLE IF EXISTS [VereinsPartner_1];
DROP TABLE IF EXISTS [Kategorie_1];
DROP TABLE IF EXISTS [Produkt_1];
DROP TABLE IF EXISTS [Bestellung_1];
DROP TABLE IF EXISTS [Position_1];
DROP TABLE IF EXISTS [Lieferung_1];
DROP TABLE IF EXISTS [LieferDienst_1];

DROP TABLE IF EXISTS [Kunde_2];
DROP TABLE IF EXISTS [Wohnort_2];
DROP TABLE IF EXISTS [Lieferadresse_2];
DROP TABLE IF EXISTS [VereinsPartner_2];
DROP TABLE IF EXISTS [Kategorie_2];
DROP TABLE IF EXISTS [Produkt_2];
DROP TABLE IF EXISTS [Bestellung_2];
DROP TABLE IF EXISTS [Position_2];
DROP TABLE IF EXISTS [Lieferung_2];
DROP TABLE IF EXISTS [LieferDienst_2];

DROP TABLE IF EXISTS [Kunde_3];
DROP TABLE IF EXISTS [Wohnort_3];
DROP TABLE IF EXISTS [Lieferadresse_3];
DROP TABLE IF EXISTS [VereinsPartner_3];
DROP TABLE IF EXISTS [Kategorie_3];
DROP TABLE IF EXISTS [Produkt_3];
DROP TABLE IF EXISTS [Bestellung_3];
DROP TABLE IF EXISTS [Position_3];
DROP TABLE IF EXISTS [Lieferung_3];
DROP TABLE IF EXISTS [LieferDienst_3];
