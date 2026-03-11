# Analytics SQL Patterns for AI Systems

Business-oriented SQL patterns for KPI analytics, customer behavior modeling, anomaly detection, and decision-support workflows.

---

## Overview

SQL remains foundational across applied data science, analytics engineering, and AI-enabled operational systems. In real-world environments, SQL is used not just for querying data, but for structuring KPIs, supporting operational monitoring, enabling customer intelligence workflows, and powering decision-support systems.

This repository provides a compact, reusable library of analytical SQL patterns aligned with practical use cases across telecom, digital services, subscription businesses, and enterprise analytics environments.

The examples focus on:

- KPI monitoring and trend analysis  
- customer usage and behavioral segmentation  
- retention and cohort measurement  
- anomaly detection workflows  
- deduplication and latest-record extraction  
- business-facing reporting logic for operational decisions  

Rather than isolated exercises, the repository is structured around reusable patterns that reflect real analytical workflows.

---

## Repository Structure

```
analytics-sql-patterns-for-ai-systems/
│
├── data/                      # Synthetic datasets (CSV)
├── sql/                       # SQL pattern modules
│   ├── 00_setup_duckdb.sql
│   ├── 01_window_analytics_patterns.sql
│   ├── 02_kpi_monitoring_patterns.sql
│   ├── 03_customer_behavior_patterns.sql
│   ├── 04_retention_and_cohort_patterns.sql
│   ├── 05_anomaly_detection_patterns.sql
│   └── 06_deduplication_and_latest_record_patterns.sql
│
└── README.md
```

---

## Covered SQL Pattern Areas

### Window Analytics Patterns
Examples using ranking functions, lag/lead comparisons, running totals, and rolling averages for time-series and behavioral analysis.

### KPI Monitoring Patterns
Aggregation logic for operational KPIs including service-level summaries, threshold monitoring, and trend tracking.

### Customer Behavior Patterns
Segmentation workflows including heavy-user identification, multi-service behavior analysis, and revenue-based ranking.

### Retention and Cohort Patterns
Cohort assignment and lifecycle analysis using activity-based retention tracking.

### Anomaly Detection Patterns
Rolling baselines, threshold logic, and deviation-based monitoring approaches for operational workflows.

### Deduplication and Latest Record Patterns
Reusable approaches for resolving duplicates, tracking latest states, and maintaining clean operational views.

---

## Datasets

The repository uses compact synthetic datasets designed to reflect realistic analytical use cases while remaining lightweight and portable.

Included datasets:

- `telecom_kpi_daily.csv` — daily KPI values by region, service, and site  
- `customer_usage_events.csv` — customer usage activity across services  
- `customer_subscriptions.csv` — subscription lifecycle data  
- `service_tickets.csv` — operational issue tracking records  

These datasets are generic enough to apply across telecom, subscription-based platforms, and enterprise analytics workflows.

---

## How to Run (DuckDB)

The repository can be executed quickly using DuckDB.

### 1. Install DuckDB (if needed)

```
pip install duckdb
```

### 2. Load datasets

From the project root:

```
duckdb analytics_sql_patterns.duckdb < sql/00_setup_duckdb.sql
```

This loads all datasets into DuckDB tables.

### 3. Run SQL modules

Example:

```
duckdb analytics_sql_patterns.duckdb
.read sql/01_window_analytics_patterns.sql
```

The SQL patterns are written in a PostgreSQL-compatible analytical style and remain broadly portable across modern analytical environments.

---

## Practical Relevance

These SQL patterns reflect common analytical workflows used across telecom, digital services, and enterprise analytics environments, particularly in contexts involving KPI monitoring, customer intelligence, operational analytics, and decision-support systems.

---

## License

MIT License
