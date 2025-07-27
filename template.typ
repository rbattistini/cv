#import "lib.typ": *

#let cv-template(
  name,
  subtitle,
  footer-text,
  contact-info,
  education,
  work-experience,
  skills,
  projects,
  publications: none,
  section-titles: (
    education: "Education",
    work: "Work Experience", 
    skills: "Skills",
    projects: "Projects",
    publications: "Publications"
  ),
  supervisor-text: "Supervised by",
  education-labels: (
    thesis: "Thesis",
    supervisor: "Supervisor",
    cosupervisor: "Co-supervisor", 
    grade: "Grade"
  )
) = {
  
  // Page setup
  set page(
    margin: (top: 1.15in, bottom: 1.15in, left: 1.4in, right: 1.4in),
    footer: [
      #pad(x: 5.5em, align(center)[
        #text(size: 8pt, font: "Crimson Text", tracking: 0.08em)[#footer-text]
      ])
    ],
    footer-descent: 25%,
  )
  
  // Text formatting setup
  set text(size: 10pt, font: "Crimson Text") 
  set par(justify: false, leading: 0.6em)

  // Header section
  align(center)[
    #text(size: 16pt, weight: "regular", font: "Merriweather Sans", tracking: 0.2em)[#upper[#name]]

    #text(fill: cv-color, weight: "bold", font: "Merriweather Sans", size: 9pt, tracking: 0.1em)[#upper[#subtitle]]
    
    #text(weight: "extralight", font: "Merriweather Sans")[#contact-info.basic.join(", ")]

    #text(weight: "extralight", font: "Merriweather Sans", size: 9pt)[#contact-info.social.join(", ")]
  ]

  // Education section
  section-header(0.7em, section-titles.education)
  for edu in education {
    education-entry(
      edu.degree,
      edu.institution,
      edu.period,
      thesis: edu.at("thesis", default: none),
      supervisor: edu.at("supervisor", default: none),
      cosupervisor: edu.at("cosupervisor", default: none),
      grade: edu.at("grade", default: none),
      thesis-url: edu.at("thesis-url", default: none),
      supervisor-url: edu.at("supervisor-url", default: none),
      cosupervisor-url: edu.at("cosupervisor-url", default: none),
      labels: education-labels,
    )
    if edu != education.last() { v(0.5em) }
  }

  // Work experience section
  if work-experience.len() > 0 {
    section-header(0.7em, section-titles.work)
    for work in work-experience {
      work-entry(
        work.title,
        work.period,
        work.description,
        supervisor: work.at("supervisor", default: none),
        url: work.at("url", default: none),
        supervisor-url: work.at("supervisor-url", default: none),
        supervisor-text: supervisor-text
      )
    }
  }

  // Skills section
  section-header(0.7em, section-titles.skills)
  skills-table(skills)

  // Projects section
  section-header(0.3em, section-titles.projects)
  for project in projects {
    project-entry(
      project.title,
      project.description,
      url: project.at("url", default: none)
    )
  }

  // Publications section
  section-header(0.7em, section-titles.publications)
  for pub in publications {
    publication-entry(
      pub.citation,
      url: pub.at("url", default: none)
    )
  }
}