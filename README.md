# Hospital Management System - Database Design Project

Welcome to the **Hospital Management System Database Design** project! This repository contains a fully normalized, enterprise-grade relational database schema designed to manage the core operations of a hospital or medical clinic.

This project is perfectly suited for building the backend data foundation of healthcare applications, clinical dashboards, and hospital administrative software.

---

## 📖 Project Overview

A Hospital Management System (HMS) handles complex daily operations: patient registrations, doctor scheduling, treatment tracking, and financial billing. This database is modeled to capture these real-world workflows accurately, ensuring data integrity, performance, and scalability.

We have structured this project into three distinct SQL scripts to make it easy to understand, deploy, and test:

1. **`01_schema.sql`**: The structural blueprint of the database.
2. **`02_sample_data.sql`**: A rich set of realistic dummy data to bring the database to life.
3. **`03_reports_and_queries.sql`**: Advanced analytical queries that a real hospital would use for reporting and dashboarding.

---

## 🏗️ Database Architecture & Core Tables

The database is built using standard SQL and is compatible with major relational database management systems (RDBMS) like PostgreSQL, MySQL, and SQL Server. It follows strict normalization rules to eliminate data redundancy.

Here is a breakdown of the core tables and their purpose:

### 1. `Patients` Table

The central repository for patient information.

- **Purpose:** Stores demographic details, contact information, and medical specifics.
- **Key Fields:** `date_of_birth`, `blood_group`, `emergency_contact`, and `insurance_provider`.
- **Design Note:** Kept separate from treatments to ensure a patient exists independently of their visits.

### 2. `Doctors` Table

Manages the hospital's medical staff.

- **Purpose:** Tracks doctor profiles, their specialties, and employment details.
- **Key Fields:** `specialization`, `department`, `consultation_fee`.
- **Design Note:** The `consultation_fee` allows the billing system to dynamically calculate costs based on which doctor was seen.

### 3. `Appointments` Table

The intersection of Patients and Doctors.

- **Purpose:** Handles the scheduling of visits.
- **Key Fields:** `appointment_date`, `appointment_time`, `status` (Scheduled, Completed, Cancelled).
- **Relationships:** Contains Foreign Keys linking back to both the `Patients` and `Doctors` tables.

### 4. `Treatments` Table

Records the actual medical care provided during an appointment.

- **Purpose:** Logs diagnoses, prescribed medications, and specific treatment procedures.
- **Key Fields:** `diagnosis`, `prescription`, `treatment_name`, `cost`.
- **Design Note:** Linked directly to a specific `appointment_id` to maintain a strict timeline of patient care.

### 5. `Bills` Table

The financial ledger for patient visits.

- **Purpose:** Aggregates the costs of treatments and doctor consultations.
- **Key Fields:** `total_amount`, `discount`, `net_amount`, `status` (Paid, Unpaid, Partial).
- **Design Note:** Acts as the master invoice for a specific hospital visit.

### 6. `Payments` Table

Tracks money coming into the hospital.

- **Purpose:** Records individual transactions made against a specific bill.
- **Key Fields:** `amount_paid`, `payment_method` (Cash, Insurance, Credit Card), `transaction_reference`.
- **Design Note:** Allows for multiple partial payments against a single bill.

---

## 🚀 How to Run and Test This Project

To get this database running on your local machine, follow these simple steps:

### Prerequisites:

- A SQL Database Engine installed (e.g., PostgreSQL, MySQL, SQL Server).
- A Database Client/IDE to run queries (e.g., DBeaver, pgAdmin, MySQL Workbench, or VS Code extensions).

### Step 1: Create the Schema

Open your SQL client, create a new database (e.g., `CREATE DATABASE hospital_db;`), and run the **`01_schema.sql`** script.

- _What this does:_ It creates all the empty tables, sets up the Primary Keys, Foreign Keys, and establishes the strict rules (constraints) that keep the data organized.

### Step 2: Populate with Sample Data

Execute the **`02_sample_data.sql`** script.

- _What this does:_ It inserts carefully crafted dummy data. You will instantly get patients, active doctors, scheduled appointments, past treatments, and a mix of paid/unpaid bills. This is crucial for testing your queries!

### Step 3: Run Reports and Analytics

Execute the queries found in **`03_reports_and_queries.sql`**.

- _What this does:_ It runs complex `SELECT` statements (using `JOIN`s, `GROUP BY`, and aggregations) to extract meaningful insights.

---

## 📊 Real-World Analytics Demonstrated

The `03_reports_and_queries.sql` file isn't just basic `SELECT * FROM table` commands. It demonstrates how a hospital administrator would actually use this data. Inside, you will find queries that answer:

1.  **Doctor Workload Metrics:** _Which doctors are seeing the most patients? How many appointments have they completed vs. scheduled?_
2.  **Comprehensive Patient History:** _If John Doe walks in, can we instantly pull up every doctor he's seen, his past diagnoses, and all his prescriptions?_
3.  **Accounts Receivable (Outstanding Bills):** _Which patients still owe the hospital money, and exactly how much is their outstanding balance?_
4.  **Revenue by Department:** _Is the Surgery department generating more revenue than the Oncology department this month?_
5.  **Scheduling Conflict Detection:** _Are there any errors where two patients are booked with the same doctor at the exact same time?_

---

## 💡 Skills and Concepts Showcased

If you are using this project for a portfolio or learning exercise, it demonstrates mastery of the following database concepts:

- **Entity-Relationship Modeling:** Correctly breaking down a complex real-world scenario into logical tables.
- **Normalization (1NF, 2NF, 3NF):** Ensuring data is stored efficiently without unnecessary repetition.
- **Data Integrity:** Using `FOREIGN KEY` constraints (`ON DELETE CASCADE`) to prevent orphaned records.
- **Advanced Data Retrieval:** Utilizing standard `JOIN`, `LEFT JOIN`, aggregate functions (`SUM`, `COUNT`), and conditional logic (`CASE WHEN`) to build meaningful reports.

---

_Built to simulate a modern, enterprise healthcare data architecture._
