CREATE DATABASE HealthcarePatientFlowDB;
GO

USE HealthcarePatientFlowDB;
GO

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    encrypted_ssn VARBINARY(255)
);
GO

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    patient_id INT,
    admission_time DATETIME,
    discharge_time DATETIME,
    visit_type VARCHAR(50),
    department VARCHAR(50),
    wait_time_minutes INT,
    length_of_stay_hours DECIMAL(5,1),
    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id)
);
GO

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    department VARCHAR(50)
);
GO

CREATE TABLE Resources (
    resource_id INT PRIMARY KEY,
    resource_name VARCHAR(100),
    resource_type VARCHAR(50),
    status VARCHAR(20),
    utilization_rate DECIMAL(5,1)
);
GO

CREATE TABLE Visit_Staff (
    visit_id INT,
    staff_id INT,
    assignment_role VARCHAR(50),
    assigned_time DATETIME,
    PRIMARY KEY (visit_id, staff_id),
    FOREIGN KEY (visit_id)
        REFERENCES Visits(visit_id),
    FOREIGN KEY (staff_id)
        REFERENCES Staff(staff_id)
);
GO

CREATE TABLE Visit_Resources (
    visit_id INT,
    resource_id INT,
    allocated_time DATETIME,
    released_time DATETIME,
    PRIMARY KEY (visit_id, resource_id),
    FOREIGN KEY (visit_id)
        REFERENCES Visits(visit_id),
    FOREIGN KEY (resource_id)
        REFERENCES Resources(resource_id)
);
GO
