# Das Datenmodell und die Daten für den Samen und Pflanzenhandel Willibald

In diesem Projekt liegen die Daten und das Datenmodell für die fiktive Firma 'Samen und Pflanzenhandel Willibald'.

## Die Ausgangsdaten

Die Firma Willibald ist ein Traditionshaus und handelt mit Samen und Pflanzen über das Internet. Früher wurde ausschliesslich über einen Katalog verkauft. Der Katalog wurde 2000, ganze 4 Jahre nach der Eröffnung des Webshops schnell beendet. Willibald war der erste Pflanzenbedarfsladen im Internet und ist da heute noch stolz darauf.

Mit der Bestellung über die Website kann man einen Wunschtermin zur Lieferung eingeben und dieser wird aktuell zu 90% eingehalten. Die Bestellung ist ein sehr einfacher Prozess, der Kunde wählt seine Produkte und bestellt. Dabei kann er pro Bestellposition eine Lieferadresse angeben.

Die Lieferung erfolgt dann möglichst zum gewünschten Termin. Da der Versand von Pflanzen auch Sträuche und kleinere Bäume umfasst, gibt es eine Reihe von Lieferdiensten, die Willibald für die Auslieferung verwendet.

Das Datenmodell des Shops sieht wie folgt aus (Die Fragezeichen hinter den Attributen bedeuten, das es sich um keine Pflichtattribut handelt und der Inhalt NULL sein kann):

![Shopdatenmodell Willibald](Datenmodell\webshop willibald.png)

Die VereinsPartner sind das Rückgrat für Willibalds Marketing. Seit der Gründung im Jahre 1926 hat der Samen und Pflanzenhandel Willibald besondere Konditionen und Vergünstigungen für Kleingarten- und Gartenbauvereine. Für jeden Verein gibt es einen Ansprechpartner unter den Kunden Jeder Kunde kann sich für seinen Verein registrieren lassen und so die Vereinsvergünstigungen erhalten. Der Seniorchef ist überzeugt, dass dieses Konzept die Firma Willibald durch alle Krisen gebracht hat.

Zweimal im Jahr begibt sich der Samen und Pflanzenhandel Willibald auf eine Roadshow. Bei dieser Rodashow werden die Kleingarten- und Gartenbauvereine mit einem Truck voller Samen und Pflanzen besucht. Er wird eine kleine Festivität organisiert und fleissig verkauft. 2% des Umsatzes aus diesem Truck werden direkt dem Verein gespendet. Für Willibald eine sehr gute Gelegenheit die Saisonware noch vor dem Verfall an den Kunden zu bringen. Seit Beginn der Roadshow musste keine Saisonware mehr kompostiert werden. 

Von der Roadshow kommen die Daten aus dem Kassensystem. Jeder Umsatz wird eindeutig einem Vereinspartner zugeordnet. Der Kunde kann sein Kundennummer angeben. leider machen das nur etwa 20% der Kunden. Somit lassen sich diese Umsätze nicht alle einem Kunden zuordnen.

Das Datenmodell des Kassensystems:

![Datenmodell Kassensystem](Datenmodell\Roadashow.png)

Geliefert werden die Daten in einer Tabelle in der Struktur, wie sie hier auch die Tabelle Bestellung hat. Dabei sind die Attribute BestellungID, KundeID, VereinsPartnerID, Kreditkarte, GueltigBis und KKFirma redundant vorgehalten und dienen als Header Informationen für den Rest der Attribute (bzw. eigentlich die Items). Die Header-Attrbiute sind dabei immer für alle Items gleich. Hier stimmt bisher die Datenqualität.

Die BestellungID wird einfach hochgezählt, d.h. es kann zu Übereinstimmungen mit dem Webshop kommen, es handelt sich dabei aber immer um 2 unterschiedliche Bestellungen. Der Rabatt ist bei der Roadshow übrigens nicht auf der Ebene Bestellung, sondern auf Ebene der Bestellposition. Für die Roadshow werden flexiblere Rabatte benötigt, um auch wirklich alle Saisonware an den Kunden zu bringen.



## Die Auswertung

Der gewünschte Report für Willibald umfasst folgende Kenzahlen auf Granularität der Kennzahlen:

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

Diese Faktentabelle hat dann folgende Dimensionen:

![erster Data Mart für Willibald](Datenmodell\datamart.png)



Bestellungen ohne Kunden sind immer aus der Roadshow, deshalb muss ein Dummy Kunde 'Roadshow' eingefügt werden. Verkäufe in der Roadshow sind immer als pünktlich zu bewerten.

### Notwendige Transformationen

Um die Ausgangsdaten auf diesen Data Mart abzubilden sind Transformationen notwendig. Zunächst sind die Bestellungen der Roadshow gemeinsam mit den Bestellungen und Positionen in zwei Hubs im Raw Vault abzubilden.

Dann sind folgenden Business Rules anzuwenden, um die Daten anzugleichen:

1. Die Bestellungen der Vereinspartner vereinheitlichen
   Die Bestellungen der Roadshow sind direkt mit dem Vereinspartner verbunden. Dies muss nun noch für die Bestellungen des Vereinspartners aus dem Webshop erfolgen. Hierzu werden anhand der VereinsPartner.KundeIDVerein alle Bestellungen zu diesem Kunden direkt mit dem VereinsPartner verknüpft.
2. Roadshow Bestellungen zu den Kunden zurodnen
   Anhand der Kreditkarte, der KKFirma und dem GueltigBis werden die Beziehungen von Bestellung zum Kunden ergänzt.



## Verzeichnis Datenmodell

Enthält die Diagramme und die Beschreibung für die Datenmodelle. Die Beschreibung ist für das Webmodellierungstool https://app.quickdatabasediagrams.com/#/. Das generiert sowohl Diagramme als auch DDL aus diesen Texten.

Der Data Mart ist mit https://sketchviz.com/new erstellt. Die datamart.txt enthält den nötigen Code für die Generierugn des Bilds.



## Verzeichnis Webshop

Enthält die Testdaten zum Webshop im 3 Komplettlieferungen. Die Testfälle sind dort genau beschrieben.



## Verzeichnis Roadshow

Enthält n Lieferungen aus der Roadshow. Auch hier sind die Testfälle genauer beschrieben.
