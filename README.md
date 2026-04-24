# 🏥 Hospital Management System - Database Design Project

Welcome to the **Hospital Management System Database Design** project! This repository contains a fully normalized, enterprise-grade relational database schema designed to manage the core operations of a hospital or medical clinic.

This project is perfectly suited for building the backend data foundation of healthcare applications, clinical dashboards, and hospital administrative software.

---

## 📂 Document

### [Project Documentation & Resources](https://drive.google.com/file/d/139hLi_t5cZYQuEs8oL_Iv0jRKfYH-EKj/view?usp=sharing)

---

## 📖 Project Overview

A Hospital Management System (HMS) handles complex daily operations: patient registrations, doctor scheduling, treatment tracking, and financial billing. This database is modeled to capture these real-world workflows accurately, ensuring data integrity, performance, and scalability.

We have structured this project into three distinct SQL scripts to make it easy to understand, deploy, and test:

1.  **`01_schema.sql`**: The structural blueprint of the database.
2.  **`02_sample_data.sql`**: A rich set of realistic dummy data to bring the database to life.
3.  **`03_reports_and_queries.sql`**: Advanced analytical queries that a real hospital would use for reporting and dashboarding.

---

## 🏗️ Database Architecture & Core Tables

The database is built using standard SQL and is compatible with major relational database management systems (RDBMS) like PostgreSQL, MySQL, and SQL Server. It follows strict normalization rules to eliminate data redundancy.

### 1. `Patients` Table
The central repository for patient information.
-   **Purpose:** Stores demographic details, contact information, and medical specifics.
-   **Key Fields:** `patient_id`, `date_of_birth`, `blood_group`, `insurance_provider`.

### 2. `Doctors` Table
Manages the hospital's medical staff.
-   **Purpose:** Tracks doctor profiles, their specialties, and employment details.
-   **Key Fields:** `specialization`, `department`, `consultation_fee`.

### 3. `Appointments` Table
The intersection of Patients and Doctors.
-   **Purpose:** Handles the scheduling of visits and tracking appointment status.
-   **Key Fields:** `appointment_date`, `appointment_time`, `status` (Scheduled, Completed, Cancelled).

### 4. `Treatments` Table
Records the actual medical care provided during an appointment.
-   **Purpose:** Logs diagnoses, prescribed medications, and specific treatment procedures.
-   **Key Fields:** `diagnosis`, `prescription`, `treatment_name`, `cost`.

### 5. `Bills` Table
The financial ledger for patient visits.
-   **Purpose:** Aggregates the costs of treatments and doctor consultations.
-   **Key Fields:** `total_amount`, `discount`, `net_amount`, `status` (Paid, Unpaid, Partial).

### 6. `Payments` Table
Tracks money coming into the hospital.
-   **Purpose:** Records individual transactions made against a specific bill.
-   **Key Fields:** `amount_paid`, `payment_method`, `transaction_reference`.

---

## 🚀 How to Run and Test This Project

To get this database running on your local machine, follow these simple steps:

### Prerequisites
-   A SQL Database Engine installed (e.g., PostgreSQL, MySQL, SQL Server).
-   A Database Client/IDE (e.g., DBeaver, pgAdmin, MySQL Workbench).

### Step 1: Create the Schema
Run the **`01_schema.sql`** script to create the tables, primary keys, and foreign key constraints.

### Step 2: Populate with Sample Data
Execute the **`02_sample_data.sql`** script to insert realistic dummy data for testing.

### Step 3: Run Reports and Analytics
Execute the queries in **`03_reports_and_queries.sql`** to see the system in action and extract insights.

---

## 📊 Real-World Analytics Demonstrated

The `03_reports_and_queries.sql` file demonstrates how a hospital administrator would use this data to make informed decisions:

1.  **Doctor Workload Metrics:** Identifies which doctors are seeing the most patients and their completion rates.
2.  **Comprehensive Patient History:** Pulls every doctor seen, diagnosis received, and prescription given for a specific patient.
3.  **Accounts Receivable (Outstanding Bills):** Tracks which patients owe money and calculates total outstanding balances.
4.  **Appointment Scheduling Conflict Detection:** Ensures no doctor is double-booked for the same time slot.
5.  **Revenue by Department:** Analyzes financial performance across different hospital departments.
6.  **Appointment Status Breakdown:** Provides a 7-day snapshot of completed, scheduled, and cancelled appointments for dashboarding.

---

## 💡 Skills and Concepts Showcased

This project demonstrates mastery of several core database engineering concepts:

-   **Entity-Relationship (ER) Modeling:** Breaking down complex healthcare workflows into logical, related entities.
-   **Normalization (1NF, 2NF, 3NF):** Ensuring data efficiency and eliminating redundancy.
-   **Data Integrity & Constraints:** Implementing `PRIMARY KEY`, `FOREIGN KEY`, and `NOT NULL` constraints.
-   **Advanced SQL Querying:** Mastery of `JOIN`s, `GROUP BY`, `SUM/COUNT` aggregates, and `CASE WHEN` logic.

---

_Built to simulate a modern, enterprise healthcare data architecture._
