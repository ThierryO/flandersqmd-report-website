<!-- badges: start -->
![GitHub](https://img.shields.io/github/license/ThierryO/flandersqmd-report-website)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ThierryO/flandersqmd-report-website/check-project)
![GitHub repo size](https://img.shields.io/github/repo-size/ThierryO/flandersqmd-report-website)
<!-- badges: end -->

# A quarto extension for a report website project with the corporate identity of the Flemish government

[Onkelinx, Thierry![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0001-8804-4216)[^aut][^cre][^inbo.be]
Research Institute for Nature and Forest (INBO)[^cph][^fnd]

[^cph]: copyright holder
[^fnd]: funder
[^aut]: author
[^cre]: contact person
[^inbo.be]: Research Institute for Nature and Forest (INBO)

**keywords**: quarto; extension; corporate identity; Flemish government

<!-- community: inbo -->

<!-- description: start -->
This quarto extension assumes the output is a technical report to be published only as a website.
Use this extension when you need to compile all file independently from each other.
This can solve the out of memory problems when using a book type project.
This repository has a demo report illustrating the available options.
<!-- description: end -->

## `_quarto.yml` settings

```
project:
  type: flandersqmd-report-website
```

### Available formats

- `flandersqmd-report-website-html`: colour scheme for the corporate identity of the Government of Flanders
- `flandersqmd-report-website-html+inbo`: colour scheme for the corporate identity of the Research Institute for Nature and Forest (INBO)

Contact the maintainer in case you want a similar format for your entity.

### `flandersqmd` options

- `entity`: Defines which entity publishes the report.
  We use this information to create the colophon.
  Defaults to `INBO` when missing.
- `title`: The mandatory title of the report.
  The title is show on the colophon and in the citation information.
- `subtitle`: The optional subtitle.
  The subtitle is show on the colophon and in the citation information.
- `author`: The person information of the authors.
  The information is fully listed in the colophon.
  The abbreviated list of authors is displayed in the footer of every page.
  At least one author is mandatory.
  Exactly one author must be marked as being the corresponding author.
- `reviewer`: The person information of the reviewer.
  The information is fully listed in the colophon.
  At least one reviewer is mandatory.
- `year`: The mandatory year of publication.
  Listed in the colophon, in the footer of every page and the citation information.
- `reportnr`: The mandatory report number used in the colophon and the citation information.
- `cover`: Cover image of the report.
  The colophon starts with the full version of this image.
- `ordernr:` The optional order number.
- `depotnr`: The optional depot number.
- `doi`: The mandatory [DOI](https://www.doi.org/) of the report.

Failure to provide mandatory options results in obnoxious messages about the missing options.

### `website` options

- `title`: Text to display in the navigation bar (top of every page).
- `left`: Links to display on the navigation bar.
- `tools`: Display icons on the right hand side of the navigation bar.
- `sidebar`: The table of content of the website.
    - `logo`: Image to display as a thumbnail at the top of the side bar.
    - `contents`: List of items to display in the table of content.
    - `section`: Create a sections in the table of content.

You can add links by just mentioning the file to link to `- abstract.md`.
Quarto will use the title or first level 1 heading of that file as link text.
Use the `- text: file:` notation from the example below in case you want to specify a different link text.
You might want to use a link text which is short than the title in the file.

```
website:
  title: Optional title for the navbar
  navbar:
    left:
      - text: Cover
        file: index.md
      - text: Abstract
        file: abstract.md
    tools:
      - icon: mastodon
        href: https://mastodon.online/@inbo
      - icon: github
        menu:
          - text: Source Code
            url:  https://github.com/inbo
          - text: Report a Bug
            url:  https://github.com/inbo
  sidebar:
    logo: cover.png
    style: "floating"
    contents:
    - text: Cover
      file: index.md
    - section: Typography
      file: headings.qmd
      contents:
        - headings.qmd
        - fonts.qmd
```

## Shortcodes

Shortcodes are special markdown directives that generate various types of content.
More information on the [Quarto website](https://quarto.org/docs/extensions/shortcodes.html).

- `{{< colophon >}}`: Displays the colophon.
  See
[index.md](index.md)<!-- spell-check: ignore-->
for an example.
