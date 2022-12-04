# Testfälle mit dem Samen und Pflanzenhandel Willibald

Im Datenmodell und in den Daten sind typische Probleme für ein Data Vault Warehouse hinterlegt. Die Fälle erstrecken sich von Stage über Raw und Business Vault bis zum Data Mart. 



## Genereller Funktionalitätstest der Raw Vault Beladung

Die Funktionalität von Stage und Raw Vault kann einfach überprüft werden. Hierzu müssen lediglich die Ursprungsdaten aus dem Raw Vault wiederhergestellt werden und gegen die Ursprungslieferung aus der Stage verglichen. So kann in einem Test sichergestellt werden, dass alle Daten korrekt geladen wurden.



## Testfälle und Musterabdeckung im Datenmodell

Das Datenmodell enthält typische Fälle/Probleme/Herausforderungen/Muster für den Aufbau eines Data Vault. Das heisst nicht, dass man unbedingt das hier vorgeschlagene Lösungsmuster verwenden muss. Es reicht die dahinter liegende Situation so zu lösen, dass sich die Ladetabellen wieder herstellen lassen. Eine breite Abdeckung der typischen Lösungsmuster ist dennoch wünschenswert. Hier eine Übersicht der Data Vault Pattern in der Reihenfolge ihrer Veröffentlichung.

![Publizierte Data Vault Pattern](Willibald-Data\Datenmodell\Publizierte-Data-Vault-Pattern.png)



### Hierachical Link

Die Kategorie zum Produkt ist ein klassischer Hierarchical Link.

![Kategorie als hierarchical Link](Datenmodell\Kategorie_hier_link.png)



### Multi-Active Satellite

Die Entität Wohnorte hat asl Primärschlüssel die KundeID und die Zeit und ist damit prädestiniert für einen multi-active Satelliten.

![Wohnort mit weak key](Datenmodell\Kunde_Wohnort.png)



### Identifying Relationship und driving Key Patterns

Zwischen Bestellung und Position kann sich die Beziehung nicht ändern. Die Schlüsselsituation macht aus jeder Änderung eine Löschung und eine Neuanlage.

![Identifying und driving key Relationships](Datenmodell\driving-identifying-relationships.png)

Bei allen anderen Beziehungen können sich die Beziehungen ändern. Die Testfälle sind alle auf dem Fremdschlüssel im Kunden zum Vereinspartner implementiert. Hier kommt es zu folgenden Situationen:

- der Fremdschlüssel ist optional und somit auch NULL
- der Fremdschlüssel wechselt zwischen Vereinspartnern
- der Fremdschlüssel wechselt von gültig auf ungültig und in einigen Fällen dann wieder zurück auf gültig



### m:n Tabelle ohne eigenen Key

Die Tabelle der Lieferungen hat keinen eigenen Primärschlüssel und erfolgt in der Regel auch nur einmal, da nur die erfolgreichen Lieferungen an das dwh übermittelt werden.

![Lieferung als m:n](Datenmodell\Lieferung.png)

Das lässt sich auf mehrere mögliche Arten lösen: keyed instance, transactional link, dependend child link, ...



### Integration der Bestellung

Wir haben 2 Quellen. Diese sollen integriert in die Hubs Bestellung und Position geladen werden. Die Primärschlüssel beider Systeme werden einfach nur hochgezählt.

![Bestellung - webshop vs. Roadshow](Datenmodell\Bestellung-webshop-vs-roadshow.png)



### Referenztabelle

Für den Produkttyp gibt es eine Liste von Referenzwerten:

| Produkttyp | Bezeichnung |
| ---------- | ----------- |
| 1          | Samen       |
| 2          | Setzling    |
| 3          | Pflanze     |
| 4          | Strauch     |
| 5          | Baum        |



## Testfälle in den Daten

Wir bekommen 3 komplette Lieferungen. Die Asuwertung der Daten erfolgt auf diesen 3 Lieferungen und muss jeweils die korrekten Daten liefern.



### Dubletten in den Ladedaten

Im Produkt sind 2 Arten von Dubletten. Im ersten Fall handelt es sich um eine tatsächliche Dublette, alle Attribute sind gleich. Im zweiten Fall widersprechen sich die Attribute.

- tdb: ProduktID dokumentieren

Hier wollen wir nur sehen, wie damit umgegangen wird.



### Sätze ohne Business Key

In der Tabelle Lieferdienst gibt es Datensätze mit gültigen Werten ohne Schlüssel. Auch hier nur die Frage, wie damit umgegangen wird.

- tbd: Satz anlegen und hier zeigen



### Änderungen in den Kundendaten

Ein ganz einfacher Testfall, die Daten im Kunden ändern sind in Lieferung 2 auf einen Wert und bekommen in Lieferung 3 wieder die Werte aus Lieferung 1.

- tbd: KundeID dokumentieren



### Löschungen im Kunden

Im Kunden gibt es Fälle, bei denen der Kunde in der zweiten Lieferung gelöscht wurde und in der dritten Lieferung wieder auftaucht:

- tbd: KundeID dokumentieren



### Lieferadressen ohne Kunde

In der ersten Lieferung sind Lieferadressen enthalten, für die es im Kunden keinen Satz mit gleicher KundeID gibt.

- tbd: Satz anlegen und dokumentieren



### Löschungen von Bestellungen

Die Bestellungen sind zählungsrelevant und werden zwischen den Lieferungen gelöscht.

Gelöschte Lieferungen:

- zwischen 1 und 2
- zwischen 2 und 3



### Änderungen in den Dimensionen

Die Hierarchie der Produktkategorie ändert sich komplett mit beiden Lieferungen. Wir haben also 3 unetrschiedliche Produkthierachien.  Diese sollen als as-was zum jeweiligen Berichtszeitpunkt angezeigt werden.



## Kennzahlen als Ergebnis

Für den Data Mart sind weitere Transformationen notwendig.

![Data Mart Willibald](Datenmodell/datamart.png)



### Erstellung der Faktentabelle

Die Erstellung der Faktentabelle mit den Kennzahlen:

- Menge
  Die Menge an bestellten Produkten pro Produkt. Diese Kennzahl wird direkt aus der Bestellposition übernommen.
- Erlös
  Die Höhe des Geldes, die für die bestellte Produktmenge zu bezahlen ist. Hierzu werden Menge und Preis aus er Bestellposition multipliziert und anschliessend der Rabatt abgezogen.
- Menge in offenen Aufträgen
  Die Kennzahl Menge für Bestellungen, die noch nicht vollständig geliefert sind.
- Erlös in offenen Aufträgen
  Die Kennzahl Erlös für Bestellungen, die nocht nicht vollständig geliefert sind.
- Abweichung zwischen Wunsch und Lieferdatum in Tagen
  Wenn jede Postion geliefert wurde, errechnet sich die Abweichung aus dem Bestellung.Wunschdatum und dem letzten Lieferung.LieferDatum. Wenn die Lieferung vor dem Wunschtermin erfolgt ist, dann ist die Abweichung negativ. Willibald will pünktlichst liefern, denn auch zu frühe Lieferungen führen beim Kunden zu Problemen (Pflege von Setzlingen).
- Bestellungen ohne Kunden sind immer aus der Roadshow, deshalb muss ein Dummy Kunde 'Roadshow' eingefügt werden.



### Notwendige Transformationen durch Business Rules 

1. Die Bestellungen der Vereinspartner vereinheitlichen
   Die Bestellungen der Roadshow sind direkt mit dem Vereinspartner verbunden. Dies muss nun noch für die Bestellungen des Vereinspartners aus dem Webshop erfolgen. Hierzu werden anhand der VereinsPartner.KundeIDVerein alle Bestellungen zu diesem Kunden direkt mit dem VereinsPartner verknüpft.
2. Roadshow Bestellungen zu den Kunden zurodnen 
   Anhand der Kreditkarte, der KKFirma und dem GueltigBis werden die Beziehungen von Bestellung zum Kunden ergänzt



### Historisierte Referenztabelle für die Dimension Termintreue

Für den Data Mart wird noch eine historisierte Referenzabelle nötig. Gestartet wird mit folgenden Werten:

| Anzahl Tage von | Anzahl Tage bis | Bezeichnung                | Bewertung        |
| :-------------: | :-------------: | -------------------------- | ---------------- |
|    -1000000     |       -5        | mehr als 5 Tage früher     | viel zu früh     |
|       -5        |        0        | bis zu 5 Tagen zu früh     | zu früh          |
|        0        |        1        | pünktlich                  | pünktlich        |
|        1        |        4        | bis zu 3 Tagen zu spät     | zu spät          |
|        4        |       10        | 4 bis 10 Tage zu spät      | deutlich zu spät |
|       10        |     1000000     | mehr als 10 Tage spät      | viel zu spät     |
|       xxx       |       xxx       | Auftrag zu lange aktiv     | Fehler           |
|       zzz       |       zzz       | Abverkauf, keine Lieferung | irrelevant       |

Dann muss sich der Wert mit Beginn von Periode 2 ändern:

| Anzahl Tage von | Anzahl Tage bis | Bezeichnung                | Bewertung        |
| :-------------: | :-------------: | -------------------------- | ---------------- |
|    -1000000     |       -10       | mehr als 10 Tage zu früh   | viel zu früh     |
|       -10       |       -4        | bis zu 10 Tagen zu früh    | zu früh          |
|       -4        |       -1        | bis zu 3 Tagen zu früh     | zu früh          |
|       -1        |        1        | pünktlich                  | pünktlich        |
|        1        |        4        | bis zu 3 Tagen zu spät     | zu spät          |
|        4        |       10        | bis zu 10 Tage zu spät     | deutlich zu spät |
|       10        |     1000000     | mehr als 10 Tage spät      | viel zu spät     |
|       xxx       |       xxx       | Auftrag zu lange aktiv     | Fehler           |
|       zzz       |       zzz       | Abverkauf, keine Lieferung | irrelevant       |



## Nicht getestet

- Übernahme eines Load Date Timestamp aus den Inputdaten
