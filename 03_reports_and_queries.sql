-- 03_reports_and_queries.sql
-- Complex Reporting Queries for Hospital Management System

-- 1. Doctor Workload & Performance Report
-- Calculates the number of appointments per doctor, their completed vs scheduled ratio, and total patients seen.
SELECT
    d.doctor_id,
    d.first_name || ' ' || d.last_name AS doctor_name,
    d.department,
    COUNT(a.appointment_id) AS total_appointments,
    SUM(
        CASE
            WHEN a.status = 'Completed' THEN 1
            ELSE 0
        END
    ) AS completed_appointments,
    SUM(
        CASE
            WHEN a.status = 'Scheduled' THEN 1
            ELSE 0
        END
    ) AS scheduled_appointments
FROM Doctors d
    LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY
    d.doctor_id,
    d.first_name,
    d.last_name,
    d.department
ORDER BY total_appointments DESC;

-- 2. Patient Comprehensive History
-- Retrieves a full view of a patient's treatment history, including doctors seen and medications prescribed.
SELECT
    p.patient_id,
    p.first_name || ' ' || p.last_name AS patient_name,
    t.treatment_date,
    d.first_name || ' ' || d.last_name AS attending_doctor,
    t.treatment_name,
    t.diagnosis,
    t.prescription
FROM
    Treatments t
    JOIN Patients p ON t.patient_id = p.patient_id
    JOIN Doctors d ON t.doctor_id = d.doctor_id
WHERE
    p.patient_id = 1 -- Replace with specific patient ID to search
ORDER BY t.treatment_date DESC;

-- 3. Outstanding Bills / Accounts Receivable
-- Identifies all unpaid or partially paid bills to facilitate hospital revenue collection.
SELECT
    b.bill_id,
    p.first_name || ' ' || p.last_name AS patient_name,
    p.contact_number,
    b.billing_date,
    b.net_amount AS total_due,
    COALESCE(SUM(pay.amount_paid), 0) AS amount_paid,
    (
        b.net_amount - COALESCE(SUM(pay.amount_paid), 0)
    ) AS outstanding_balance
FROM
    Bills b
    JOIN Patients p ON b.patient_id = p.patient_id
    LEFT JOIN Payments pay ON b.bill_id = pay.bill_id
WHERE
    b.status != 'Paid'
GROUP BY
    b.bill_id,
    p.first_name,
    p.last_name,
    p.contact_number,
    b.billing_date,
    b.net_amount
HAVING (
        b.net_amount - COALESCE(SUM(pay.amount_paid), 0)
    ) > 0
ORDER BY b.billing_date ASC;

-- 4. Appointment Scheduling Conflict Check
-- Identifies any double-booked or overlapping appointments for a doctor (Constraint Check query)
SELECT a1.appointment_id, d.first_name || ' ' || d.last_name AS doctor_name, a1.appointment_date, a1.appointment_time
FROM
    Appointments a1
    JOIN Appointments a2 ON a1.doctor_id = a2.doctor_id
    AND a1.appointment_date = a2.appointment_date
    AND a1.appointment_id != a2.appointment_id
    AND a1.appointment_time = a2.appointment_time
    JOIN Doctors d ON a1.doctor_id = d.doctor_id
WHERE
    a1.status = 'Scheduled';

-- 5. Revenue Generation by Department
-- Financial report aggregating paid revenue organized by hospital department.
SELECT d.department, SUM(b.net_amount) AS total_revenue
FROM
    Bills b
    JOIN Appointments a ON b.appointment_id = a.appointment_id
    JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE
    b.status = 'Paid'
GROUP BY
    d.department
ORDER BY total_revenue DESC;

-- 6. Appointment Status Breakdown (Dashboard Statistic)
-- Good for UI dashboards showing today's operation status
SELECT
    appointment_date,
    SUM(
        CASE
            WHEN status = 'Completed' THEN 1
            ELSE 0
        END
    ) AS completed,
    SUM(
        CASE
            WHEN status = 'Scheduled' THEN 1
            ELSE 0
        END
    ) AS scheduled,
    SUM(
        CASE
            WHEN status = 'Cancelled' THEN 1
            ELSE 0
        END
    ) AS cancelled
FROM Appointments
GROUP BY
    appointment_date
ORDER BY appointment_date DESC
LIMIT 7;