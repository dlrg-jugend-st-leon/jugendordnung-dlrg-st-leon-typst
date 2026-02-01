#import "brieftemplate.typ": letter-simple


#set text(lang: "de")

#show: letter-simple.with(
  sender: (
    name: "Anja Ahlsen",
    address: "An der Autobahn 58, 68789 St. Leon-Rot",
    logo: image("../resources/Jugendlogo-transparent.jpeg", alt: "DLRG-Jugend St. Leon", fit: "cover"),
    extra: [
      Ressortleiter*in Beispiel\
      E-Mail: #link("mailto:jugend@st-leon.dlrg.de")[jugend\@st-leon.dlrg.de]\
    ],
  ),

  recipient: [
    Finanzamt Frankfurt\
    Einkommenssteuerstelle\
    Gutleutstraße 5\
    60329 Frankfurt
  ],

  date: "12. November 2014",
  subject: "Beispielüberschrift",
)

Sehr geehrte Damen und Herren,

#lorem(50)

#lorem(10)


Mit freundlichen Grüßen
#v(1cm)
Anja Ahlsen

