﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

EXEC sp_rename [RS_Bestellung], [RS_Bestellung_1];


CREATE TABLE [RS_Bestellung] (
    [BestellungID] varchar(128)  NOT NULL ,
    [KundeID] char(13)  NULL ,
    [VereinsPartnerID] int  NOT NULL ,
    [Kaqufdatum] date  NOT NULL ,
    [Kreditkarte] varchar(30)  NULL ,
    [GueltigBis] char(5)  NULL ,
    [KKFirma] varchar(128)  NULL ,
    [ProduktID] int  NOT NULL ,
    [Menge] int  NOT NULL ,
    [Preis] numeric(10,2)  NOT NULL ,
    [Rabatt] numeric(5,2)  NULL
)
