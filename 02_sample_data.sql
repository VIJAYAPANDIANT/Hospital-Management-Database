-- 02_sample_data.sql
-- Insert realistic sample data for Hospital Management System Schema

-- Patients
INSERT INTO
    Patients (
        first_name,
        last_name,
        date_of_birth,
        gender,
        blood_group,
        contact_number,
        email,
        address,
        insurance_provider
    )
VALUES (
        'John',
        'Doe',
        '1985-04-12',
        'Male',
        'O+',
        '555-0101',
        'john.doe@example.com',
        '123 Elm St, Springfield',
        'BlueCross'
    ),
    (
        'Jane',
        'Smith',
        '1990-08-22',
        'Female',
        'A-',
        '555-0102',
        'jane.smith@example.com',
        '456 Oak St, Springfield',
        'Aetna'
    ),
    (
        'Michael',
        'Johnson',
        '1975-11-05',
        'Male',
        'B+',
        '555-0103',
        'mjohnson@example.com',
        '789 Pine St, Springfield',
        'Cigna'
    ),
    (
        'Emily',
        'Davis',
        '2005-02-14',
        'Female',
        'AB+',
        '555-0104',
        'emily.d@example.com',
        '321 Maple St, Springfield',
        NULL
    ),
    (
        'Robert',
        'Miller',
        '1960-07-30',
        'Male',
        'O-',
        '555-0105',
        'rmiller60@example.com',
        '654 Cedar St, Springfield',
        'Medicare'
    );

-- Doctors
INSERT INTO
    Doctors (
        first_name,
        last_name,
        specialization,
        department,
        contact_number,
        email,
        consultation_fee,
        joining_date
    )
VALUES (
        'Gregory',
        'House',
        'Diagnostic Medicine',
        'Diagnostics',
        '555-0201',
        'house@hospital.com',
        250.00,
        '2015-01-10'
    ),
    (
        'Allison',
        'Cameron',
        'Immunology',
        'Immunology',
        '555-0202',
        'cameron@hospital.com',
        180.00,
        '2016-03-15'
    ),
    (
        'Robert',
        'Chase',
        'Surgery',
        'Surgery',
        '555-0203',
        'chase@hospital.com',
        300.00,
        '2016-04-20'
    ),
    (
        'James',
        'Wilson',
        'Oncology',
        'Oncology',
        '555-0204',
        'wilson@hospital.com',
        220.00,
        '2014-11-01'
    );

-- Appointments
INSERT INTO
    Appointments (
        patient_id,
        doctor_id,
        appointment_date,
        appointment_time,
        status,
        reason_for_visit
    )
VALUES (
        1,
        1,
        '2023-10-15',
        '09:00:00',
        'Completed',
        'Severe headache and dizziness'
    ),
    (
        2,
        2,
        '2023-10-16',
        '10:30:00',
        'Completed',
        'Allergic reaction'
    ),
    (
        3,
        3,
        '2023-10-18',
        '14:00:00',
        'Scheduled',
        'Appendicitis consultation'
    ),
    (
        4,
        4,
        CURRENT_DATE,
        '11:00:00',
        'Scheduled',
        'Routine oncology checkup'
    ),
    (
        5,
        1,
        '2024-03-08',
        '15:00:00',
        'Scheduled',
        'Unexplained fatigue'
    ),
    (
        1,
        2,
        '2024-03-10',
        '09:30:00',
        'Scheduled',
        'Follow-up on allergy panels'
    ),
    (
        2,
        3,
        '2024-03-12',
        '11:00:00',
        'Scheduled',
        'Surgical consult for minor removal'
    );

-- Treatments
INSERT INTO
    Treatments (
        appointment_id,
        patient_id,
        doctor_id,
        treatment_name,
        diagnosis,
        prescription,
        treatment_date,
        cost
    )
VALUES (
        1,
        1,
        1,
        'MRI Scan & Blood Work',
        'Migraine with aura',
        'Sumatriptan 50mg',
        '2023-10-15',
        1200.00
    ),
    (
        2,
        2,
        2,
        'Antihistamine Therapy',
        'Severe Peanut Allergy',
        'EpiPen Auto-Injector, Cetirizine 10mg',
        '2023-10-16',
        450.00
    );

-- Bills
INSERT INTO
    Bills (
        patient_id,
        appointment_id,
        total_amount,
        discount,
        net_amount,
        billing_date,
        status
    )
VALUES (
        1,
        1,
        1450.00,
        50.00,
        1400.00,
        '2023-10-15',
        'Paid'
    ),
    (
        2,
        2,
        630.00,
        0.00,
        630.00,
        '2023-10-16',
        'Unpaid'
    ),
    (
        3,
        3,
        300.00,
        0.00,
        300.00,
        CURRENT_DATE,
        'Unpaid'
    ),
    (
        4,
        4,
        220.00,
        20.00,
        200.00,
        CURRENT_DATE,
        'Paid'
    );

-- Payments
INSERT INTO
    Payments (
        bill_id,
        patient_id,
        amount_paid,
        payment_method,
        transaction_reference
    )
VALUES (
        1,
        1,
        1400.00,
        'Insurance',
        'TXN_INS_9928374'
    ),
    (
        4,
        4,
        200.00,
        'Credit Card',
        'TXN_CC_8829311'
    );