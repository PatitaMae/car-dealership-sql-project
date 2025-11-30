# Car Dealership SQL Project

Portfolio project: a SQL-based data model for a **multi-branch car dealership**.

This project focuses on:

- Modeling branches, car models, inventory, customers, and sales.
- Tracking **inventory levels per branch**.
- Identifying **low-stock models** that need restocking.
- Running common **analytics queries** (best-selling models, revenue per branch, etc.).

All examples use **MySQL** syntax.

---

## 1. Project Structure

```text
car-dealership-sql-project/
├─ README.md
├─ sql/
│  ├─ schema.sql           # CREATE TABLE statements
│  ├─ sample_data.sql      # INSERT statements with sample data
│  └─ analysis_queries.sql # Example queries for analysis and reporting
└─ docs/
   └─ erd-notes.md         # Optional: notes/diagram description for the data model
