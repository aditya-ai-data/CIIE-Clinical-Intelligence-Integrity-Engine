-- CIIE Level 7: Explainable Intelligence Layer
-- Purpose: Store plain-English explanations and recommended actions for detected workflow failures

USE join_practice;

DROP TABLE IF EXISTS ai_explanation_cases;

CREATE TABLE ai_explanation_cases (
    case_id INT,
    patient_id INT,
    failure_type VARCHAR(100),
    severity VARCHAR(50),
    ai_explanation TEXT,
    recommended_action TEXT
);

INSERT INTO ai_explanation_cases VALUES
(1, 2, 'Wrong Order', 'High',
'Medication occurred before Lab Test. This indicates a workflow sequencing failure where treatment was initiated before required diagnostic validation.',
'Add a mandatory Lab Test verification checkpoint before Medication can be recorded.'),

(2, 3, 'Missing Lab Test', 'Medium',
'Medication was recorded without a corresponding Lab Test. This suggests incomplete workflow documentation or a skipped diagnostic step.',
'Trigger a missing-step alert when Medication exists without Lab Test.');

SELECT 
    case_id,
    patient_id,
    failure_type,
    severity,
    ai_explanation,
    recommended_action
FROM ai_explanation_cases;
