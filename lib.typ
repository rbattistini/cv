// Color configuration
#let cv-color = blue.darken(55%)

// Icon functions
#let icon(name, baseline: 1.5pt) = {
  box(
    baseline: baseline,
    height: 10pt,
    image(name)
  )
}

#let sm_icon(name, baseline: 1.5pt) = {
  box(
    baseline: baseline,
    height: 8pt,
    image(name)
  )
}

// Contact information builders
#let build-contact(icon-path: none, url: none, display-text) = {
  let content = if icon-path != none {
    [#icon(icon-path) #display-text]
  } else {
    display-text
  }
  
  if url != none {
    link(url)[#content]
  } else {
    content
  }
}

// Section header function
#let section-header(space, title) = {
  v(space)
  line(length: 100%, stroke: 0.75pt + cv-color)
  v(-0.7em)
  text(fill: cv-color, size: 7.5pt, font: "Merriweather Sans", weight: "bold", tracking: 0.05em)[#upper[#title]]
  v(0.01em) 
}

// Education entry function
#let education-entry(
  degree,
  institution,
  period,
  thesis: none,
  supervisor: none,
  cosupervisor: none,
  grade: none,
  thesis-url: none,
  supervisor-url: none,
  cosupervisor-url: none,
  labels: (
    thesis: "Thesis",
    supervisor: "Supervisor", 
    cosupervisor: "Co-supervisor",
    grade: "Grade"
  )
) = {
  grid(
    columns: (1fr, auto),
    [#text(weight: "bold")[#degree], #emph[#institution]], 
    text(size: 9pt, weight: "bold")[#period]
  )
  
  if thesis != none {
    let thesis-content = if thesis-url != none {
      link(thesis-url)[#thesis #sm_icon("icons/link.svg")]
    } else {
      thesis
    }
    [- #text(weight: "bold")[#labels.thesis]: #thesis-content]
  }
  
  if supervisor != none or cosupervisor != none or grade != none {
    let line-parts = ()
    
    if supervisor != none {
      let sup-content = if supervisor-url != none {
        link(supervisor-url)[#supervisor #sm_icon("icons/link.svg")]
      } else {
        supervisor
      }
      line-parts.push([#text(weight: "bold")[#labels.supervisor]: #sup-content])
    }
    
    if cosupervisor != none {
      let cosup-content = if cosupervisor-url != none {
        link(cosupervisor-url)[#cosupervisor #sm_icon("icons/link.svg")]
      } else {
        cosupervisor
      }
      line-parts.push([#text(weight: "bold")[#labels.cosupervisor]: #cosup-content])
    }
    
    if grade != none {
      line-parts.push([#text(weight: "bold")[#labels.grade]: #grade])
    }
    
    [- #line-parts.join(", ")]
  }
}

// Work experience entry function
#let work-entry(
  title,
  period,  
  description,
  supervisor: none,
  url: none,
  supervisor-url: none,
  supervisor-text: "Supervised by",
) = {
  let title-content = if url != none {
    link(url)[*#title* #sm_icon("icons/link.svg")]
  } else {
    [*#title*]
  }
  
  grid(
    columns: (1fr, auto),
    title-content,
    text(size: 9pt, weight: "bold")[#period]
  )
  
  [- #description]
  
  if supervisor != none {
    let sup-content = if supervisor-url != none {
      link(supervisor-url)[#supervisor #sm_icon("icons/link.svg")]
    } else {
      supervisor
    }
    [- #supervisor-text #sup-content.]
  }
}

// Project entry function
#let project-entry(title, description, url: none) = {
  let title-content = if url != none {
    link(url)[*#title* #sm_icon("icons/link.svg")]
  } else {
    [*#title*]
  }
  
  grid(
    columns: (1fr, auto),
    title-content
  )
  
  for item in description {
    [- #item]
  }
}

// Skills table function
#let skills-table(skills-data) = {
  v(-0.5em)
  table(
    columns: (auto, 1fr),
    stroke: none,
    column-gutter: 0.66em,
    row-gutter: -0.35em,
    align: (right, left),
    ..skills-data.pairs().map(((key, value)) => (key, value)).flatten()
  )
}

// Publication entry function
#let publication-entry(citation, url: none) = {
  if url != none {
    emph()[#link(url)[#citation #sm_icon("icons/link.svg")]]
  } else {
    emph()[#citation]
  }
}