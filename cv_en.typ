#import "template.typ": cv-template  
#import "lib.typ": build-contact, icon, sm_icon

#let name = "Riccardo Battistini"
#let subtitle = "Computer Science and Engineering Graduate"

#let footer-text = "I authorize the processing of personal data contained in this document pursuant to art. 13 of Legislative Decree 196/2003 and art. 13 GDPR 679/16."

#let location = sys.inputs.at("location", default: none)
#let location_url = sys.inputs.at("location_url", default: none)
#let age = sys.inputs.at("age", default: none)
#let email = sys.inputs.at("email", default: none)

#let contact-info = (
  basic: (
    if location != none and location_url != none {
      build-contact(
        url: location_url,
        location
      )
    },
    if age != none {
      build-contact(age)
    },
    if email != none {
      build-contact(
        url: "mailto:" + email,
        email
      )
    }
  ),
  social: (
    build-contact(
      icon-path: "icons/github.svg",
      url: "https://github.com/rbattistini",
      "github/rbattistini"
    ),
    build-contact(
      icon-path: "icons/gitlab.svg",
      url: "https://gitlab.com/rbattistini",
      "gitlab/rbattistini"
    ),
    build-contact(
      icon-path: "icons/linkedin.svg",
      url: "https://www.linkedin.com/in/rbattistini/",
      "linkedin/rbattistini"
    )
  )
)

#let education = (
  (
    degree: "Bachelor's in Computer Science and Engineering",
    institution: "University of Bologna",
    period: "09/18-12/21",
    thesis: "Descriptive Text Mining in medical domain: application of POIROT methodology",
    thesis-url: "https://amslaurea.unibo.it/id/eprint/24781/",
    supervisor: "Gianluca Moro",
    supervisor-url: "https://www.unibo.it/sitoweb/gianluca.moro/en",
    grade: "100/110"
  ),
  (
    degree: "Master's in Computer Science and Engineering",
    institution: "University of Bologna",
    period: "12/21-07/25",
    thesis: "Exploiting GenAI for Plan Generation in BDI Agents",
    thesis-url: "https://github.com/rbattistini/master-thesis",
    supervisor: "Giovanni Ciatto",
    supervisor-url: "https://www.unibo.it/sitoweb/giovanni.ciatto/en",
    cosupervisor: "Gianluca Aguzzi",
    cosupervisor-url: "https://www.unibo.it/sitoweb/gianluca.aguzzi/en",
    grade: "110/110 cum laude"
  )
)

#let work-experience = (
  (
    title: "High-Performance Computing Curricular Internship",
    period: "03/20-05/20",
    description: "Implementation of a parallel algorithm for computing centrality metrics on GPU.",
    supervisor: "Moreno Marzolla",
    url: "https://github.com/rbattistini/SocNetAlgsOnGPU",
    supervisor-url: "https://www.moreno.marzolla.name/"
  ),
)

#let skills = (
  "Languages": "Italian (Native), English (B2)",
  "Programming Languages": "Python, Java, Kotlin, Scala, JavaScript, C++, SQL, SPARQL",
  "Frameworks": "Flask, Dash, Vue.js, D3.js, Vert.x, RxJava, Akka, AWS Chalice",
  "Libraries & Engines": "scikit-learn, Pandas, Matplotlib, PyTorch, OpenCV, Spark",
  "Tools": "Git, Gradle, Docker, DVC, MLflow, CI/CD, Kanban, Scrum",
  "Databases": "MySQL, InfluxDB, MongoDB, Jena TDB2",
  "IDEs & Editors": "Intellij, MPS, Jupyter Notebook, Tableau, Visual Studio Code",
  "Platforms": "NixOS, Fedora Silverblue, Windows 10/11, Arduino, Android"
)

#let projects = (
  (
    title: "Content-Based Image Retrieval and Classification System",
    url: "https://gitlab.com/rbattistini/computer-vision-project/",
    description: (
      "Fine-tuning and evaluation of neural networks using PyTorch on Corel-1k and Caltech-101.",
      "Training and validation of classical ML models on latent vectors extracted from neural networks.",
      "Implementation of DVC, MLflow and Makefile for reproducibility and experiment tracking."
    )
  ),
  (
    title: "Forest Cover Type Prediction",
    url: "https://github.com/rbattistini/Forest-Cover-Type-Prediction",
    description: (
      "Processing of 581,000 instances and 55 variables with data cleaning and feature engineering.",
      "Comparison of classical ML models optimized through grid search and k-fold cross-validation.",
      "Performance evaluation using F1-score, confusion matrix and confidence intervals."
    )
  )
)

#let publications = (
  (
    citation: "G. Ciatto, G. Aguzzi, R. Battistini, M. Baiardi, S. Burattini, and A. Ricci, \"Exploiting GenAI for Plan Generation in BDI Agents\". In: 28th European Conference on Artificial Intelligence, ECAI 2025, Bologna, Italy, 25-30 October 2025. [Accepted, M454]",
    url: "https://ecai2025.org/accepted-papers/#main_track_accepted_papers"
  ),
)

#cv-template(
  name,
  subtitle,
  footer-text,
  contact-info,
  education,
  work-experience,
  skills,
  projects,
  publications: publications,
  section-titles: (
    education: "Education",
    work: "Work Experience",
    skills: "Skills",
    projects: "Projects", 
    publications: "Publications"
  ),
  supervisor-text: "Conducted at the University of Bologna and supervised by",
  education-labels: (
    thesis: "Thesis",
    supervisor: "Supervisor", 
    cosupervisor: "Co-supervisor",
    grade: "Grade"
  )
)