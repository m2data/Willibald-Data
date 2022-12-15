-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Kunde] (
    [KundeID] char(13)  NOT NULL ,
    [VereinsPartnerID] varchar(30)  NULL ,
    [Vorname] varchar(128)  NOT NULL ,
    [Name] varchar(128)  NOT NULL ,
    [Geschlecht] char  NULL ,
    [Geburtsdatum] date  NOT NULL ,
    [Telefon] varchar(20)  NULL ,
    [Mobil] varchar(20)  NULL ,
    [Email] varchar(128)  NULL ,
    [Kreditkarte] varchar(30)  NOT NULL ,
    [GueltigBis] char(5)  NOT NULL ,
    [KKFirma] varchar(128)  NOT NULL ,
    CONSTRAINT [PK_Kunde] PRIMARY KEY CLUSTERED (
        [KundeID] ASC
    )
)

CREATE TABLE [VereinsPartner] (
    [VereinsPartnerID] varchar(30)  NOT NULL ,
    [KundeIDVerein] char(13)  NOT NULL ,
    [Rabatt1] int  NOT NULL ,
    [Rabatt2] int  NOT NULL ,
    [Rabatt3] int  NOT NULL ,
    CONSTRAINT [PK_VereinsPartner] PRIMARY KEY CLUSTERED (
        [VereinsPartnerID] ASC
    )
)

CREATE TABLE [Produkt] (
    [ProduktID] int  NOT NULL ,
    [KatID] varchar(50)  NOT NULL ,
    [Bezeichnung] varchar(512)  NOT NULL ,
    [Umfang] varchar(128)  NOT NULL ,
    [Typ] int  NOT NULL ,
    [Preis] decimal(5,2)  NOT NULL ,
    [Pflanzort] varchar(128)  NOT NULL ,
    [Pflanzabstand] varchar(128)  NOT NULL ,
    CONSTRAINT [PK_Produkt] PRIMARY KEY CLUSTERED (
        [ProduktID] ASC
    )
)

CREATE TABLE [Bestellung] (
    [BestellungID] varchar(128)  NOT NULL ,
    [KundeID] char(13)  NULL ,
    [VereinsPartnerID] varchar(30)  NOT NULL ,
    [Kaufdatum] date  NOT NULL ,
    [Kreditkarte] varchar(30)  NULL ,
    [GueltigBis] char(5)  NULL ,
    [KKFirma] varchar(128)  NULL ,
    [ProduktID] int  NOT NULL ,
    [Menge] int  NOT NULL ,
    [Preis] numeric(10,2)  NOT NULL ,
    [Rabatt] numeric(5,2)  NULL ,
    CONSTRAINT [PK_Bestellung] PRIMARY KEY CLUSTERED (
        [BestellungID] ASC
    )
)

ALTER TABLE [Kunde] WITH CHECK ADD CONSTRAINT [FK_Kunde_VereinsPartnerID] FOREIGN KEY([VereinsPartnerID])
REFERENCES [VereinsPartner] ([VereinsPartnerID])

ALTER TABLE [Kunde] CHECK CONSTRAINT [FK_Kunde_VereinsPartnerID]

ALTER TABLE [VereinsPartner] WITH CHECK ADD CONSTRAINT [FK_VereinsPartner_KundeIDVerein] FOREIGN KEY([KundeIDVerein])
REFERENCES [Kunde] ([KundeID])

ALTER TABLE [VereinsPartner] CHECK CONSTRAINT [FK_VereinsPartner_KundeIDVerein]

ALTER TABLE [Bestellung] WITH CHECK ADD CONSTRAINT [FK_Bestellung_KundeID] FOREIGN KEY([KundeID])
REFERENCES [Kunde] ([KundeID])

ALTER TABLE [Bestellung] CHECK CONSTRAINT [FK_Bestellung_KundeID]

ALTER TABLE [Bestellung] WITH CHECK ADD CONSTRAINT [FK_Bestellung_VereinsPartnerID] FOREIGN KEY([VereinsPartnerID])
REFERENCES [VereinsPartner] ([VereinsPartnerID])

ALTER TABLE [Bestellung] CHECK CONSTRAINT [FK_Bestellung_VereinsPartnerID]

ALTER TABLE [Bestellung] WITH CHECK ADD CONSTRAINT [FK_Bestellung_ProduktID] FOREIGN KEY([ProduktID])
REFERENCES [Produkt] ([ProduktID])

ALTER TABLE [Bestellung] CHECK CONSTRAINT [FK_Bestellung_ProduktID]

COMMIT TRANSACTION QUICKDBD