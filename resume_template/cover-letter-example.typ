#import "cover-letter-style.typ": template

// You might either import the data from a JSON file or pass it as an input variable
//
// #let recipient_data = json(sys.inputs.cover_data)

// #show: template.with(
//   author_firstname: recipient_data.title.firstname,
//   author_lastname: recipient_data.title.lastname,
//   author_email: recipient_data.title.email,
//   author_phone: recipient_data.title.phone_number,
//   author_headlines: recipient_data.title.headlines,
//   recipient_address: recipient_data.address,
//   recipient_company: recipient_data.company,
//   recipient_email: recipient_data.email,
//   recipient_name: recipient_data.name,
// )

// #recipient_data.body.join("\n\n") // Or types your own text here

// Remove below and uncomment above to use dynamic data input

#show: template.with(
  author_firstname: "Albert",
  author_lastname: "Einstein",
  author_email: "albert.einstein@example.com",
  author_phone: "+41 31 123 4567",
  author_headlines: (
    (name: "Theoretical Physicist", linkto: "ias"),
    (name: "Patent Clerk", linkto: "patent"),
  ),
  recipient_name: "Hiring Committee",
  recipient_company: "Princeton University",
  recipient_address: ("Department of Physics", "Princeton, New Jersey", "United States"),
  recipient_email: "physics@princeton.edu",
)

#lorem(100)

#lorem(100)

#lorem(100)
