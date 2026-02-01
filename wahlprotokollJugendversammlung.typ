#import "template.typ": *

#show: template.with(
  title: "Wahlprotokoll der Jugendversammlung",
  title-short: "Wahlprotokoll",
  draft: true,
  logo: image("resources/Jugendlogo-transparent.jpeg", alt: "DLRG-Jugend St. Leon", fit: "cover"),
)

#v(30pt)
#align(
  center,
  grid(
    columns: (auto, auto, auto, auto),
    align: center,
    gutter: 1cm,
    [#line(length: 3cm) #text("Ort")],
    [#line(length: 3cm) #text("Datum")],
    [#line(length: 3cm) #text("Uhrzeit")],
    [#line(length: 6cm) #text("Unterschrift Wahlleiter*in")],
  ),
)

#let minheight(h, body) = layout(
  available => {
    let size = measure(body, ..available)
    let args = if size.height < h { (height: h) }
    block(..args, body)
  },
)
#set heading(numbering: none)

= Vorsitzende*r der Jugend
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

= Stellvertretende*r Vorsitzende*r der Jugend
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)



= Ressortleiter*in Finanzen
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

= Ressortleiter*in Öffentlichkeitsarbeit
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

#pagebreak()

= Ressortleiter*in Freizeiten
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

= Stellvertretende*r Ressortleiter*in Freizeiten
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

= Ressortleiter*in Kindergruppenarbeit
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

= Stellvertretende*r Ressortleiter*in Kindergruppenarbeit
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

= Ressortleiter*in für Bildung
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

#pagebreak()

= Ressortleiter*in Sonderaufgaben
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

= Stellvertretende*r Ressortleiter*in Sonderaufgaben
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

= Ressortleiter*in Raum- und Materialverwaltung
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

= Ressortleiter*in Digitales
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

= Schriftführer*in
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

#pagebreak()

= Bis zu 3 Beisitzer*innen
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

= Mindestens 4 Revisor*innen
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)

= Delegierte Bezirksjugendtag
#table(
  inset: 8pt,
  align: left,
  columns: (1.7fr, 1fr, 1fr, 1fr, 1fr),
  [Name], [Ja], [Nein], [Enthaltungen], [Wahlsieger],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
  minheight(8pt)[], [], [], [], [],
)
