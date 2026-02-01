#let jugend-footer = context [
  #place(top + right, text(fill: rgb("#013157"), counter(page).display("1")))
  #grid(
    columns: auto,
    gutter: 10pt,
    [#image("resources/welle-outline-saphir.svg", width: 100%)],
    [#text(
      fill: rgb("#013157"),
      size: 12pt,
      "DLRG-Jugend St. Leon | An der Autobahn 58 | 68789 St. Leon-Rot | jugend@st-leon.dlrg.de ",
    )],
  )


]
