# Oracle_SQL

📘 Oracle HR Schema – Database Overview

This repository contains a detailed explanation of the Oracle HR (Human Resources) Schema, one of the most commonly used sample schemas for learning SQL, practicing queries, and understanding relational database design.

The HR Schema represents a fictional company’s employees, departments, jobs, and geographical information.
It is widely used in Oracle SQL Developer, SQL*Plus, and various database training environments.

📂 Schema Diagram

The HR Schema includes 7 main tables, all connected with primary–foreign key relationships:

REGIONS → COUNTRIES → LOCATIONS → DEPARTMENTS → EMPLOYEES → JOBS
                          ↑                    ↘
                          |                     JOB_HISTORY

🗂 Table Descriptions

Below is a clean overview of each table and its purpose.

🔹 1. EMPLOYEES

Primary Key: employee_id

Stores employee personal, job, managerial, and salary details.

Important Columns:

first_name, last_name, email, phone_number

hire_date

job_id (FK → JOBS)

salary, commission_pct

manager_id (FK → EMPLOYEES)

department_id (FK → DEPARTMENTS)

Employees are the central entity connecting multiple tables in the schema.

🔹 2. JOBS

Primary Key: job_id

Defines job roles within the company.

Important Columns:

job_title

min_salary

max_salary

Each employee is assigned a job based on this table.

🔹 3. JOB_HISTORY

Tracks previous job roles held by employees.

Composite Key: employee_id, start_date

Important Columns:

employee_id (FK → EMPLOYEES)

start_date, end_date

job_id (FK → JOBS)

department_id (FK → DEPARTMENTS)

Used for HR analytics and promotions history.

🔹 4. DEPARTMENTS

Primary Key: department_id

Represents company departments such as IT, HR, Finance, etc.

Important Columns:

department_name

manager_id (FK → EMPLOYEES)

location_id (FK → LOCATIONS)

Each department belongs to a location.

🔹 5. LOCATIONS

Primary Key: location_id

Stores physical office locations.

Important Columns:

street_address, postal_code

city, state_province

country_id (FK → COUNTRIES)

🔹 6. COUNTRIES

Primary Key: country_id

Represents countries where the company operates.

Important Columns:

country_name

region_id (FK → REGIONS)

🔹 7. REGIONS

Primary Key: region_id

A high-level grouping of countries.

Important Columns:

region_name (e.g., "Europe", "Asia")

🔗 Relationships Summary
Geographical Hierarchy

Regions
→ Countries
→ Locations
→ Departments

Employee/Job Hierarchy

Departments
→ Employees
→ Jobs
→ Job History

Manager Structure

Employees may be supervised by another employee (manager_id referencing the same table).

🎯 Purpose of This Schema

The Oracle HR Schema is used to:

✔ Learn SQL (SELECT, JOIN, GROUP BY, etc.)
✔ Practice DDL & DML operations
✔ Understand primary–foreign key relationships
✔ Demonstrate relational database design
✔ Build sample applications and dashboards
✔ Perform analytics on employee/job data

📁 Use Cases in Learning

This schema is ideal for:

SQL beginners

Database engineering students

Backend developers

Data analysts

Oracle certification preparation

Teaching DBMS fundamentals

🚀 Getting Started

If you're using Oracle Database:

Enable the HR user:
ALTER USER hr ACCOUNT UNLOCK;
ALTER USER hr IDENTIFIED BY hr;

Connect:
sqlplus hr/hr


You can then run SELECT queries on any of the tables such as:

SELECT first_name, last_name, salary
FROM employees;

📝 License

This is a documentation-only repository based on the standard Oracle HR sample schema.
Oracle owns all rights to the original schema structure.
