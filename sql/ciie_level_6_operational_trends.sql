-- CIIE Level 6: Operational Trend Analysis
-- Purpose: Analyze workflow failure distribution and severity distribution

USE join_practice;

-- Failure type distribution
SELECT 
    CASE 
        WHEN lab.step_sequence IS NULL THEN 'Missing Lab Test'
        WHEN med.step_sequence < lab.step_sequence THEN 'Wrong Order'
        ELSE 'No Issue'
    END AS failure_type,

    COUNT(*) AS total_cases

FROM patients p

JOIN workflow_steps med
ON p.patient_id = med.patient_id
AND med.step_name = 'Medication'

LEFT JOIN workflow_steps lab
ON p.patient_id = lab.patient_id
AND lab.step_name = 'Lab Test'

GROUP BY failure_type;

-- Severity distribution
SELECT 
    CASE 
        WHEN lab.step_sequence IS NULL THEN 'Medium'
        WHEN med.step_sequence < lab.step_sequence THEN 'High'
        ELSE 'Low'
    END AS severity,

    COUNT(*) AS total_cases

FROM patients p

JOIN workflow_steps med
ON p.patient_id = med.patient_id
AND med.step_name = 'Medication'

LEFT JOIN workflow_steps lab
ON p.patient_id = lab.patient_id
AND lab.step_name = 'Lab Test'

GROUP BY severity;
