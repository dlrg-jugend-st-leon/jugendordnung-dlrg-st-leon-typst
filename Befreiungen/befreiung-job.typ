#import "../Briefvorlagen/brieftemplate.typ": letter-simple

// Helper function to extract salutation from HR contact field
#let extract-salutation(hr-contact) = {
  let text = hr-contact.trim()
  if text.starts-with("Herr ") or text.starts-with("Herr,") or text.starts-with("Herr\n") {
    "Sehr geehrter Herr"
  } else if text.starts-with("Frau ") or text.starts-with("Frau,") or text.starts-with("Frau\n") {
    "Sehr geehrte Frau"
  } else {
    "Sehr geehrte Damen und Herren"
  }
}

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

/// Creates a work release request letter for DLRG volunteers
///
/// - event-name (string): Name of the event requiring time off
/// - start-date (string): Start date in DD.MM.YYYY format
/// - end-date (string): End date in DD.MM.YYYY format
/// - employee-name (string): Full name of the volunteer/employee
/// - employee-address (string): Address of the employee
/// - hr-contact (string): HR contact person with title (e.g., "Frau Frank")
#let befreiung-brief(
  event-name: "",
  start-date: "",
  end-date: "",
  employee-name: "",
  employee-address: "",
  hr-contact: "",
) = {
  set text(lang: "de")

  // Determine salutation
  let salutation = extract-salutation(hr-contact)
  let greeting = if salutation == "Sehr geehrte Damen und Herren" {
    "Sehr geehrte Damen und Herren"
  } else {
    (
      salutation
        + " "
        + hr-contact.replace("Herr ", "").replace("Frau ", "").replace("Herr,", "").replace("Frau,", "").trim()
    )
  }

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
    subject: [Bitte um Freistellung für ehrenamtliche Tätigkeit für #strong(employee-name)],
  )[
    #greeting

    im Rahmen der Teilnahme an unserer diesjährigen Veranstaltung

    #align(center, strong(event-name))
    #align(center, [vom #format-german-date(start-date) bis #format-german-date(end-date)])

    möchten wir Sie freundlichst darum bitten, unserem Mitglied #strong(employee-name) in dieser Zeit Sonderurlaub zu genehmigen, der im Rahmen des Gesetzes zur Stärkung des Ehrenamts in der Jugendarbeit vergeben werden kann. Die Arbeit bei uns ist vollständig ehrenamtlich, eine Aufwandsentschädigung oder ähnliche Vergütung erfolgt nicht.

    In der Hoffnung auf Verständnis und Bewilligung.

    Mit freundlichen Grüßen

    #v(1cm)

    Marcel Holzhauer\
    Vorsitzender der Jugend
  ]
}

