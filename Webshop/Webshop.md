# Testdaten für den Webshop

In diesem Verzeichnis liegen alle relevanten Dateien (DDL und Daten) für die Testdaten des Webshops. Die drei Verzeichnisse spiegeln jeweils eine periodische snapshot Lieferung. Die Beschreibung des Datenmodells findet sich im Verzeichnis ../Datenmodell.

In der Datei _Clean_DB.sql findet sich ein SQL für die Bereinigung der Datenbank (SQL Server)

In den Verzeichnissen Testdaten Periode 1-3 findet sich jeweils:

- _Testdatengenerator.xlsx  - Excel-File in dem die Testdaten und die INSERT Statements erstellt werden

- _Testdaten_DDL.sql - komplette DDL mit allen Constraints
- _Testdaten_DDL__[Periode].sql - komplette DDL ohne constraints für paralleles halten von allen 3 Testdatenperioden
- je eine INSERT_[Entität].sql pro Entität mit insert-Statements in SQL Server Syntax
- Je eine [Entität].csv mit einem Header und den Daten

Basierend auf dem Testdatengenerator wurden die INSERT-SQL für SQL Server erstellt, sie können jederzeit reproduziert und/oder mit veränderter Syntax bereit gestellt werden.

Für jede Tabelle steht zudem noch ein .csv Datei zur Verfüfung

Anmerkungen zu den Testdaten:

## Kunde
Periode 1: 300 Sätze

Periode 2: 350 Sätze

Periode 3:  410 Sätze

von 1 auf 2: 50 Inserts, 14 Updates, 1 Delete
von 2 auf 3: 61 Inserts, 41 Updates (KundeID 70 wird reanimiert)

## Wohnort
Periode 1:  700 Sätze

Periode 2:  795 Sätze

Periode 3: 965 Sätze

von 1 auf 2: 103 Inserts, 4 Updates, 8 Deletes
von 2 auf 3: 232 Inserts, 10 Updates, 62 Deletes

Löschung von 1 auf 2 (keine Aktualisierung des von Datums) mit jeweils KundeID und von-Datum
3	24.07.1990
15	02.07.1990
15	25.06.1991
29	28.03.2019
300	29.07.1986
300	07.07.1987

Löschungen von 2 auf 3 (keine Aktualisierung des von Datums)
24	30.07.2016
24	28.10.2018


## Lieferadresse
Periode 1:  800 Sätze

Periode 2: 905 Sätze

Periode 3: 1025 Sätze

von 1 auf 2: 105 Inserts
von 2 auf 3: 120 Inserts. 88 Updates

6 Sätze ohne ein Äquivalent im Kunden (KundeID 997, 998, 999)

## VereinsPartner
Periode 1:  6 Sätze

Periode 2: 7 Sätze

Periode 3: 7 Sätze

von 1 auf 2: 1 Insert
von 2 auf 3: 1, Insert, 1 Update, 1 Delete (Umbenennung des Vereinspartners Ruhrmorig in Morgenstern)

## Kategorie
Periode 1:  64 Sätze

Periode 2: 64 Sätze

Periode 3: 64 Sätze

von 1 auf 2: 64 Inserts, 64 Deletes
von 2 auf 3: 64 Inserts, 64 Deletes

## Produkt
Periode 1:  126 Sätze

Periode 2: 126 Sätze

Periode 3: 126 Sätze

von 1 auf 2: 126 Updates
von 2 auf 3: 126 Updates

## Bestellung
Periode 1:  800 Sätze

Periode 2: 1537 Sätze

Periode 3: 2062 Sätze

von 1 auf 2: 737 Inserts
von 2 auf 3: 525 Inserts

Löschungen:

​	•Zwischen Periode 1 und 2 die BestellungID 99, 220 und 465.

​	•Zwischen Periode 2 und 3 die BestellungID 1470 und die 1288.

- [ ] Änderung von Wunschdatum

## Position
Periode 1:  2000 Sätze

Periode 2: 3843 Sätze

Periode 3: 4368 Sätze

von 1 auf 2: 1843 Inserts
von 2 auf 3: 525 Inserts

- [ ] Löschen von Positionen
- [ ] Änderungen in LieferAdresse

## Lieferung
Periode 1:  80 Sätze

Periode 2: 180 Sätze

Periode 3: 80 Sätze

von 1 auf 2: 27 Updates, 2 Inserts, 2 Delete
von 2 auf 3: keine Veränderungen

## LieferDienst
Periode 1:  2000 Sätze

Periode 2:  3843 Sätze

Periode 3:  4368 Sätze

von 1 auf 2: 1843 Inserts
von 2 auf 3: 525 Inserts



## Referenztabelle Produkttyp

Aktuell nur in Periode 1 in der Datei 'ref_produkttyp.csv'.
