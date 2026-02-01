#import "../template.typ": *

#show: template.with(
  title: "Anwesenheitsliste Jugendversammlung",
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

    [*Name*], [*Stimmberechtigt (Ja/Nein*], [*Unterschrift*],
  ),
  [Marcel Holzhauer], [], [],
  [Celie Mas Viehl], [], [],
  [Barbara Becker], [], [],
  [Jörn Mihatsch], [], [],
  [Malte Gruber], [], [],
  [Clara Kohler], [], [],
  [Charlotte Arndt], [], [],
  [Aylin Yildiz], [], [],
  [Taima Heger], [], [],
  [Ben Keller], [], [],
  [Leonor Bitz], [], [],
  [Sophia Weger], [], [],
  [Jonas Beigel], [], [],
  [Tim Fuchsluger], [], [],
  [Laura Herling], [], [],
  [Felix Bolesta], [], [],
  [Nils Götzmann], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
  minheight(10pt)[], [], [],
)

