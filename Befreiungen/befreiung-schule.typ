#import "../Briefvorlagen/brieftemplate.typ": letter-simple

// Helper function to extract salutation from teacher name
#let extract-teacher-salutation(teacher-name) = {
  let text = teacher-name.trim()
  if text.starts-with("Herr ") or text.starts-with("Herr,") or text.starts-with("Herr\n") {
    ("Sehr geehrter Herr ", text.replace("Herr ", "").replace("Herr,", "").replace("Herr\n", "").trim())
  } else if text.starts-with("Frau ") or text.starts-with("Frau,") or text.starts-with("Frau\n") {
    ("Sehr geehrte Frau ", text.replace("Frau ", "").replace("Frau,", "").replace("Frau\n", "").trim())
  } else if text.len() > 0 {
    // No prefix found, use generic greeting with the name
    ("Sehr geehrte/r ", text)
  } else {
    // Empty teacher name
    ("Sehr geehrte Damen und Herren", "")
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

/// Creates a school release request letter for DLRG youth members
///
/// - event-name (string): Name of the event requiring school absence
/// - start-date (string): Start date in DD.MM.YYYY format
/// - end-date (string): End date in DD.MM.YYYY format
/// - student-name (string): Full name of the student
/// - student-class (string): Student's class/grade (e.g., "TGI 13", "Js2f")
/// - teacher-name (string): Teacher's name with title (e.g., "Herr Grötzinger")
/// - school-name (string): Name of the school (optional, kept as parameter for future use)
#let befreiung-schule-brief(
  event-name: "",
  start-date: "",
  end-date: "",
  student-name: "",
  student-class: "",
  teacher-name: "",
  school-name: "",
) = {
  set text(lang: "de")

  // Determine salutation and teacher name
  let (salutation-prefix, teacher-lastname) = extract-teacher-salutation(teacher-name)
  let greeting = if teacher-lastname == "" {
    salutation-prefix // "Sehr geehrte Damen und Herren"
  } else {
    salutation-prefix + teacher-lastname
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

    recipient: none, // No recipient address block for school letters

    date: today-german(),
    subject: "Unterrichtsbefreiung für " + student-name,
  )[
    #greeting,

    im Rahmen der Teilnahme an unserer diesjährigen Veranstaltung:

    #align(center, strong(event-name))

    vom #format-german-date(start-date) bis #format-german-date(end-date)

    #if student-class.trim().len() > 0 {
      [bitte ich Sie, #strong(student-name) (Klasse: #student-class), von dem Unterricht zu befreien.]
    } else {
      [bitte ich Sie, #strong(student-name) von dem Unterricht zu befreien.]
    }
    Ich beziehe mich hier auf § 4 Abs. 1 und Abs. 3 Nr. 6 SchulBesV BW.

    Bei sämtlichen Fragen stehe ich gerne zur Verfügung.

    Mit freundlichen Grüßen,

    #v(1cm)

    Marcel Holzhauer\
    Vorsitzender der Jugend
  ]
}

