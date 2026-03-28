# Mattias Thalén's CV

- Email: [mattias.thalen@me.com](mailto:mattias.thalen@me.com)
- Location: Uppsala, Sweden
- LinkedIn: [mattias-thalén](https://linkedin.com/in/mattias-thalén)
- GitHub: [mattiasthalen](https://github.com/mattiasthalen)


# Summary
Analytics Consultant building data platforms and migrating legacy BI environments to modern stacks, with LLMs integrated into the daily development workflow. Active open-source contributor to SQLMesh, SQLGlot, and dlt. 13 years in supply chain and manufacturing, from the warehouse floor through an Oracle ERP rollout to global analytics platforms serving 500+ users.

# Open Source Contributions
## **SQLGlot**

2025

[github.com/tobymao/sqlglot](https://github.com/tobymao/sqlglot)

Open-source SQL parser and transpiler.

- Added the Microsoft Fabric SQL dialect across 9 merged PRs. Shipped in v26.30.0. A required upstream dependency for SQLMesh Fabric support.



## **SQLMesh**

2025

[github.com/TobikoData/sqlmesh](https://github.com/TobikoData/sqlmesh)

Open-source data transformation and orchestration tool.

- Built the Microsoft Fabric connector. Shipped in v0.210.0, with follow-up improvements in v0.228.0.



## **dlt**

2025

[github.com/dlt-hub/dlt](https://github.com/dlt-hub/dlt)

Open-source data ingestion framework by dltHub.

- Added the Microsoft Fabric warehouse destination with Lakehouse staging, enabling SCD2. Shipped in v1.21.0.



## **Bruin**

2026

[github.com/bruin-data/bruin](https://github.com/bruin-data/bruin)

Open-source data pipeline tool.

- Added Microsoft Fabric Warehouse support. Shipped in v0.11.442.

- Added Azure Key Vault as a secrets backend. Shipped in v0.11.443.



## **Qlik Parser**

2025

[github.com/mattiasthalen/qlik-parser](https://github.com/mattiasthalen/qlik-parser)

CLI tool written in Go that extracts Qlik scripts from binary files.

- Enables migration teams to extract and review Qlik logic without access to Qlik tooling. Built entirely with Claude Code.



# Certifications
## **Microsoft Certified - Fabric Data Engineer Associate**

Aug 2025

[learn.microsoft.com/api/credentials/share/en-us/mattiasthalen/A2A3A7534C2AA848](https://learn.microsoft.com/api/credentials/share/en-us/mattiasthalen/A2A3A7534C2AA848)



## **Microsoft Certified - Fabric Analytics Engineer Associate**

Sept 2024

[learn.microsoft.com/api/credentials/share/en-us/mattiasthalen/B2D8389746CF89A2](https://learn.microsoft.com/api/credentials/share/en-us/mattiasthalen/B2D8389746CF89A2)



## **dbt Developer**

July 2024

[credentials.getdbt.com/abdeb34d-9514-4e6d-af0a-24d30f3f51e0](https://credentials.getdbt.com/abdeb34d-9514-4e6d-af0a-24d30f3f51e0)



## **Qlik Sense Business Analyst**

Mar 2024

[www.credly.com/badges/8df065ec-b338-4800-bbb7-78375bf685c8](https://www.credly.com/badges/8df065ec-b338-4800-bbb7-78375bf685c8)



## **Qlik Sense Data Architect**

Mar 2024

[www.credly.com/badges/a4622c11-aa2b-4916-bb63-98d28384db39](https://www.credly.com/badges/a4622c11-aa2b-4916-bb63-98d28384db39)



## **Microsoft Certified - Azure Data Fundamentals**

Feb 2023

[www.credly.com/badges/65afb248-b4d8-4757-8435-35f8a141f32a](https://www.credly.com/badges/65afb248-b4d8-4757-8435-35f8a141f32a)



# Skills
**Disciplines:** Analytics Engineering, Data Engineering, Business Intelligence (BI)

**Methodologies:** Data Modeling, Data Warehousing, ETL/ELT, Unified Star Schema, Medallion Architecture, Hook Methodology

**Languages:** Python, SQL

**Technologies:** Microsoft Fabric, Qlik Sense, Azure Data Factory, dbt, SQLMesh, dlt

# Featured Project
## **Cytiva - One Warehouse**

2017

**Tech Stack:** Qlik Sense

Global Supply Chain had no BI for warehouse operations; all existing reporting was sales-focused. As the sole developer, I built a global Qlik app covering inbound, outbound, and inventory management for warehouses in Sweden, the US, Japan, Hong Kong, and Singapore. Data was sourced from Oracle WMS. Replaced a daily emailed spreadsheet with live analytics displayed on warehouse floor screens. Became the most-used app in Global Supply Chain and drove weekly global meetings where each site reviewed their numbers. 500+ users, still in use.



# Project History
## **Avarn Security - Qlik to Fabric Migration**

2026

**Tech Stack:** Microsoft Fabric, dlt, dbt

The client wanted to future-proof their data platform for ML/AI capabilities. Serving as architect and Qlik/Fabric SME alongside Atea Norway, I am designing the migration of the ETL layer for their P&L solution (~15 data sources) from Qlik into Microsoft Fabric. A pilot Power BI app is being built in parallel to validate the new platform for end users.



## **Löfbergs Coffee**

2026

**Tech Stack:** Microsoft Fabric, dlt, SQLMesh, Power BI

An international coffee company facing QlikView end-of-life needed a full platform migration. As lead developer in a team of six, I define the architecture and mentor other developers while migrating ~20 QlikView apps across finance, operations, and sales into Microsoft Fabric with Power BI. The new platform enables self-service analytics and ML/AI capabilities that were not possible on QlikView.



## **Jaktia**

2025

**Tech Stack:** Microsoft Fabric, dlt, SQLMesh

A retail company with a brand-new ERP (Omnium) had no analytics. In a team of three, I designed and built the data platform from the ground up, covering ingestion, historization, and a self-service consumption layer. Delivered a working foundation; the client paused the project to complete their ERP migration.



## **Arctic Paper**

2025

**Tech Stack:** Qlik Sense, dlt

HR lacked visibility into workforce skills across the organization. As the sole developer, I built a talent analytics solution integrating Visma HR, JDE, Maximo, and a homegrown talent system into Qlik. The solution maps skills, grades, and credential expirations across 10 departments, enabling HR to spot skill gaps and plan hiring and training. Adopted by ~200 employees.



## **Volvohandlarförening**

2025

**Tech Stack:** Azure SQL, Azure Data Factory, dlt

An existing Azure-based data warehouse had unreliable Data Factory pipelines and slow stored procedures. Working solo, I introduced dlt to replace complex unnesting logic and refactored key stored procedures, cutting execution time from ~10 hours to ~10 minutes. The platform serves ~140 users across 7 dealerships with sales, invoicing, and HR analytics.



## **Statens Servicecenter**

2024

**Tech Stack:** Qlik Sense

The agency needed to move complex budget allocation logic out of the niche tool Planacy into a more maintainable Qlik platform. In a team of three, I rebuilt the allocation logic in Qlik and documented the entire budgeting process as a Mermaid flowchart, giving the agency their first visual representation of the logic.



## **Life Science Corporation**

2024

**Tech Stack:** Qlik Sense

A LIMS upgrade removed the reporting capabilities the organization depended on. In a team of two, I built a new data model in Qlik that replicated and improved on the old reports, replacing static Excel exports with dynamic, explorable dashboards. 80-100 users regained their reporting within 8 weeks.



## **Vinnova - Sweden's Innovation Agency**

2023

**Tech Stack:** Qlik Sense

Vinnova had a mature Qlik Sense environment that needed expanded reporting and ongoing maintenance. In a team of five, I built new reports, refactored data models, and compiled data for annual finance reporting delivered to regulatory authorities, with metrics that change each reporting cycle. Also led the Qlik Sense version upgrade across ~20 apps and 100 users.



## **Cytiva - Project Harmony**

2014

**Tech Stack:** Oracle

A global project to onboard all Cytiva warehouses to Oracle. As the warehouse operations representative for the template organization in Uppsala, I defined WMS rules, labels, and processes. Traveled to the US for the second warehouse go-live, after which the template was complete. This was where I first learned Oracle SQL.



# Experience
## **Enqore**, Analytics Consultant

2025 – present



1 year



## **Epical**, Analytics Consultant

2023 – 2025



2 years



## **Cytiva**, Analyst & Process Development Planner

2010 – 2023



13 years

- Analyst & Process Development Planner (2021–2023): Built the analytics platform for the planning department (production, distribution, material) from scratch in Qlik. Delivered KPI dashboards for ~25 users and leadership, enabling data-driven decisions where none existed. Still in use.

- BI Support Specialist (2017–2021): Built the One Warehouse suite covering fulfillment (inbound, outbound, in transit), inventory management (physical and cycle count), and a near-real-time operations dashboard. Also ran a machine learning POC for QA/QC that identified test groupings, helping the team prioritize focus areas.

- Logistics Specialist (2015–2017): Managed exports, including monitoring warehouse shipments and preparing export documentation.

- Warehouse Associate & Deviation Handler (2010–2015): Started picking, packing, and shipping orders. Built a jQuery web app to automate time reporting, used by 20 consultants. Selected for Project Harmony, onboarding warehouses to Oracle, where I first learned SQL. Later handled warehouse process deviations, helped set up the 3PL during outsourcing, and started building Qlik apps as side projects.


