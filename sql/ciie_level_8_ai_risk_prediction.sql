-- CIIE Level 8: AI Risk Prediction Layer
-- Purpose: Store predicted workflow risk scores and likely operational outcomes

USE join_practice;

DROP TABLE IF EXISTS ai_risk_scores;

CREATE TABLE ai_risk_scores (
    risk_case_id INT,
    patient_id INT,
    detected_issue VARCHAR(100),
    risk_score INT,
    risk_level VARCHAR(50),
    predicted_outcome TEXT
);

INSERT INTO ai_risk_scores VALUES
(1, 2, 'Wrong Order', 92, 'High',
'High probability of workflow escalation due to Medication occurring before diagnostic validation.'),

(2, 3, 'Missing Lab Test', 75, 'Medium',
'Moderate probability of incomplete treatment verification caused by missing Lab Test.');

SELECT 
    patient_id,
    detected_issue,
    risk_score,
    risk_level,
    predicted_outcome
FROM ai_risk_scores;
