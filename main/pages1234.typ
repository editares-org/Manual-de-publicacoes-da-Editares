// style.typ — estilo do livro

// Ficha catalográfica (modelo ABNT/CIP — layout típico brasileiro)
//
// Parâmetros esperados: ano, isbn, isbnebook
// Ajuste "CDU" / assuntos conforme necessário.

#let ficha_catalografica(
  ano: "YYYY",
  isbn: "33-22-55555-22-1",
  isbnebook: "eb-oo-k5555-22-2",
  width: 8cm,
) = [

  #box(
    stroke: 1pt + black,
    inset: (x: 10pt, y: 10pt),
    width: width,
  )[

    #set text(size: 7.0pt)
    #set align(left)
    #set par(leading: 0.4em)

    W419a ~~~~~~ Weigert, Gabriel Lara

    // Recuo típico do corpo
    #set par(first-line-indent: 40pt, hanging-indent: 30pt, spacing: 0.7em)


    Parapsychic self-confidence / Gabriel Lara Weigert; preface by Marcelo Silva. –
    Foz do Iguaçu, PR : Editares, #ano.

    XX p.

    Includes glossary.

    // Includes index.

    Includes bibliography.

    ISBN #isbn (print)

    ISBN #isbnebook (e-book)

    \

    1\. Conscientiology. I. Weigert, Gabriel Lara. II. Title.

    \

    #set align(right)
    CDU 130.122
  ]
]

#let pages1234(
  ano: "2026X",
  isbn: "33-22-55555-22-1",
  isbnebook: "eb-oo-k5555-22-2",
  leading: 0.15em,
  // body-font: "Crimson Pro",
  // heading-font: "Bebas Neue",
) = {
  // set page(numbering: none) // Desativa numeração
  set page(footer: none, header: none)

  align(center + horizon)[
    #text(font: "Bebas Neue", size: 36pt)[
      Manual de Publicações da Editares
    ]
  ]
  pagebreak()

  // PAGE 2: EDITARES' TEAM START ////////////////////////
  align(center)[
    *International Association EDITARES* \
    *Publisher*

    // #v(8pt) // space between title and team members
    #set par(leading: 0.5em)

    *General Coordination:*

    Cícero Borges \
    Roberta Bouchardet

    #show table.cell: set block(inset: (y: -3pt))
    //#set par(leading: 0.9em)

    #table(
      columns: 3,
      table.cell(colspan: 3)[*Editorial Board:*],
      [Amanda Goularte Vieira], [], [Leonardo Rodrigues],
      [Ana Claudia Prado], [], [Liege Trentin],
      [Ana Mazzonetto], [], [Magda Stapf],
      [Cecilia Roma], [], [Meracilde Daroit],
      [Cristina Bornia], [], [Patricia Pialarissi],
      [Cristina Ellwanger], [], [Ricardo Rezende],
      [José Ricardo Gomes], [], [Roberta Bouchardet],

      table.cell(colspan: 3)[*Technical Team:*],
      [Alex Sarmento], [], [Liliana Roriz],
      [Beatriz Helena Cestari], [], [Liliane Sakakima],
      [Betânia Abreu], [], [Luciano Melo],
      [Blandina Monteiro], [], [Luiz Cláudio Resende Gonçalves],
      [Bruno Fabiano de Camargo], [], [Luiz Eduardo Menezes],
      [Carlos Moreno], [], [Lurdes Sousa],
      [Cassiane Teixeira], [], [Márcia Perrusi],
      [Daniel Ronque], [], [Maria Koltum],
      [Dayane Rossa], [], [Nataska Cristini Kuntz,],
      [Eduardo Santana], [], [Niciano Vilas Bôas],
      [Eric Borges Scardino], [], [Paula Gabriella Barbosa],
      [Iuna Aikewara], [], [Rosana Cordeiro],
      [João Feliciano Arruda Lopes], [], [Rubia Henning],
      [João Paulo Costa], [], [Rui Fernando Sousa],
      [Kao Pei Ru], [], [Simone Zanella],
      [Kátia Silene de Ávila], [], [Sónia Luginger],
      [Leonardo Ribeiro], [], [Tatiane Mendonça],
    )

    #text(size: 8pt)[
      #block(
        width: 80%,
      )[
        The copyright of this edition is the property of \
        International Association EDITARES.

        Total or partial reproduction of this book, by any means or process, is strictly prohibited without the express authorisation of its author and of the International Association EDITARES.

        Copyright infringement characterises is a crime punished by law and civil sanctions apply.
      ]
    ]

  ]
  pagebreak()
  // PAGE 2: EDITARES' TEAM END ////////////////////////


  align(center + horizon)[
    // Title (Bebas Neue)
    #text(font: "Bebas Neue", size: 36pt)[
      Manual de #box[Publicações] da Editares
    ]

    // #v(12pt) // space between title and author

    // Author (Crimson Pro)
    #text(font: "Crimson Pro", size: 16pt)[
      Gabriel Lara Weigert
    ]
  ]

  // Bottom block (city + year)
  align(bottom + center)[
    #text(font: "Crimson Pro", size: 14pt)[
      Foz do Iguaçu, PR \
      #ano
    ]
    #v(24pt) // bottom padding
  ]

  // PAGE 4: Ficha catalográfica de rosto START ////////////////////////
  pagebreak()
  align(center)[
    #set par(leading: 0.5em)


    Copyright © #ano -- International Association EDITARES\
    _(Parapsychic Self-confidence) Print on Demand_

    Original title in Portuguese:\
    *Autoconfiança Parapsíquica*

    #show table.cell: set block(inset: (y: -3pt))
    //#set par(leading: 0.9em)

    #table(
      columns: 3,
      stroke: 1pt + black,
      table.cell(colspan: 3)[*Edition History*],
      [Portuguese], [1ª edition: 2022], [1,000 copies],
      [English], [1ª edition: 2026], [Print on demand (PoD)],
    )


    #text(size: 7pt)[
      #block(
        width: 80%,
      )[
        The copyright of this edition has been assigned by the author to the *International Association Editares.*

        The opinions expressed in this book are those of the author and do not necessarily represent the position of Editares.

        The feedback, content, grammatical and graphic revisions of this work were carried out exclusively by conscientiology volunteers.

      ]
    ]


    #set text(size: 8pt)
    #table(
      columns: 2,
      align: (right, left),
      // Centers content in all columns
      [*Translation:*], [Marcelo Pires],
      [*Revision:*], [Jeffrey Lloyd],
      [*Proofreading:*], [Marcelo Pires],
      [*Layout:*], [Eduardo Santana],
      [*Book cover concept:*], [Matheus Nogueira],
      [*Book cover:*], [Leandro Guiraldeli],
      [*Editor of this English edition:*], [XXX and Liliana Alexandre],

      // REMEMBER TO UPDATE Exhaustive Specific Bibliography (ESB)
      // After updating this table, update ESB with the same information (names + roles)
    )

    International Cataloging Data in Publication (CIP)(verificar XXX)
    #v(-1em)
    #ficha_catalografica(ano: ano, isbn: isbn, isbnebook: isbnebook, width: 8cm)

    #table(
      columns: (25%, 70%),
      align: (right, left),
      column-gutter: 2pt,
      [#image("media/image2.png")],
      [#box()[

        #set text(size: 8pt)
        #set par(spacing: 0.7em)

        *INTERNATIONAL ASSOCIATION EDITARES*

        Av. Felipe Wandscheer, nº 6.200, room 110, Cognopolis

        Foz do Iguaçu, State of Parana -- Brazil -- CEP: 85856-850

        Website: www.editares.org

      ]],
    )
  ]
}
