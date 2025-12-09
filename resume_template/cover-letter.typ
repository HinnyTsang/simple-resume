#import "cover-letter-style.typ": template

#assert(("resume_data" in sys.inputs), message: "resume_data is required input")
#assert(("cover_data" in sys.inputs), message: "cover_data is required input")


#let resume_data = json(sys.inputs.resume_data)
#let recipient_data = json(sys.inputs.cover_data)

#show: template.with(
  author_firstname: resume_data.title.firstname,
  author_lastname: resume_data.title.lastname,
  author_email: resume_data.title.email,
  author_phone: resume_data.title.phone_number,
  author_headlines: resume_data.title.headlines,
  recipient_address: recipient_data.address,
  recipient_company: recipient_data.company,
  recipient_email: recipient_data.email,
  recipient_name: recipient_data.name,
)

#recipient_data.body.join("\n\n") // Or types your own text here

