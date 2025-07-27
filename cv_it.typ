#import "template.typ": cv-template
#import "lib.typ": build-contact, icon, sm_icon

#let name = "Riccardo Battistini"
#let subtitle = "Laureato in Ingegneria e Scienze Informatiche"

#let footer-text = "Autorizzo il trattamento dei dati personali contenuti in questo documento in base all'art. 13 del D. Lgs. 196/2003 e all'art. 13 GDPR 679/16."

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
    degree: "Triennale in Ingegneria e Scienze Informatiche",
    institution: "Università di Bologna",
    period: "09/18-12/21",
    thesis: "Descriptive Text Mining in ambito medico: applicazione della metodologia POIROT",
    thesis-url: "https://amslaurea.unibo.it/id/eprint/24781/",
    supervisor: "Gianluca Moro",
    supervisor-url: "https://www.unibo.it/sitoweb/gianluca.moro/en",
    grade: "100/110"
  ),
  (
    degree: "Magistrale in Ingegneria e Scienze Informatiche",
    institution: "Università di Bologna",
    period: "12/21-07/25",
    thesis: "Exploiting GenAI for Plan Generation in BDI Agents",
    thesis-url: "https://github.com/rbattistini/master-thesis",
    supervisor: "Giovanni Ciatto",
    supervisor-url: "https://www.unibo.it/sitoweb/giovanni.ciatto/en",
    cosupervisor: "Gianluca Aguzzi",
    cosupervisor-url: "https://www.unibo.it/sitoweb/gianluca.aguzzi/en",
    grade: "110/110 e lode"
  )
)

#let work-experience = (
  (
    title: "Tirocinio curriculare di High-Performance Computing",
    period: "03/20-05/20",
    description: "Implementazione di un algoritmo parallelo per il calcolo di metriche di centralità su GPU.",
    supervisor: "Moreno Marzolla",
    url: "https://github.com/rbattistini/SocNetAlgsOnGPU",
    supervisor-url: "https://www.moreno.marzolla.name/"
  ),
)

#let skills = (
  "Lingue": "Italiano (Madrelingua), Inglese (B2)",
  "Linguaggi di Programmazione": "Python, Java, Kotlin, Scala, JavaScript, C++, SQL, SPARQL",
  "Framework": "Flask, Dash, Vue.js, D3.js, Vert.x, RxJava, Akka, AWS Chalice",
  "Librerie ed Engine": "scikit-learn, Pandas, Matplotlib, PyTorch, OpenCV, Spark",
  "Strumenti": "Git, Gradle, Docker, DVC, MLflow, CI/CD, Kanban, Scrum",
  "Database": "MySQL, InfluxDB, MongoDB, Jena TDB2",
  "IDE ed Editor": "Intellij, MPS, Jupyter Notebook, Tableau, Visual Studio Code",
  "Piattaforme": "NixOS, Fedora Silverblue, Windows 10/11, Arduino, Android"
)

#let projects = (
  (
    title: "Sistema di Content-Based Image Retrieval e Classificazione",
    url: "https://gitlab.com/rbattistini/computer-vision-project/",
    description: (
      "Fine-tuning e valutazione di reti neurali tramite PyTorch sui dataset Corel-1k e Caltech-101.",
      "Addestramento e validazione di modelli ML classici su vettori latenti estratti da reti neurali.",
      "Impiego di DVC, MLflow e Makefile per la riproducibilità e il tracciamento degli esperimenti."
    )
  ),
  (
    title: "Predizione del tipo di copertura forestale",
    url: "https://github.com/rbattistini/Forest-Cover-Type-Prediction",
    description: (
      "Analisi ed elaborazione di 581.000 istanze e 55 variabili con data cleaning e feature engineering.",
      "Confronto di modelli di ML classici ottimizzati tramite grid search e k-fold cross-validation.",
      "Valutazione delle prestazioni tramite F1-score, matrice di confusione e intervalli di confidenza."
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
    education: "Educazione",
    work: "Esperienza Lavorativa",
    skills: "Competenze", 
    projects: "Progetti",
    publications: "Pubblicazioni"
  ),
  supervisor-text: "Svolto presso l'università di Bologna e supervisionato da",
  education-labels: (
    thesis: "Tesi",
    supervisor: "Supervisore",
    cosupervisor: "Cosupervisore",
    grade: "Voto"
  )
)