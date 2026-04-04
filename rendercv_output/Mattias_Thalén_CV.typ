// Import the rendercv function and all the refactored components
#import "@preview/rendercv:0.1.0": *

// Apply the rendercv template with custom configuration
#show: rendercv.with(
  name: "Mattias Thalén",
  footer: context { [#emph[Mattias Thalén -- #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Last updated in Apr 2026] ],
  locale-catalog-language: "en",
  page-size: "a4",
  page-top-margin: 0.7in,
  page-bottom-margin: 0.7in,
  page-left-margin: 0.7in,
  page-right-margin: 0.7in,
  page-show-footer: true,
  page-show-top-note: true,
  colors-body: rgb(30, 30, 30),
  colors-name: rgb(74, 158, 255),
  colors-headline: rgb(74, 158, 255),
  colors-connections: rgb(74, 158, 255),
  colors-section-titles: rgb(74, 158, 255),
  colors-links: rgb(74, 158, 255),
  colors-footer: rgb(136, 136, 136),
  colors-top-note: rgb(136, 136, 136),
  typography-line-spacing: 0.6em,
  typography-alignment: "justified",
  typography-date-and-location-column-alignment: right,
  typography-font-family-body: "Merriweather",
  typography-font-family-name: "Merriweather",
  typography-font-family-headline: "Merriweather",
  typography-font-family-connections: "Merriweather",
  typography-font-family-section-titles: "Merriweather",
  typography-font-size-body: 10pt,
  typography-font-size-name: 30pt,
  typography-font-size-headline: 10pt,
  typography-font-size-connections: 10pt,
  typography-font-size-section-titles: 1.4em,
  typography-small-caps-name: false,
  typography-small-caps-headline: false,
  typography-small-caps-connections: false,
  typography-small-caps-section-titles: false,
  typography-bold-name: true,
  typography-bold-headline: false,
  typography-bold-connections: false,
  typography-bold-section-titles: true,
  links-underline: false,
  links-show-external-link-icon: false,
  header-alignment: center,
  header-photo-width: 3.5cm,
  header-space-below-name: 0.7cm,
  header-space-below-headline: 0.7cm,
  header-space-below-connections: 0.7cm,
  header-connections-hyperlink: true,
  header-connections-show-icons: true,
  header-connections-display-urls-instead-of-usernames: false,
  header-connections-separator: "",
  header-connections-space-between-connections: 0.5cm,
  section-titles-type: "with_partial_line",
  section-titles-line-thickness: 0.5pt,
  section-titles-space-above: 0.5cm,
  section-titles-space-below: 0.3cm,
  sections-allow-page-break: true,
  sections-space-between-text-based-entries: 0.3em,
  sections-space-between-regular-entries: 1.2em,
  entries-date-and-location-width: 4.15cm,
  entries-side-space: 0.2cm,
  entries-space-between-columns: 0.1cm,
  entries-allow-page-break: false,
  entries-short-second-row: true,
  entries-summary-space-left: 0cm,
  entries-summary-space-above: 0cm,
  entries-highlights-bullet:  "•" ,
  entries-highlights-nested-bullet:  "•" ,
  entries-highlights-space-left: 0.15cm,
  entries-highlights-space-above: 0cm,
  entries-highlights-space-between-items: 0cm,
  entries-highlights-space-between-bullet-and-text: 0.5em,
  date: datetime(
    year: 2026,
    month: 4,
    day: 4,
  ),
)


#grid(
  columns: (auto, 1fr),
  column-gutter: 0cm,
  align: horizon + left,
  [#pad(left: 0.4cm, right: 0.4cm, image("mattias_thalen.jpg", width: 3.5cm))
],
  [
= Mattias Thalén

  #headline([Data Engineer & Architect])

#connections(
  [#connection-with-icon("location-dot")[Uppsala, Sweden]],
  [#link("mailto:mattias.thalen@me.com", icon: false, if-underline: false, if-color: false)[#connection-with-icon("envelope")[mattias.thalen\@me.com]]],
  [#link("https://linkedin.com/in/mattias-thalén", icon: false, if-underline: false, if-color: false)[#connection-with-icon("linkedin")[mattias-thalén]]],
  [#link("https://github.com/mattiasthalen", icon: false, if-underline: false, if-color: false)[#connection-with-icon("github")[mattiasthalen]]],
)
  ]
)


== Summary

Data Engineer & Architect specializing in data platform migrations, primarily Qlik to Microsoft Fabric, using dlt and SQLMesh. When those tools lacked Fabric support, I contributed it as an active open-source maintainer on SQLMesh, SQLGlot, and dlt. 13 years at Cytiva, from operations to global analytics, means I start with what the business actually needs, not the tech stack.

== Experience

#regular-entry(
  [
    #strong[Enqore], Analytics Consultant

    - #strong[Avarn Security] (Microsoft Fabric, dlt, dbt): The client wanted to future-proof their data platform for ML\/AI capabilities. Serving as architect and Qlik\/Fabric SME alongside Atea Norway, designing the migration of the ETL layer for their P&L solution (\~15 data sources) from Qlik into Microsoft Fabric. A pilot Power BI app is being built in parallel to validate the new platform for end users.

    - #strong[Löfbergs Coffee] (Microsoft Fabric, dlt, SQLMesh, Power BI): An international coffee company facing QlikView end-of-life needed a full platform migration. As lead developer in a team of six, I define the architecture and mentor other developers while migrating \~20 QlikView apps across finance, operations, and sales into Microsoft Fabric with Power BI. The new platform enables self-service analytics and ML\/AI capabilities that were not possible on QlikView.

    - #strong[Jaktia] (Microsoft Fabric, dlt, SQLMesh): A retail company with a brand-new ERP (Omnium) had no analytics. In a team of three, I designed and built the data platform from the ground up, covering ingestion, historization, and a self-service consumption layer. Delivered a production-ready data foundation ahead of the ERP migration timeline.

    - #strong[Arctic Paper] (Qlik Sense, dlt): HR lacked visibility into workforce skills across the organization. As sole developer, I built a talent analytics solution integrating Visma HR, JDE, Maximo, and a homegrown talent system into Qlik. The solution maps skills, grades, and credential expirations across 10 departments, enabling HR to spot skill gaps and plan hiring and training. Adopted by \~200 employees.

    - #strong[Volvohandlarförening] (Azure SQL, Azure Data Factory, dlt): An existing Azure-based data warehouse had unreliable Data Factory pipelines and slow stored procedures. As sole developer, I introduced dlt to replace complex unnesting logic and refactored key stored procedures, cutting execution time from \~10 hours to \~10 minutes. The platform serves \~140 users across 7 dealerships with sales, invoicing, and HR analytics.

  ],
  [
    2025 – present

    1 year

  ],
)

#regular-entry(
  [
    #strong[Epical], Analytics Consultant

    - #strong[Statens Servicecenter] (Qlik Sense): The agency needed to move complex budget allocation logic out of the niche tool Planacy into a more maintainable Qlik platform. In a team of three, I rebuilt the allocation logic in Qlik and documented the entire budgeting process as a Mermaid flowchart, giving the agency their first visual representation of the logic.

    - #strong[Octapharma] (Qlik Sense): A LIMS upgrade removed the reporting capabilities the organization depended on. In a team of two, I built a new data model in Qlik that replicated and improved on the old reports, replacing static Excel exports with dynamic, explorable dashboards. 80-100 users regained their reporting within 8 weeks.

    - #strong[Vinnova] (Qlik Sense): Vinnova had a mature Qlik Sense environment that needed expanded reporting and ongoing maintenance. In a team of five, I built new reports, refactored data models, and compiled data for annual finance reporting delivered to regulatory authorities, with metrics that change each reporting cycle. Also led the Qlik Sense version upgrade across \~20 apps and 100 users.

  ],
  [
    2023 – 2025

    2 years

  ],
)

#regular-entry(
  [
    #strong[Cytiva], Analyst & Process Development Planner

    - #strong[One Warehouse] (Qlik Sense): Built a global Qlik app covering inbound, outbound, and inventory management for warehouses in Sweden, the US, Japan, Hong Kong, and Singapore. Replaced a daily emailed spreadsheet with live analytics displayed on warehouse floor screens. Became the most-used app in Global Supply Chain and drove weekly global meetings where each site reviewed their numbers. 500+ users, still in use.

    - #strong[Project Carrot] (Oracle): Moved all Uppsala warehouse operations to a 3PL, defining new WMS rules for inbound and outbound. Enabled the site to operate under a third-party logistics provider without disruption.

    - #strong[Project Harmony] (Oracle): Global project to onboard all Cytiva warehouses to Oracle WMS. As the warehouse operations representative for the template organization in Uppsala, defined WMS rules, labels, and processes. Traveled to the US for the second warehouse go-live, after which the template was complete.

    - #strong[Analyst & Process Development Planner] (2021–2023): Built the analytics platform for the planning department (production, distribution, material) from scratch in Qlik. Delivered KPI dashboards for \~25 users and leadership, enabling data-driven decisions where none existed. Still in use.

    - #strong[Earlier:] Logistics Specialist, Deviation Handler, Warehouse Associate (2010–2017). Built initial Qlik apps as side projects and a jQuery web app to automate time reporting. Selected for Project Harmony and Project Carrot.

  ],
  [
    2010 – 2023

    13 years

  ],
)

== Open Source Contributions

#regular-entry(
  [
    #strong[SQLGlot]

    #link("https://github.com/tobymao/sqlglot")[github.com\/tobymao\/sqlglot]

    #summary[Open-source SQL parser and transpiler.]

    - Added the Microsoft Fabric SQL dialect across 9 merged PRs. Shipped in v26.30.0. A required upstream dependency for SQLMesh Fabric support.

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[SQLMesh]

    #link("https://github.com/TobikoData/sqlmesh")[github.com\/TobikoData\/sqlmesh]

    #summary[Open-source data transformation and orchestration tool.]

    - Built the Microsoft Fabric connector. Shipped in v0.210.0, with follow-up improvements in v0.228.0.

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[dlt]

    #link("https://github.com/dlt-hub/dlt")[github.com\/dlt-hub\/dlt]

    #summary[Open-source data ingestion framework by dltHub.]

    - Added the Microsoft Fabric warehouse destination with Lakehouse staging, enabling SCD2. Shipped in v1.21.0.

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Bruin]

    #link("https://github.com/bruin-data/bruin")[github.com\/bruin-data\/bruin]

    #summary[Open-source data pipeline tool.]

    - Added Microsoft Fabric Warehouse support. Shipped in v0.11.442.

    - Added Azure Key Vault as a secrets backend. Shipped in v0.11.443.

  ],
  [
    2026

  ],
)

== Personal Projects

#regular-entry(
  [
    #strong[adventure-works]

    #link("https://github.com/mattiasthalen/adventure-works")[github.com\/mattiasthalen\/adventure-works]

    #summary[Reference implementation of a complete data platform using dlt, SQLMesh, and DuckDB. 200+ models, 124 stars on GitHub.]

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Qlik Parser]

    #link("https://github.com/mattiasthalen/qlik-parser")[github.com\/mattiasthalen\/qlik-parser]

    #summary[CLI tool written in Go that extracts Qlik scripts from binary files.]

    - Enables migration teams to extract and review Qlik logic without access to Qlik tooling. Built entirely with Claude Code.

  ],
  [
    2025

  ],
)

== Certifications

#regular-entry(
  [
    #strong[Microsoft Certified - Fabric Data Engineer Associate]

    #link("https://learn.microsoft.com/api/credentials/share/en-us/mattiasthalen/A2A3A7534C2AA848")[learn.microsoft.com\/api\/credentials\/share\/en-us\/mattiasthalen\/A2A3A7534C2AA848]

  ],
  [
    Aug 2025

  ],
)

#regular-entry(
  [
    #strong[Microsoft Certified - Fabric Analytics Engineer Associate]

    #link("https://learn.microsoft.com/api/credentials/share/en-us/mattiasthalen/B2D8389746CF89A2")[learn.microsoft.com\/api\/credentials\/share\/en-us\/mattiasthalen\/B2D8389746CF89A2]

  ],
  [
    Sept 2024

  ],
)

#regular-entry(
  [
    #strong[dbt Developer]

    #link("https://credentials.getdbt.com/abdeb34d-9514-4e6d-af0a-24d30f3f51e0")[credentials.getdbt.com\/abdeb34d-9514-4e6d-af0a-24d30f3f51e0]

  ],
  [
    July 2024

  ],
)

#regular-entry(
  [
    #strong[Qlik Sense Business Analyst]

    #link("https://www.credly.com/badges/8df065ec-b338-4800-bbb7-78375bf685c8")[www.credly.com\/badges\/8df065ec-b338-4800-bbb7-78375bf685c8]

  ],
  [
    Mar 2024

  ],
)

#regular-entry(
  [
    #strong[Qlik Sense Data Architect]

    #link("https://www.credly.com/badges/a4622c11-aa2b-4916-bb63-98d28384db39")[www.credly.com\/badges\/a4622c11-aa2b-4916-bb63-98d28384db39]

  ],
  [
    Mar 2024

  ],
)

#regular-entry(
  [
    #strong[Microsoft Certified - Azure Data Fundamentals]

    #link("https://www.credly.com/badges/65afb248-b4d8-4757-8435-35f8a141f32a")[www.credly.com\/badges\/65afb248-b4d8-4757-8435-35f8a141f32a]

  ],
  [
    Feb 2023

  ],
)

== Education and Development

Applied training across 13 years at Cytiva (GE Healthcare Life Sciences), from warehouse operations to global analytics architecture. Continuous professional development through industry certifications and active open-source contributions.

== Skills

#strong[Disciplines:] Analytics Engineering, Data Engineering, Data Architecture, Business Intelligence (BI)

#strong[Methodologies:] Data Modeling, Data Warehousing, ETL\/ELT, Unified Star Schema, Medallion Architecture, Hook Methodology

#strong[Languages:] Python, SQL, Go, Clojure

#strong[Technologies:] Microsoft Fabric, Qlik Sense, Azure Data Factory, dbt, SQLMesh, dlt, DuckDB
