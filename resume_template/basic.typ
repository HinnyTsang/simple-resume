// --------------------
// Definitions
// --------------------
#import "@preview/fontawesome:0.6.0": fa-icon

#let icon_tel = box(fa-icon("phone"))
#let icon_email = box(fa-icon("envelope"))
#let icon_github = box(fa-icon("github"))
#let icon_linkedin = box(fa-icon("linkedin"))
#let icon_webpage = box(fa-icon("globe"))
#let icon_telegram = box(fa-icon("telegram"))


#let make_title_section(
  firstname: str,
  lastname: str,
  headlines: array,
  phone_number: str,
  email: str,
  github: (:),
  linkedin: (:),
  homepage: (:),
  telegram: (:),
) = {
  set text(16pt)
  set align(center)
  [= #firstname  #lastname]
  set text(10pt)


  let headline_strings = array.map(headlines, h => {
    if h.linkto != "" {
      return link(label(h.linkto))[#h.name]
    } else {
      return h.name
    }
  })

  let contacts = ()

  if phone_number != none {
    contacts.push(link("tel:" + phone_number.replace(" ", ""))[#icon_tel #phone_number])
  }

  if email != none {
    contacts.push(link("mailto:" + email)[#icon_email #email])
  }

  if github != none {
    contacts.push(link("https://www.github.com/" + github.username)[#icon_github #github.username])
  }

  if linkedin != none {
    contacts.push(link("https://www.linkedin.com/in/" + linkedin.username)[#icon_linkedin #linkedin.username])
  }

  if telegram != none {
    contacts.push(link("https:t.me/@" + telegram.username)[#icon_telegram #telegram.username])
  }

  if homepage != none {
    contacts.push(link(homepage.url)[#icon_webpage #homepage.display])
  }


  headline_strings.join("  /  ")
  linebreak()
  contacts.join("  |  ")
}

#let make_section_title(title: str) = {
  set text(weight: "bold")
  [== #title]
}

#let make_experience_item(
  startdate: str,
  enddate: str,
  title: str,
  label: str,
  organization: str,
  responsibilities: str,
) = {
  let timestamp = startdate + " - "

  if enddate != none {
    timestamp = timestamp + enddate
  } else {
    timestamp = timestamp + "Present"
  }

  text(weight: "bold")[#title #label]
  [ --- ]
  text(1em, weight: "light", style: "italic")[#organization]
  h(1fr)
  timestamp

  set text(0.9em)
  set par(justify: true, linebreaks: "optimized")
  for responsibility in responsibilities {
    let strings = eval(responsibility, mode: "markup")
    [- #strings]
  }
}

#let make_experiences_section(section_title: "Experience", items: array) = {
  set align(left)

  make_section_title(title: section_title)

  for item in items {
    make_experience_item(
      startdate: item.startdate,
      enddate: item.enddate,
      title: item.title,
      label: label(item.label),
      organization: item.organization,
      responsibilities: item.responsibilities,
    )
  }
}

#let make_keywords_section(
  title: str,
  skills: array,
) = {
  set align(left)
  set align(top)

  make_section_title(title: title)

  set par(spacing: 0.5em)

  for skill in skills {
    grid(
      columns: (1.5fr, 3fr),
      text(weight: "semibold")[#skill.title], skill.items.join(", ", last: ", and ") + ".",
    )
  }
}

#let make_line() = {
  line(length: 100%, stroke: 0.5pt)
}

// --------------------
// Global Configurations
// --------------------

#let margin = 0.4in  // Change it if you need

#set align(horizon)

#set page(
  margin: (top: margin, bottom: margin, left: margin, right: margin),
)

#set text(font: "Source Sans 3")


// --------------------
// Resume Content
// --------------------


#assert(("resume_data" in sys.inputs), message: "resume_data is required input")

#let common_input = json(sys.inputs.resume_data)

#let title_section = make_title_section(
  firstname: common_input.title.firstname,
  lastname: common_input.title.lastname,
  headlines: common_input.title.headlines,
  email: common_input.title.email,
  phone_number: common_input.title.phone_number,
  github: common_input.title.github,
  linkedin: common_input.title.linkedin,
  homepage: common_input.title.homepage,
  telegram: common_input.title.telegram,
)

#let experience_section = make_experiences_section(
  items: common_input.experiences,
)

#let education_section = make_experiences_section(
  section_title: "Education",
  items: common_input.educations,
)

#let skills_section = make_keywords_section(
  title: "Skills & Technologies",
  skills: common_input.skills,
)

#let line = make_line()


// --------------------
// Sections Ordering
// --------------------


#title_section

#line

#experience_section

#line

#skills_section

#line

#education_section
