-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

EXEC sp_rename [Kunde], [Kunde_2];
EXEC sp_rename [Wohnort], [Wohnort_2];
EXEC sp_rename [Lieferadresse], [Lieferadresse_2];
EXEC sp_rename [VereinsPartner], [VereinsPartner_2];
EXEC sp_rename [Kategorie], [Kategorie_2];
EXEC sp_rename [Produkt], [Produkt_2];
EXEC sp_rename [Bestellung], [Bestellung_2];
EXEC sp_rename [Position], [Position_2];
EXEC sp_rename [Lieferung], [Lieferung_2];
EXEC sp_rename [LieferDienst], [LieferDienst_2];

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

CREATE TABLE [Wohnort] (
    [KundeID] char(13)  NOT NULL ,
    [Von] date  NOT NULL ,
    [Bis] date  NULL ,
    [Strasse] varchar(128)  NOT NULL ,
    [Hausnummer] varchar(10)  NOT NULL ,
    [Adresszusatz] varchar(128)  NULL ,
    [Plz] varchar(10)  NOT NULL ,
    [Ort] varchar(128)  NOT NULL ,
    [Land] varchar(128)  NULL ,
    CONSTRAINT [PK_Wohnort] PRIMARY KEY CLUSTERED (
        [KundeID] ASC,[Von] ASC
    )
)

CREATE TABLE [Lieferadresse] (
    [LieferAdrID] int  NOT NULL ,
    [KundeID] char(13)  NOT NULL ,
    [Strasse] varchar(128)  NOT NULL ,
    [Hausnummer] varchar(10)  NOT NULL ,
    [Adresszusatz] varchar(128)  NULL ,
    [Plz] varchar(10)  NOT NULL ,
    [Ort] varchar(128)  NOT NULL ,
    [Land] varchar(128)  NULL ,
    CONSTRAINT [PK_Lieferadresse] PRIMARY KEY CLUSTERED (
        [LieferAdrID] ASC
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

CREATE TABLE [Kategorie] (
    [KatID] varchar(50)  NOT NULL ,
    [OberKatID] varchar(50)  NULL ,
    [Name] varchar(512)  NOT NULL ,
    CONSTRAINT [PK_Kategorie] PRIMARY KEY CLUSTERED (
        [KatID] ASC
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
    [BestellungID] bigint  NOT NULL ,
    [KundeID] char(13)  NOT NULL ,
    [AllgLieferAdrID] int  NOT NULL ,
    [Bestelldatum] date  NOT NULL ,
    [Wunschdatum] date  NOT NULL ,
    [Rabatt] numeric(5,2)  NOT NULL ,
    CONSTRAINT [PK_Bestellung] PRIMARY KEY CLUSTERED (
        [BestellungID] ASC
    )
)

CREATE TABLE [Position] (
    [BestellungID] bigint  NOT NULL ,
    [PosID] bigint  NOT NULL ,
    [ProduktID] int  NOT NULL ,
    [SpezLieferAdrID] int  NULL ,
    [Menge] int  NOT NULL ,
    [Preis] numeric(10,2)  NOT NULL ,
    CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED (
        [BestellungID] ASC,[PosID] ASC
    )
)

CREATE TABLE [Lieferung] (
    [BestellungID] bigint  NOT NULL ,
    [PosID] bigint  NOT NULL ,
    [LieferAdrID] int  NOT NULL ,
    [LieferDienstID] varchar(30)  NOT NULL ,
    [LieferDatum] date  NOT NULL ,
    CONSTRAINT [PK_Lieferung] PRIMARY KEY CLUSTERED (
        [BestellungID] ASC,[PosID] ASC,[LieferAdrID] ASC,[LieferDienstID] ASC
    )
)

CREATE TABLE [LieferDienst] (
    [LieferDienstID] varchar(30)  NOT NULL ,
    [Name] varchar(128)  NOT NULL ,
    [Telefon] varchar(20)  NOT NULL ,
    [Fax] varchar(20)  NULL ,
    [Email] varchar(128)  NOT NULL ,
    [Strasse] varchar(128)  NOT NULL ,
    [Hausnummer] varchar(10)  NOT NULL ,
    [Plz] varchar(10)  NOT NULL ,
    [Ort] varchar(128)  NOT NULL ,
    [Land] varchar(128)  NULL ,
    CONSTRAINT [PK_LieferDienst] PRIMARY KEY CLUSTERED (
        [LieferDienstID] ASC
    )
)

ALTER TABLE [Kunde] WITH NOCHECK ADD CONSTRAINT [FK_Kunde_VereinsPartnerID] FOREIGN KEY([VereinsPartnerID])
REFERENCES [VereinsPartner] ([VereinsPartnerID])

ALTER TABLE [Kunde] NOCHECK CONSTRAINT [FK_Kunde_VereinsPartnerID]

ALTER TABLE [Wohnort] WITH NOCHECK ADD CONSTRAINT [FK_Wohnort_KundeID] FOREIGN KEY([KundeID])
REFERENCES [Kunde] ([KundeID])

ALTER TABLE [Wohnort] NOCHECK CONSTRAINT [FK_Wohnort_KundeID]

ALTER TABLE [Lieferadresse] WITH NOCHECK ADD CONSTRAINT [FK_Lieferadresse_KundeID] FOREIGN KEY([KundeID])
REFERENCES [Kunde] ([KundeID])

ALTER TABLE [Lieferadresse] NOCHECK CONSTRAINT [FK_Lieferadresse_KundeID]

ALTER TABLE [VereinsPartner] WITH NOCHECK ADD CONSTRAINT [FK_VereinsPartner_KundeIDVerein] FOREIGN KEY([KundeIDVerein])
REFERENCES [Kunde] ([KundeID])

ALTER TABLE [VereinsPartner] NOCHECK CONSTRAINT [FK_VereinsPartner_KundeIDVerein]

ALTER TABLE [Kategorie] WITH NOCHECK ADD CONSTRAINT [FK_Kategorie_OberKatID] FOREIGN KEY([OberKatID])
REFERENCES [Kategorie] ([KatID])

ALTER TABLE [Kategorie] NOCHECK CONSTRAINT [FK_Kategorie_OberKatID]

ALTER TABLE [Produkt] WITH NOCHECK ADD CONSTRAINT [FK_Produkt_KatID] FOREIGN KEY([KatID])
REFERENCES [Kategorie] ([KatID])

ALTER TABLE [Produkt] NOCHECK CONSTRAINT [FK_Produkt_KatID]

ALTER TABLE [Bestellung] WITH NOCHECK ADD CONSTRAINT [FK_Bestellung_KundeID] FOREIGN KEY([KundeID])
REFERENCES [Kunde] ([KundeID])

ALTER TABLE [Bestellung] NOCHECK CONSTRAINT [FK_Bestellung_KundeID]

ALTER TABLE [Bestellung] WITH NOCHECK ADD CONSTRAINT [FK_Bestellung_AllgLieferAdrID] FOREIGN KEY([AllgLieferAdrID])
REFERENCES [Lieferadresse] ([LieferAdrID])

ALTER TABLE [Bestellung] NOCHECK CONSTRAINT [FK_Bestellung_AllgLieferAdrID]

ALTER TABLE [Position] WITH NOCHECK ADD CONSTRAINT [FK_Position_BestellungID] FOREIGN KEY([BestellungID])
REFERENCES [Bestellung] ([BestellungID])

ALTER TABLE [Position] NOCHECK CONSTRAINT [FK_Position_BestellungID]

ALTER TABLE [Position] WITH NOCHECK ADD CONSTRAINT [FK_Position_ProduktID] FOREIGN KEY([ProduktID])
REFERENCES [Produkt] ([ProduktID])

ALTER TABLE [Position] NOCHECK CONSTRAINT [FK_Position_ProduktID]

ALTER TABLE [Position] WITH NOCHECK ADD CONSTRAINT [FK_Position_SpezLieferAdrID] FOREIGN KEY([SpezLieferAdrID])
REFERENCES [Lieferadresse] ([LieferAdrID])

ALTER TABLE [Position] NOCHECK CONSTRAINT [FK_Position_SpezLieferAdrID]

ALTER TABLE [Lieferung] WITH NOCHECK ADD CONSTRAINT [FK_Lieferung_BestellungID_PosID] FOREIGN KEY([BestellungID], [PosID])
REFERENCES [Position] ([BestellungID], [PosID])

ALTER TABLE [Lieferung] NOCHECK CONSTRAINT [FK_Lieferung_BestellungID_PosID]

ALTER TABLE [Lieferung] WITH NOCHECK ADD CONSTRAINT [FK_Lieferung_LieferAdrID] FOREIGN KEY([LieferAdrID])
REFERENCES [Lieferadresse] ([LieferAdrID])

ALTER TABLE [Lieferung] NOCHECK CONSTRAINT [FK_Lieferung_LieferAdrID]

ALTER TABLE [Lieferung] WITH NOCHECK ADD CONSTRAINT [FK_Lieferung_LieferDienstID] FOREIGN KEY([LieferDienstID])
REFERENCES [LieferDienst] ([LieferDienstID])

ALTER TABLE [Lieferung] NOCHECK CONSTRAINT [FK_Lieferung_LieferDienstID]

COMMIT TRANSACTION QUICKDBD