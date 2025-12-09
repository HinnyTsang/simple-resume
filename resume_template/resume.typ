#import "resume-style.typ": template

#assert(("resume_data" in sys.inputs), message: "resume_data is required input")

#let resume_data = json(sys.inputs.resume_data)

#show: template.with(
  firstname: resume_data.title.firstname,
  lastname: resume_data.title.lastname,
  headlines: resume_data.title.headlines,
  email: resume_data.title.email,
  phone_number: resume_data.title.phone_number,
  linkedin: resume_data.title.linkedin,
  github: resume_data.title.github,
  homepage: resume_data.title.homepage,
  telegram: resume_data.title.telegram,
  experiences: resume_data.experiences,
  educations: resume_data.educations,
  skills: resume_data.skills,
)
