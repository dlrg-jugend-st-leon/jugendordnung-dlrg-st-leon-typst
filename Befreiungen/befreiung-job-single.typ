#import "befreiung-job.typ": befreiung-brief

// Single letter template for batch processing
// This file is designed to be compiled with command-line input parameters

// Get parameters from command line (passed via --input flags)
#let event-name = sys.inputs.at("event-name", default: "")
#let start-date = sys.inputs.at("start-date", default: "")
#let end-date = sys.inputs.at("end-date", default: "")
#let employee-name = sys.inputs.at("employee-name", default: "")
#let employee-address = sys.inputs.at("employee-address", default: "")
#let hr-contact = sys.inputs.at("hr-contact", default: "")

// Generate the letter
#befreiung-brief(
  event-name: event-name,
  start-date: start-date,
  end-date: end-date,
  employee-name: employee-name,
  employee-address: employee-address,
  hr-contact: hr-contact,
)
