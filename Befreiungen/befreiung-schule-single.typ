#import "befreiung-schule.typ": befreiung-schule-brief

// Single letter template for batch processing
// This file is designed to be compiled with command-line input parameters

// Get parameters from command line (passed via --input flags)
#let event-name = sys.inputs.at("event-name", default: "")
#let start-date = sys.inputs.at("start-date", default: "")
#let end-date = sys.inputs.at("end-date", default: "")
#let student-name = sys.inputs.at("student-name", default: "")
#let student-class = sys.inputs.at("student-class", default: "")
#let teacher-name = sys.inputs.at("teacher-name", default: "")
#let school-name = sys.inputs.at("school-name", default: "")

// Generate the letter
#befreiung-schule-brief(
  event-name: event-name,
  start-date: start-date,
  end-date: end-date,
  student-name: student-name,
  student-class: student-class,
  teacher-name: teacher-name,
  school-name: school-name,
)
