// Import the rendercv function and all the refactored components
#import "@preview/rendercv:0.1.0": *

// Apply the rendercv template with custom configuration
#show: rendercv.with(
  name: "Mattias Thalén",
  footer: context { [#emph[Mattias Thalén -- #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Last updated in Dec 2025] ],
  locale-catalog-language: "en",
  page-size: "us-letter",
  page-top-margin: 0.7in,
  page-bottom-margin: 0.7in,
  page-left-margin: 0.7in,
  page-right-margin: 0.7in,
  page-show-footer: true,
  page-show-top-note: true,
  colors-body: rgb(0, 0, 0),
  colors-name: rgb(0, 79, 144),
  colors-headline: rgb(0, 79, 144),
  colors-connections: rgb(0, 79, 144),
  colors-section-titles: rgb(0, 79, 144),
  colors-links: rgb(0, 79, 144),
  colors-footer: rgb(128, 128, 128),
  colors-top-note: rgb(128, 128, 128),
  typography-line-spacing: 0.6em,
  typography-alignment: "justified",
  typography-date-and-location-column-alignment: right,
  typography-font-family-body: "Source Sans 3",
  typography-font-family-name: "Source Sans 3",
  typography-font-family-headline: "Source Sans 3",
  typography-font-family-connections: "Source Sans 3",
  typography-font-family-section-titles: "Source Sans 3",
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
    year: 2025,
    month: 12,
    day: 28,
  ),
)


= Mattias Thalén

#connections(
  [#connection-with-icon("location-dot")[Uppsala, Sweden]],
  [#link("mailto:mattias.thalen@me.com", icon: false, if-underline: false, if-color: false)[#connection-with-icon("envelope")[mattias.thalen\@me.com]]],
  [#link("https://linkedin.com/in/mattias-thalén", icon: false, if-underline: false, if-color: false)[#connection-with-icon("linkedin")[mattias-thalén]]],
  [#link("https://github.com/mattiasthalen", icon: false, if-underline: false, if-color: false)[#connection-with-icon("github")[mattiasthalen]]],
)


== Summary

Experienced Analytics Consultant with a strong background in Business Intelligence, Data Engineering, and Analytics Engineering. Proficient in Microsoft Fabric, Qlik Sense, and dbt, with a proven track record of delivering data-driven solutions that enhance business performance. Skilled in data modeling, ETL processes, and creating self-service analytics platforms. Committed to continuous improvement and leveraging data to drive strategic decision-making.

== Contributions

#regular-entry(
  [
    #strong[#link("https://github.com/tobymao/sqlglot")[SQLGlot]]

    #summary[Added support for Microsoft Fabric SQL dialect to the open-source SQL parser and transpiler SQLGlot.]

  ],
  [
  ],
)

#regular-entry(
  [
    #strong[#link("https://github.com/TobikoData/sqlmesh")[SQLMesh]]

    #summary[Added support for Microsoft Fabric to SQLMesh, an open-source data transformation and orchestration tool.]

  ],
  [
  ],
)

#regular-entry(
  [
    #strong[#link("https://github.com/dlt-hub/dlt")[dltHub]]

    #summary[Added support for Microsoft Fabric to dltHub, an open-source data ingestion framework.]

  ],
  [
  ],
)

== Certifications

#regular-entry(
  [
    #strong[#link("https://learn.microsoft.com/api/credentials/share/en-us/mattiasthalen/A2A3A7534C2AA848")[Microsoft Certified - Fabric Data Engineer Associate]]

    #summary[Issued by Microsoft. Credential ID A2A3A7534C2AA848.]

  ],
  [
    Aug 2025

  ],
)

#regular-entry(
  [
    #strong[#link("https://learn.microsoft.com/api/credentials/share/en-us/mattiasthalen/B2D8389746CF89A2")[Microsoft Certified - Fabric Analytics Engineer Associate]]

    #summary[Issued by Microsoft. Credential ID B2D8389746CF89A2.]

  ],
  [
    Sept 2024

  ],
)

#regular-entry(
  [
    #strong[#link("https://credentials.getdbt.com/abdeb34d-9514-4e6d-af0a-24d30f3f51e0")[dbt Developer]]

    #summary[Issued by dbt Labs. Credential ID 108086585.]

  ],
  [
    July 2024

  ],
)

#regular-entry(
  [
    #strong[#link("https://www.credly.com/badges/8df065ec-b338-4800-bbb7-78375bf685c8")[Qlik Sense Business Analyst]]

    #summary[Issued by Qlik. Credential ID 8df065ec-b338-4800-bbb7-78375bf685c8.]

  ],
  [
    Mar 2024

  ],
)

#regular-entry(
  [
    #strong[#link("https://www.credly.com/badges/a4622c11-aa2b-4916-bb63-98d28384db39")[Qlik Sense Data Architect]]

    #summary[Issued by Qlik. Credential ID a4622c11-aa2b-4916-bb63-98d28384db39.]

  ],
  [
    Mar 2024

  ],
)

#regular-entry(
  [
    #strong[#link("https://www.credly.com/badges/65afb248-b4d8-4757-8435-35f8a141f32a")[Microsoft Certified - Azure Data Fundamentals]]

    #summary[Issued by Microsoft. Credential ID 65afb248-b4d8-4757-8435-35f8a141f32a.]

  ],
  [
    Feb 2023

  ],
)

== Skills

#strong[Disciplines:] Analytics Engineering, Data Engineering, Business Intelligence (BI)

#strong[Methodologies:] Data Modeling, Data Warehousing, ETL\/ELT, Unified Star Schema, Medallion Architecture, Hook Methodology

#strong[Languages:] Python, SQL

#strong[Technologies:] Microsoft Fabric, Qlik Sense, dbt, SQLMesh, dlt

== Projects

#regular-entry(
  [
    #strong[Jaktia]

    - Developed the architecture using dlt (dltHub) for rapid and stable ingestion of source data, and SQLMesh (dbt alternative) for transforming the raw data up until consumption. Follows a medallion architecture where we first historize the raw data, then organize it around core business concepts using the Hook methodology and finally deliver a self-service unified star schema to be consumed in PowerBI \/ Excel.

    - #strong[Technology:] Microsoft Fabric

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Arctic Paper]

    - Developed the architecture using dlt (dltHub) for ingestion. Qlik was used for the transformation. Follows the Analytical Data Storage System, where the first layer is according to how the system data looks. The middle layer is centered around how the business looks at the data; this is done by organizing it around core business concepts (the Hook Methodology). The last, and final layer is according to requirements, where we opted for the Unified Start Schema, due to it’s rapid and self-service centered core values.

    - #strong[Technology:] Qlik Sense

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Avarn Security]

    - Maintenace of existing solution, both front- and back-end.

    - #strong[Technology:] Qlik Sense & QlikView

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Volvohandlarförening]

    - Maintenance and new development of existing solution. Focusing on good architecture and a layered approach. I.e., medallion architecture \/ analytical data storage system.

    - #strong[Technology:] Azure SQL \/ Data Factory

  ],
  [
    2025

  ],
)

#regular-entry(
  [
    #strong[Swedish Government Agency]

    - Qlik Sense developer and system administrator. Migrated business logic from Planacy to Qlik platform, improving reporting capabilities.

    - #strong[Technology:] Qlik Sense

  ],
  [
    2024

  ],
)

#regular-entry(
  [
    #strong[Life Science Corporation]

    - Qlik Sense development and system administration. Executed data extraction migration from LIMS to Qlik, streamlining analytics processes.

    - #strong[Technology:] Qlik Sense

  ],
  [
    2024

  ],
)

#regular-entry(
  [
    #strong[Sveriges Kommuner & Regioner]

    - QlikView developer and system administrator. Developed solutions for comprehensive call statistics analytics.

    - #strong[Technology:] QlikView

  ],
  [
    2024

  ],
)

#regular-entry(
  [
    #strong[Vinnova – Sweden's Innovation Agency]

    - Qlik Sense developer and system administrator. Created data compilation solutions for annual finance reporting requirements. In charge of upgrading Qlik Sense.

    - #strong[Technology:] Qlik Sense

  ],
  [
    2023

  ],
)

#regular-entry(
  [
    #strong[Internationella Engelska Skolan]

    - Provided expert QlikView maintenance and development support, ensuring system stability and performance.

    - #strong[Technology:] QlikView

  ],
  [
    2023

  ],
)

== Experience

#regular-entry(
  [
    #strong[Two Sweden AB], Analytics Consultant

  ],
  [
    2023 – present

    2 years

  ],
)

#regular-entry(
  [
    #strong[Epical \/ Enfo], Analytics Consultant

  ],
  [
    2023 – 2023

    1 year

  ],
)

#regular-entry(
  [
    #strong[Cytiva \/ GE Healthcare], Analyst & Process Development Planner

  ],
  [
    2021 – 2023

    2 years

  ],
)

#regular-entry(
  [
    #strong[Cytiva \/ GE Healthcare], BI Support Specialist

  ],
  [
    2017 – 2021

    4 years

  ],
)

#regular-entry(
  [
    #strong[Cytiva \/ GE Healthcare], Logistics Specialist

  ],
  [
    2015 – 2017

    2 years

  ],
)

#regular-entry(
  [
    #strong[Cytiva \/ GE Healthcare], Deviation Handler

  ],
  [
    2015 – 2015

    1 year

  ],
)

#regular-entry(
  [
    #strong[Cytiva \/ GE Healthcare], Warehouse Associate

  ],
  [
    2010 – 2015

    5 years

  ],
)
