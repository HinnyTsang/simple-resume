
#import "@preview/fontawesome:0.6.0": fa-icon
#import "@preview/datify:1.0.0": custom-date-format


#let icon_tel = box(fa-icon("phone"))
#let icon_email = box(fa-icon("envelope"))
#let icon_github = box(fa-icon("github"))
#let icon_linkedin = box(fa-icon("linkedin"))
#let icon_webpage = box(fa-icon("globe"))
#let icon_telegram = box(fa-icon("telegram"))

#let show_email(email: str) = {
  set text(style: "italic")
  if email != "" {
    link("mailto:" + email)[#email]
  } else {
    ""
  }
}

#let make_header(
  date: datetime.today(),
  author_firstname: str,
  author_lastname: str,
  author_email: str,
  author_phone: str,
  author_headlines: array,
) = {
  [= #author_firstname #author_lastname]

  text(
    author_headlines.map(item => item.name).join(" / "),
    style: "italic",
  )

  grid(
    columns: (1em, 1fr),
    column-gutter: 0.5em,
    gutter: 0.5em,
    icon_tel, link("tel:" + author_phone)[#author_phone],
    icon_email, link("mailto:" + author_email)[#author_email],
  )

  line(length: 100%, stroke: 0.05em)
}

#let make_salutation(
  date: datetime,
  recipient_company: str,
  recipient_email: str,
  recipient_address: str,
  recipient_name: str,
) = {
  custom-date-format(date, pattern: "long")
  linebreak()

  recipient_name
  linebreak()

  recipient_company
  linebreak()

  recipient_address.join("\n")
  linebreak()

  show_email(email: recipient_email)
  linebreak()
  linebreak()

  [Dear #recipient_name]

  linebreak()
  linebreak()
}

#let make_closing(
  author_firstname: str,
  author_lastname: str,
) = {
  linebreak()
  linebreak()
  [Best Regards,]
  linebreak()
  [#author_firstname #author_lastname]
}

#let template(
  date: datetime.today(),
  author_firstname: str,
  author_lastname: str,
  author_email: str,
  author_phone: str,
  author_headlines: array,
  recipient_address: str,
  recipient_company: str,
  recipient_email: str,
  recipient_name: str,
  margin: auto,
  font: "Source Sans 3",
  body,
) = {
  set page(
    margin: (top: margin, bottom: margin, left: margin, right: margin),
  )
  set text(font: font)
  set align(horizon)

  show heading: set text(size: 2em, weight: "light")

  let header = make_header(
    author_firstname: author_firstname,
    author_lastname: author_lastname,
    author_email: author_email,
    author_phone: author_phone,
    author_headlines: author_headlines,
  )

  let salutation = make_salutation(
    date: date,
    recipient_name: recipient_name,
    recipient_company: recipient_company,
    recipient_email: recipient_email,
    recipient_address: recipient_address,
  )

  let closing = make_closing(
    author_firstname: author_firstname,
    author_lastname: author_lastname,
  )

  header

  set text(weight: "light")

  salutation

  body

  closing
}
