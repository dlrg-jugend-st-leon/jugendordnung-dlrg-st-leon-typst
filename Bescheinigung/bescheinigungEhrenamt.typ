#import "../Briefvorlagen/brieftemplate.typ": letter-simple

// Helper function to format German date
#let format-german-date(date-str) = {
  // Input format: DD.MM.YYYY
  // Output format: DD.MM.YY
  let parts = date-str.split(".")
  if parts.len() == 3 {
    let day = parts.at(0)
    let month = parts.at(1)
    let year = parts.at(2)
    // If year is 4 digits, take last 2
    if year.len() == 4 {
      year = year.slice(2)
    }
    day + "." + month + "." + year
  } else {
    date-str
  }
}

// Helper function to get today's date in German format
#let today-german() = {
  let now = datetime.today()
  let day = str(now.day())
  let month = str(now.month())
  let year = str(now.year()).slice(2)

  // Pad with zeros if needed
  if day.len() == 1 {
    day = "0" + day
  }
  if month.len() == 1 {
    month = "0" + month
  }

  day + "." + month + "." + year
}

#let bescheinigung-brief(
  employee-name: "",
  employee-address: "",
) = {
  set text(lang: "de")

  letter-simple(
    sender: (
      name: "DLRG-Jugend St. Leon",
      address: "An der Autobahn 58, 68789 St. Leon-Rot",
      logo: image("../resources/Jugendlogo-transparent.jpeg", alt: "DLRG-Jugend St. Leon", fit: "cover"),
      extra: [
        DLRG St. Leon e.V.\
        \
        Vorsitzender der Jugend\
        Marcel Holzhauer\

      ],
    ),

    recipient: [
      #employee-name \
      #employee-address
    ],

    date: today-german(),
    subject: [Bescheinigung über ehrenamtliche Tätigkeit],
  )[
    In diesem Schreiben möchte ich auf die besonderen ehrenamtlichen Tätigkeiten
    von #employee-name aufmerksam machen.

    Sie ist aktiv an der Mitgestaltung des Vereins DLRG St. Leon beteiligt.
    #employee-name hilft kontinuierlich und zuverlässig bei unseren zahlreichen Veranstaltungen, die wir für Kinder und
    Jugendliche durchführen. Sie leistet als Betreuerin bei unseren Veranstaltungen, an denen bis zu 70 Kinder
    von 6 bis 14 Jahren teilnehmen, einen essenziellen Beitrag.

    #employee-name ist eine wichtige Helferin. Engagiert und motiviert erfüllt sie ihre übertragenen Aufgaben zu unserer vollen Zufriedenheit. Durch ihr hilfsbereites und freundliches Wesen konnte sie ein vertrauensvolles Verhältnis zu den Kindern aufbauen.

    Bei Rückfragen stehe ich Ihnen gerne zur Verfügung.

    Mit freundlichen Grüßen

    #v(1cm)

    Marcel Holzhauer\
    Vorsitzender der Jugend
  ]
}

#bescheinigung-brief(
  employee-address: "Teststraße 2
68789 St. Leon-Rot",
  employee-name: "Vorname Nachname",
)

