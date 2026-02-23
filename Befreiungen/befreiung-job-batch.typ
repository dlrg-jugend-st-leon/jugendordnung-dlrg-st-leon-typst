#import "befreiung-job.typ": befreiung-brief

// Load CSV data
// CSV columns:
// 0: Zeitstempel
// 1: E-Mail-Adresse
// 2: Veranstaltungsname
// 3: Anfangsdatum der Freistellung
// 4: Enddatum der Freistellung
// 5: Vorname Nachname
// 6: Adresse des Betreuers
// 7: (Herr/Frau) + Nachname des Personalverantwortlichen im Unternehmen

#let data = csv("Befreiung für Veranstaltunge n von Job (Antworten) - Formularantworten 1.csv")

// Skip the header row and process each entry
#for (index, row) in data.slice(1).enumerate() [
  #befreiung-brief(
    event-name: row.at(2),
    start-date: row.at(3),
    end-date: row.at(4),
    employee-name: row.at(5),
    employee-address: row.at(6),
    hr-contact: row.at(7),
  )

  // Add page break between letters, but not after the last one
  #if index < data.len() - 2 {
    pagebreak()
  }
]
