#import "../template.typ": *

#show: template.with(
  title: "Anwesenheitsliste Zeltlagerbesprechung",
  title-short: "Anwesenheitsliste",
  draft: true,
  logo: image("../resources/Jugendlogo-transparent.jpeg", alt: "DLRG-Jugend St. Leon", fit: "cover"),
)

#v(30pt)
#align(
  center,
  grid(
    columns: (auto, auto, auto),
    align: center,
    gutter: 2cm,
    [#line(length: 3cm) #text("Ort")], [#line(length: 3cm) #text("Datum")], [#line(length: 3cm) #text("Uhrzeit")],
  ),
)

#let minheight(h, body) = layout(
  available => {
    let size = measure(body, ..available)
    let args = if size.height < h { (height: h) }
    block(..args, body)
  },
)

#table(

  inset: 8pt,
  align: left,
  columns: (1fr, 1.9fr, 1fr),
  table.header(

    [*Name*], [*Funktion*], [*Unterschrift*],
  ),
  [Marcel Holzhauer], [Vorsitzende*r der Jugend], [],
  [Celia Mas Viehl], [Stellvertretende*r Vorsitzende*r der Jugend], [],
  [Barbara Becker], [Ressortleiter*in Finanzen], [],
  [Jörn Mihatsch], [Ressortleiter*in Freizeiten], [],
  [Malte Gruber], [Stellvertretende*r Ressortleiter*in Freizeiten], [],
  [Clara Kohler], [Ressortleiter*in Kindergruppenarbeit], [],
  [Charlotte Arndt], [Stellvertretende*r Ressortleiter*in Kindergruppenarbeit],

  [], [Aylin Yildiz], [Ressortleiter*in Öffentlichkeitsarbeit],
  [], [Taima Heger], [Ressortleiter*in Sonderaufgaben],
  [], [Ben Keller], [Stellvertretende*r Ressortleiter*in Sonderaufgaben],
  [], [Leonor Bitz], [Schriftführer*in],
  [], [Sophia Weger], [Ressortleiter*in für Bildung],
  [], [Jonas Beigel], [Ressortleiter*in Raum- und Materialverwaltung],
  [], [Tim Fuchsluger], [Ressortleiter*in Digitales],
  [], [Laura Herling], [Beisitzer*in],
  [], [Felix Bolesta], [Beisitzer*in],
  [], [Nils Götzmann], [Beisitzer*in],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [], minheight(10pt)[], [],
  [],
)

