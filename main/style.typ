// style.typ — SIMPLE book styling (Typst)
//
// This version removes the non-convergent logic.
// Requirements (current):
// - Page number centered at bottom on ALL pages (including pages 1–4 and Part pages)
// - Keep your fonts (Crimson Pro body, Bebas Neue headings)
// - Keep your debug colors per heading level
// - Headings centered
//
// IMPORTANT:
// Your Pandoc Typst template must call:
//   #book-setup[ ... $body$ ... ]
// (Wrapping is required so `set` / `show` apply to the whole document.)

#let book-setup(
  body,
  page-width: 14cm,
  page-height: 21cm,
  // Book-like margins with gutter will be included in Adobe Acrobat when printing with bleed. For now, we can just set them to 2cm on all sides.
  margin: (top: 2.2cm, bottom: 2.2cm, inside: 2.0cm, outside: 2.0cm),
  // Fonts
  body-font: "Crimson Pro",
  heading-font: "Bebas Neue",
  // Body typography
  body-size: 10.0pt,
  leading: 0.9em,
  // Hyphenation language
  lang: "en",
  region: "UK",
) = {
  // --- Page setup ---
  // Simple footer: centered page number on EVERY page.
  // This uses a counter display only (does NOT affect pagination), so layout converges.
  set page(
    width: page-width,
    height: page-height,
    margin: margin,

    footer: context [
      #set text(size: 9pt)
      #align(center)[#counter(page).display("1")]
    ],
  )

  // --- Body typography ---
  set text(font: body-font, size: body-size, lang: lang)
  set par(leading: leading, justify: true)


  // set heading(numbering: (..nums) => {
  //   // Customize numbering based on depth
  //   if nums.pos().len() == 1 {
  //     numbering("I", ..nums) // Parts: I, II, ...
  //   } else {
  //     numbering("1.1", ..nums) // Chapters/Sections: 1.1, 1.1.1, ...
  //   }
  // })

  // set heading(numbering: (..nums) => {
  //   let chapter-count = counter("chapter counter")
  //   if nums.pos().len() == 1 {
  //     // Level 1: Roman numerals for Parts.
  //     numbering("I", ..nums)
  //   } else if nums.pos().len() == 2 {
  //     // Level 2: Use the chapter state counter and increment it.
  //     chapter-count.step()
  //     str(chapter-count.get().first() + 1)
  //     // or
  //     // context numbering("1", ..chapter-count.get())
  //   } else {
  //     // Level 3+: Use the chapter number followed by the position within that chapter.
  //     numbering("1.1", ..chapter-count.get(), ..nums.pos().slice(2))
  //   }
  // })

  set heading(numbering: "I.1")


  // --- Headings (debug colors kept) ---
  // NOTE: No odd-page forcing here. Keep it simple first.

  // Level 1 (Part) — RED
  show heading.where(level: 1): it => [
    #pagebreak(to: "odd", weak: true)
    #align(center + horizon)[
      #set text(font: heading-font, size: 22pt, weight: "bold", fill: red, hyphenate: false)
      #it
    ]
    #v(0.8em)
  ]

  // Level 2 (Chapter) — PURPLE
  show heading.where(level: 2): it => [
    #pagebreak(to: "odd", weak: true)
    #align(center)[
      #set text(font: heading-font, size: 20pt, weight: "bold", fill: rgb("#7a00ff"), hyphenate: false)
      #it
    ]
    #v(0.6em)
  ]

  // Level 3 (Section) — BLUE
  show heading.where(level: 3): it => [
    #align(left)[
      #set text(font: body-font, size: 14pt, weight: "bold", fill: blue, hyphenate: false)
      #it
    ]
    #v(0.4em)
  ]

  // Level 4 (Subsection) — GREEN
  show heading.where(level: 4): it => [
    #align(left)[
      #set text(font: body-font, size: 12pt, weight: "bold", fill: green, hyphenate: false)
      #it
    ]
    #v(0.3em)
  ]

  // --- Enumerated lists: global formatting for the whole book ---
  // Adds a Zero before enums if length is less than 10.
  let enum-item-count(children) = children.filter(c => c.func() == enum.item).len()
  let format-enum-number(n, pad) = {
    if pad and n < 10 {
      [0#n.]
    } else {
      [#n.]
    }
  }
  // Sentinel to avoid infinite recursion when recreating enum.
  set enum(start: 0)
  show enum: it => {
    // Enums recreated by this rule come back with start: 1.
    // Leave them unchanged so the rule doesn't match its own output.
    if it.start != 0 {
      it
    } else {
      let count = enum-item-count(it.children)
      let pad = count >= 10

      enum(
        start: 1,
        tight: it.tight,
        full: it.full,
        reversed: it.reversed,
        indent: it.indent,
        body-indent: it.body-indent,
        spacing: it.spacing,
        number-align: it.number-align,
        numbering: n => format-enum-number(n, pad),
        ..it.children,
      )
    }
  }


  body
}


// Emphatic “Waldo-style” phrase block.
// Usage: #frase(width: 80%)[ ... ]
#let frase(body, width: 80%, size: 11.5pt, leading: 1em, hyphenate: false) = [
  #align(center)[
    #set text(hyphenate: hyphenate)
    #block(width: width, breakable: false)[
      #align(center)[
        #set par(justify: false)
        #set text(size: size)
        #set par(leading: leading)
        #upper(body)
      ]
    ]
  ]
]

// Signature block (letter-style), right-aligned, narrow column.
// Usage: #assinatura(width: 65%)[ ... ]
#let assinatura(body, width: 65%, size: 10.5pt, leading: 1.25em) = [
  #align(right)[
    #block(width: width, breakable: false)[
      #align(right)[
        #set text(size: size)
        #set par(leading: leading)
        #body
      ]
    ]
  ]
]

