-- CIIE Level 1 to 3 SQL Logic
-- Clinical Intelligence Integrity Engine
-- Goal: Detect missing and incorrectly ordered healthcare workflow steps

USE join_practice;

-- Clear old tables
DROP TABLE IF EXISTS workflow_steps;
DROP TABLE IF EXISTS patients;

-- Create patients table
CREATE TABLE patients (
    patient_id INT,
    patient_name VARCHAR(50)
);

-- Create workflow steps table
CREATE TABLE workflow_steps (
    step_id INT,
    patient_id INT,
    step_name VARCHAR(50),
    step_sequence INT
);

-- Insert patient data
INSERT INTO patients VALUES
(1, 'John'),
(2, 'Alice'),
(3, 'Bob');

-- Insert healthcare workflow data
INSERT INTO workflow_steps VALUES
(101, 1, 'Admission', 1),
(102, 1, 'Lab Test', 2),
(103, 1, 'Medication', 3),

(104, 2, 'Admission', 1),
(105, 2, 'Medication', 2),
(106, 2, 'Lab Test', 3),

(107, 3, 'Admission', 1),
(108, 3, 'Medication', 2);

-- Check patients table
SELECT * FROM patients;

-- Check workflow steps table
SELECT * FROM workflow_steps;

-- Level 1: Detect patients missing Lab Test
SELECT 
    p.patient_id,
    p.patient_name
FROM patients p
LEFT JOIN workflow_steps w
ON p.patient_id = w.patient_id
AND w.step_name = 'Lab Test'
WHERE w.step_name IS NULL;

-- Level 2: Detect Medication before Lab Test OR missing Lab Test
SELECT 
    p.patient_id,
    p.patient_name,
    lab.step_sequence AS lab_sequence,
    med.step_sequence AS medication_sequence
FROM patients p
JOIN workflow_steps med
ON p.patient_id = med.patient_id
AND med.step_name = 'Medication'
LEFT JOIN workflow_steps lab
ON p.patient_id = lab.patient_id
AND lab.step_name = 'Lab Test'
WHERE lab.step_sequence IS NULL
   OR med.step_sequence < lab.step_sequence;

-- Level 3: Classify failure type and severity
SELECT 
    p.patient_id,
    p.patient_name,

    CASE 
        WHEN lab.step_sequence IS NULL THEN 'Missing Lab Test'
        WHEN med.step_sequence < lab.step_sequence THEN 'Wrong Order'
        ELSE 'No Issue'
    END AS failure_type,

    CASE 
        WHEN lab.step_sequence IS NULL THEN 'Medium'
        WHEN med.step_sequence < lab.step_sequence THEN 'High'
        ELSE 'Low'
    END AS severity

FROM patients p
JOIN workflow_steps med
ON p.patient_id = med.patient_id
AND med.step_name = 'Medication'
LEFT JOIN workflow_steps lab
ON p.patient_id = lab.patient_id
AND lab.step_name = 'Lab Test';
