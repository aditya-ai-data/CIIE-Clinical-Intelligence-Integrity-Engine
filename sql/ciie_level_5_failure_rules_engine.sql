-- CIIE Level 5: Failure Rules Engine
-- Purpose: Store workflow failure types, severity levels, and explanations centrally

USE join_practice;

DROP TABLE IF EXISTS failure_rules;

CREATE TABLE failure_rules (
    rule_id INT,
    failure_type VARCHAR(100),
    severity VARCHAR(50),
    description VARCHAR(255)
);

INSERT INTO failure_rules VALUES
(1, 'Missing Lab Test', 'Medium', 'Patient received Medication without Lab Test'),
(2, 'Wrong Order', 'High', 'Medication occurred before Lab Test'),
(3, 'No Issue', 'Low', 'Workflow followed correct order');

SELECT * FROM failure_rules;
