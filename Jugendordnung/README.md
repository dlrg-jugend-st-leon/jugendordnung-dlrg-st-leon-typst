# Jugendordnung der DLRG St. Leon e.V.

Dieses Repository enthält die Jugendordnung der DLRG St. Leon e.V., gesetzt mit [Typst](https://typst.app/) – einem modernen Textsatzsystem.

## 📋 Über das Projekt

Die Jugendordnung regelt die Struktur, Aufgaben und Arbeitsweise der DLRG-Jugend in der Ortsgruppe St. Leon e.V. Sie definiert:

- **Grundsätze**: Name, Mitgliedschaft, Ziele und Eigenständigkeit der DLRG-Jugend
- **Organe**: Jugendversammlung und Jugendvorstand mit ihren jeweiligen Aufgaben
- **Wahlordnung**: Regelungen zu Wahlen, Abstimmungen und Beschlussfassungen
- **Allgemeine Bestimmungen**: Geschäftsordnung, Ausschüsse und Änderungsverfahren

## 🚀 Voraussetzungen

Um dieses Projekt zu kompilieren, benötigen Sie:

- [Typst](https://github.com/typst/typst) (CLI oder Desktop-App)
- Alternativ: [Typst Web App](https://typst.app/)

### Installation von Typst

**macOS (Homebrew):**
```bash
brew install typst
```

**Linux/Windows:**
Siehe [offizielle Installationsanleitung](https://github.com/typst/typst#installation)

## 📁 Projektstruktur

```
.
├── main.typ                    # Hauptdokument mit Inhalt der Jugendordnung
├── template.typ                # Vorlage mit Layout und Formatierung
├── main.pdf                    # Kompilierte PDF-Version
├── resources/                  # Ressourcen-Ordner
│   ├── Jugendlogo-transparent.jpeg
│   └── welle-outline-saphir.svg
├── Landesjugend/              # Referenzdokumente der Landesjugend
│   ├── Geschaeftsordnung_der_DLRG-Jugend_Baden_2025.pdf
│   └── Ordnung_der_DLRG-Jugend_Baden_2025.pdf
└── README.md                   # Diese Datei
```

## 🔨 Verwendung

### PDF kompilieren

Um die Jugendordnung als PDF zu generieren, führen Sie folgenden Befehl im Projektverzeichnis aus:

```bash
typst compile main.typ
```

Dies erstellt die Datei `main.pdf` im selben Verzeichnis.

### Watch-Modus (automatische Neukompilierung)

Für die Entwicklung können Sie den Watch-Modus nutzen:

```bash
typst watch main.typ
```

Das PDF wird nun automatisch bei jeder Änderung neu kompiliert.

### Mit der Typst Web App

1. Öffnen Sie [typst.app](https://typst.app/)
2. Erstellen Sie ein neues Projekt
3. Laden Sie die Dateien `main.typ`, `template.typ` und den `resources/`-Ordner hoch
4. Das PDF wird automatisch generiert

## ✏️ Bearbeitung

### Inhalt ändern

Die Inhalte der Jugendordnung befinden sich in `main.typ`. Hier können Sie:

- Texte anpassen
- Abschnitte hinzufügen oder entfernen
- Strukturen ändern

### Layout anpassen

Die Vorlage und das Layout sind in `template.typ` definiert. Diese Datei enthält:

- **Seitenlayout**: Kopf- und Fußzeilen, Ränder
- **Farben**: DLRG-Jugend-Farben (Jugend-Blau)
- **Typografie**: Schriftarten und -größen
- **Nummerierung**: Automatische Nummerierung von Abschnitten und Absätzen

### Wichtige Features der Vorlage

- **Automatische Abschnittsnummerierung**: Römische Ziffern für Hauptkapitel
- **§-Paragraph-Erkennung**: Automatische Formatierung von Paragraphen
- **Enumerationen**: Mehrstufige Nummerierung nach Rechtsförmlichkeits-Standards
- **Kopf-/Fußzeilen**: Mit DLRG-Logo und Kontaktdaten
- **Draft-Modus**: Kann in `main.typ` aktiviert werden

## 🎨 Typst-Syntax

Typst verwendet eine moderne, intuitive Syntax. Hier einige Beispiele:

```typst
= Hauptüberschrift
== Unterüberschrift

+ Nummerierte Liste
  + Unterpunkt
    + Weiterer Unterpunkt

- Unnummerierte Liste

*Fett* und _kursiv_

#link("https://example.com")[Linktext]
```

Weitere Informationen finden Sie in der [Typst-Dokumentation](https://typst.app/docs).

## 📚 Referenzdokumente

Im Ordner `Landesjugend/` befinden sich Referenzdokumente:

- Ordnung der DLRG-Jugend Baden (2025)
- Geschäftsordnung der DLRG-Jugend Baden (2025)

Diese dienen als Orientierung und rechtlicher Rahmen für die Ortsgruppen-Jugendordnung.

## 🤝 Mitwirken

Änderungen und Verbesserungsvorschläge sind willkommen:

1. Repository forken
2. Feature-Branch erstellen (`git checkout -b feature/verbesserung`)
3. Änderungen committen (`git commit -m 'Füge Verbesserung hinzu'`)
4. Branch pushen (`git push origin feature/verbesserung`)
5. Pull Request erstellen

## 📄 Lizenz

Dieses Dokument unterliegt den Regelungen der DLRG-Jugend und der DLRG St. Leon e.V.

## 📞 Kontakt

**DLRG-Jugend St. Leon**  
An der Autobahn 58  
68789 St. Leon-Rot  
E-Mail: jugend@st-leon.dlrg.de

## 🔗 Links

- [DLRG St. Leon e.V.](https://st-leon.dlrg.de/)
- [Typst](https://typst.app/)
- [Typst Dokumentation](https://typst.app/docs)
- [DLRG-Jugend](https://www.dlrg-jugend.de/)