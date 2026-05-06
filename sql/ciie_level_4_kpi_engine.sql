-- CIIE Level 4: KPI Engine
-- Purpose: Generate system-level workflow integrity KPIs

USE join_practice;

SELECT 
    COUNT(DISTINCT p.patient_id) AS total_patients,

    SUM(
        CASE
            WHEN lab.step_sequence IS NULL
              OR med.step_sequence < lab.step_sequence
            THEN 1
            ELSE 0
        END
    ) AS total_failures,

    SUM(
        CASE
            WHEN med.step_sequence < lab.step_sequence
            THEN 1
            ELSE 0
        END
    ) AS high_severity_failures,

    ROUND(
        (
            SUM(
                CASE
                    WHEN lab.step_sequence IS NULL
                      OR med.step_sequence < lab.step_sequence
                    THEN 1
                    ELSE 0
                END
            ) * 100.0
        ) / COUNT(DISTINCT p.patient_id),
        2
    ) AS failure_rate_percentage

FROM patients p

JOIN workflow_steps med
ON p.patient_id = med.patient_id
AND med.step_name = 'Medication'

LEFT JOIN workflow_steps lab
ON p.patient_id = lab.patient_id
AND lab.step_name = 'Lab Test';
