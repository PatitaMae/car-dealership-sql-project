# Car Dealership SQL Project 🚗

A complete SQL-based data model for a **multi-branch car dealership**.  
This project includes a full database schema, sample data, relationship diagram (ERD), and analytical SQL queries.

The goal is to show how SQL can be used to model real business operations such as inventory tracking, sales, customers, and branch performance.

---

## 1. Project Structure

```text
car-dealership-sql-project/
├─ README.md
├─ sql/
│  ├─ schema.sql              # CREATE TABLE statements
│  ├─ sample_data.sql         # INSERT statements with example data
│  └─ analysis_queries.sql    # Analytical queries
└─ docs/
   └─ erd.png                 # Entity Relationship Diagram (ERD)
```

## 2. Entity Relationship Diagram (ERD)

The ERD below represents the full dataset model for this project, including all primary keys, foreign keys, and table relationships.

![ERD](docs/erd.png)

## 3. Database Overview

This project models a realistic multi-branch car dealership system.  
Below is a summary of each table in the database:

### **branches**
Stores dealership branch information (city, state, contact).

### **car_models**
Contains all vehicle model details (make, model, year, fuel type, body type).

### **customers**
Customer contact and location information.

### **inventory**
Tracks the quantity of each car model available at each branch, along with minimum stock thresholds.

### **sales**
Logs all vehicle sales, including price, date, branch, model, customer, and payment type.

## 4. How to Use

### **4.1. Create the database and tables**

Run the schema file in MySQL Workbench:

```sql
SOURCE sql/schema.sql;
```
### **4.2. Load the sample data**

```sql
USE car_dealership;
SOURCE sql/sample_data.sql;
```
### **4.3. Run the analysis queries**

```sql
USE car_dealership;
SOURCE sql/analysis_queries.sql;
```
## 5. Example Analyses

The SQL queries included in this project can answer real business questions such as:

- **Which branches have low inventory?**  
  Identify car models where quantity is below the minimum threshold.

- **What is the total revenue per branch?**  
  Summarize sales performance across dealership locations.

- **Which car models are top sellers?**  
  Rank vehicles based on units sold and total sales value.

- **How much has each customer spent?**  
  View purchase history and total spend per customer.

- **What is the average sale price per model?**  
  Understand pricing trends across different car models.

- **How many units does each branch have in stock?**  
  Get a full breakdown of inventory levels.

These examples are implemented in `sql/analysis_queries.sql`.

## 6. Future Improvements

Possible enhancements to expand this project:

- Add an **employees** table and track which salesperson handled each sale.
- Add **vehicle transfers** between branches (inventory movement).
- Add **suppliers** and **purchase orders** for restocking.
- ✅ Build a **Python analysis notebook** that connects to the database and visualizes data (see `notebooks/car_dealership_analysis.ipynb`).
- Create a **Power BI or Tableau dashboard** for sales and inventory insights.
- Develop a **REST API** using Flask or FastAPI to expose inventory and sales endpoints.
- Add **stored procedures** for automated restocking suggestions.
- Add **triggers** to update inventory automatically when sales occur.
- Add **views** for simplified reporting.

This roadmap helps plan future versions of the project while keeping the repository active and improving over time.

## 7. Tech Stack

This project uses:

- **MySQL** — relational database system
- **MySQL Workbench** — database design, ERD generation, and query execution
- **SQL** — schema design, data insertion, and analysis queries
- **Markdown (GitHub)** — documentation and project presentation
- **ERM/ERD tools in Workbench** — for visualizing database relationships

## 8. License

This project is open-source and available for learning, portfolio use, or extension.  
Feel free to use, modify, or build upon it.

## 9. Python Analysis Notebook

The Jupyter notebook in `notebooks/car_dealership_analysis.ipynb` connects to the
MySQL database and provides visual analysis of:

- Revenue by branch
- Top-selling models
- Low-stock vehicles
- Inventory totals per branch
- Customer spending


