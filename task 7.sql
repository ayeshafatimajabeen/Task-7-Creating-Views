-- Task 7: Creating Views
USE HospitalDB;

-- View of all female patients
CREATE VIEW femalepatients AS 
SELECT patient_id,name,date_of_birth,phone
FROM Patients
WHERE gender='female';

-- View: Patient + Assigned Doctor
CREATE VIEW PatientDoctorView AS
SELECT 
    p.patient_id,
    p.name AS PatientName,
    d.name AS DoctorName,
    d.specialization
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;
SELECT * FROM PatientDoctorView;

-- View: Full Appointment Info
CREATE VIEW AppointmentDetails AS
SELECT 
    a.appointment_id,
    p.name AS PatientName,
    d.name AS DoctorName,
    a.appointment_date,
    a.reason
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;
SELECT * FROM AppointmentDetails;

--  View: Billing Summary
CREATE VIEW BillingSummary AS
SELECT 
    b.bill_id,
    p.name AS PatientName,
    b.room_charge,
    b.consultation_fee,
    b.medicine_charge,
    b.total_amount,
    b.billing_date
FROM Billing b
JOIN Patients p ON b.patient_id = p.patient_id;
SELECT * FROM BillingSummary WHERE total_amount > 1000;

-- View: Patients in ICU or Private Rooms
CREATE VIEW CriticalCarePatients AS
SELECT 
    pr.patient_id,
    p.name AS PatientName,
    r.room_number,
    r.room_type,
    pr.admission_date
FROM Patient_Rooms pr
JOIN Rooms r ON pr.room_id = r.room_id
JOIN Patients p ON pr.patient_id = p.patient_id
WHERE r.room_type IN ('ICU', 'Private') AND r.status = 'Occupied';
SELECT * FROM CriticalCarePatients;

-- View: Nurse Assignment Log
CREATE VIEW NurseAssignmentsView AS
SELECT 
    na.assignment_id,
    n.name AS NurseName,
    p.name AS PatientName,
    na.shift,
    na.date
FROM Nurse_Assignments na
JOIN Nurses n ON na.nurse_id = n.nurse_id
JOIN Patients p ON na.patient_id = p.patient_id;
SELECT * FROM NurseAssignmentsView WHERE shift = 'Morning';

-- View: Patient Medical Summary
CREATE VIEW MedicalSummary AS
SELECT 
    p.name AS PatientName,
    mr.diagnosis,
    mr.treatment,
    pr.medication,
    pr.dosage
FROM MedicalRecords mr
JOIN Appointments a ON mr.appointment_id = a.appointment_id
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Prescriptions pr ON a.appointment_id = pr.appointment_id;
SELECT * FROM MedicalSummary WHERE diagnosis LIKE '%infection%';

SHOW FULL TABLES IN HospitalDB WHERE TABLE_TYPE LIKE 'VIEW';

