-- 01_schema.sql
-- Hospital Management System Schema (PostgreSQL/Standard SQL compatible)

-- Patients Table
CREATE TABLE Patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10),
    blood_group VARCHAR(5),
    contact_number VARCHAR(20),
    email VARCHAR(100),
    address TEXT,
    emergency_contact_name VARCHAR(100),
    emergency_contact_number VARCHAR(20),
    insurance_provider VARCHAR(100),
    insurance_policy_number VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Doctors Table
CREATE TABLE Doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    contact_number VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    consultation_fee DECIMAL(10, 2) NOT NULL,
    joining_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Appointments Table
CREATE TABLE Appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Scheduled', -- Scheduled, Completed, Cancelled, No Show
    reason_for_visit TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES Patients (patient_id) ON DELETE CASCADE,
    CONSTRAINT fk_doctor FOREIGN KEY (doctor_id) REFERENCES Doctors (doctor_id) ON DELETE CASCADE
);

-- Treatments Table
CREATE TABLE Treatments (
    treatment_id SERIAL PRIMARY KEY,
    appointment_id INT NOT NULL,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    treatment_name VARCHAR(150) NOT NULL,
    diagnosis TEXT,
    prescription TEXT,
    treatment_date DATE NOT NULL,
    cost DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_t_appointment FOREIGN KEY (appointment_id) REFERENCES Appointments (appointment_id),
    CONSTRAINT fk_t_patient FOREIGN KEY (patient_id) REFERENCES Patients (patient_id),
    CONSTRAINT fk_t_doctor FOREIGN KEY (doctor_id) REFERENCES Doctors (doctor_id)
);

-- Bills Table
CREATE TABLE Bills (
    bill_id SERIAL PRIMARY KEY,
    patient_id INT NOT NULL,
    appointment_id INT,
    total_amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    discount DECIMAL(10, 2) DEFAULT 0.00,
    net_amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    billing_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) DEFAULT 'Unpaid', -- Unpaid, Partial, Paid
    CONSTRAINT fk_b_patient FOREIGN KEY (patient_id) REFERENCES Patients (patient_id),
    CONSTRAINT fk_b_appointment FOREIGN KEY (appointment_id) REFERENCES Appointments (appointment_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    bill_id INT NOT NULL,
    patient_id INT NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50), -- Cash, Credit Card, Insurance, Bank Transfer
    transaction_reference VARCHAR(100),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_p_bill FOREIGN KEY (bill_id) REFERENCES Bills (bill_id),
    CONSTRAINT fk_p_patient FOREIGN KEY (patient_id) REFERENCES Patients (patient_id)
);