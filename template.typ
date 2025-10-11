// Copyright (c) 2025 WüSpace e. V.
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

// sentence number substitution marker
#let s = "XXXXXXSENTENCEXXXNUMBERXXXXXX"

#let blue = rgb("#013157")

/// Create an unmarkes section, such as a preamble.
/// Usage: `#unnumbered[Preamble]`
#let unnumbered = (it, ..rest) => context (
  {
    // Determine the current heading level to create a heading one level below.
    // Previous heading element
    let h-elem = selector(heading).before(here())

    // Current heading level
    let c = counter(h-elem).get()

    // Depth to use for the new heading
    let depth = if c == none {
      // Unlikely case: No counter found at all
      1
    } else if c.at(0) == 0 {
      // We're before the first sectional level, so use level 1
      1
    } else {
      // Use the current depth + 1 to be one level below the current depth
      c.len() + 1
    }

    // Actually show the heading
    show heading: set text(style: "normal", weight: "bold")
    heading(level: depth, numbering: none, ..rest, it)
    v(5pt)
  }
)


/// Manually create a section. Useful when unsupported characters are used in the heading.
/// Usage: `#section[§ 3][Administrator*innen]`
#let section = (number, it, ..rest) => unnumbered(
  {
    number + " " + it
  },
  ..rest,
)

/// Initialize a delegis document.
#let template = (
  // Metadata
  title: none,
  title-short: none,
  abbreviation: none,
  resolution: "3. Beschluss des Vorstands vom 24.01.2024",
  in-effect: "24.01.2024",
  draft: false,
  logo: none,
  // Overrides
  size: 12pt,
  font: "Mulish",
  lang: "de",
  paper: "a4",
  str-draft: "Entwurf",
  str-intro: (resolution, in-effect) => [Mit Beschluss (#resolution) tritt zum #in-effect in Kraft:],
  // Content
  body,
) => {
  /// Metadata
  let full-title = if abbreviation != none {
    title + " (" + abbreviation + ")"
  } else {
    title
  }
  set document(
    title: full-title,
    keywords: (title, abbreviation, resolution, in-effect).filter(it => it != none),
    description: str-intro(resolution, in-effect) + " " + full-title,
  )


  set page(
    paper: "a4",
    numbering: "1 / 1",
    margin: (top: 4cm, bottom: 3cm, x: 1.6cm),
    header: [
      #grid(
        columns: auto,
        gutter: 10pt,
        [#grid(
          columns: (auto, auto, auto),
          rows: 2cm,
          align: horizon,
          grid.cell(
            box(logo),
          ),
          grid.cell(
            h(1fr),
          ),
          grid.cell(
            box(text(title-short, fill: blue, size: 18pt)),
          ),
        )],
        [#line(length: 100%, stroke: 3pt + blue)],
      )


    ],
    footer: context [
      #place(top + right, text(fill: blue, counter(page).display("1")))
      #grid(
        columns: auto,
        gutter: 10pt,
        [#image("welle-outline-saphir.svg", width: 100%)],
        [#text(
          fill: blue,
          size: 12pt,
          "DLRG-Jugend St. Leon | An der Autobahn 58 | 68789 St. Leon-Rot | jugend@st-leon.dlrg.de ",
        )],
      )


    ],
  )
  set text(hyphenate: true, lang: lang, size: size, font: font)

  /// Clause Detection
  show regex("§ ([0-9a-zA-Z]+) (.+)$"): it => {
    let (_, number, ..rest) = it.text.split()

    section("§ " + number, rest.join(" "))
  }

  /// Heading Formatting
  set heading(numbering: "I.")
  show heading: set align(left)
  show heading: set text(fill: blue, font: "Josefin Sans", weight: "bold")

  show heading.where(level: 1): set text(size: 18pt)
  show heading.where(level: 2): set text(size: size)

  // Enumeration numbering
  // 1. -> a) -> aa) -(unofficial)-> (1) -> i. -> i.i. -> ...
  // Handbuch der Rechtsförmlichkeit, Rn. 374
  set enum(
    numbering: (..numbers) => {
      let nums = numbers.pos()
      if (nums.len() == 1) {
        return numbering("1.", ..nums)
      } else if (nums.len() == 2) {
        return numbering("a)", ..nums.slice(1))
      } else if (nums.len() == 3) {
        let letter = numbering("a", ..nums.slice(2))
        return [ #letter#letter) ]
      } else if (nums.len() == 4) {
        return numbering("(1)", ..nums.slice(3))
      } else {
        return numbering("i.", ..nums.slice(4))
      }
    },
    full: true, // get full number arrays passed into the numbering function
  )

  /// Outlines
  show outline.entry: it => {
    show linebreak: it => {} // disable manual line breaks
    show "\n": " " // disable section number line breaks
    it
  }

  set outline(indent: 1cm)
  show outline: it => {
    it
    pagebreak(weak: true)
  }

  /// Sentence Numbering
  show regex(s): it => {
    counter("sentence").step()
    super(strong(context (counter("sentence").display())))
  }

  show parbreak: it => {
    counter("sentence").update(0)
    it
  }

  //title
  par(text(font: "Josefin Sans", 1.8em, fill: blue, strong(full-title)), leading: 0.6em)


  // Metadata once again. Needs to be down here to have the page size set.
  // Can be used with `typst query`, e.g.:
  //
  // `typst query example.typ "<title>" --field value --one` returns `"[title]"`
  [
    #metadata(title)<title>
    #metadata(abbreviation)<abbreviation>
    #metadata(resolution)<resolution>
    #metadata(in-effect)<in-effect>
  ]

  // allow footnotes that don't conflict with sentence numbers
  set footnote(numbering: "[1]")

  /// Content
  body
}
