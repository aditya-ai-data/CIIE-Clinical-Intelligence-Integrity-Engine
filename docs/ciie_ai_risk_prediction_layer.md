# CIIE Level 8 — AI Risk Prediction Layer

## Purpose
The AI Risk Prediction Layer assigns risk scores and likely operational outcomes to detected clinical workflow failures.

## Why This Matters
Healthcare systems often identify workflow failures after they have already affected process quality or patient safety. This layer introduces early risk scoring to help prioritize high-risk workflow breakdowns.

## Table: ai_risk_scores

| Column | Purpose |
|---|---|
| risk_case_id | Unique risk case identifier |
| patient_id | Patient associated with detected workflow issue |
| detected_issue | Workflow issue detected by CIIE |
| risk_score | Numerical risk score from 0 to 100 |
| risk_level | Risk category such as Low, Medium, or High |
| predicted_outcome | Plain-English description of likely operational consequence |

## Example Risk Cases

| Patient ID | Detected Issue | Risk Score | Risk Level |
|---:|---|---:|---|
| 2 | Wrong Order | 92 | High |
| 3 | Missing Lab Test | 75 | Medium |

## Interpretation

Patient 2 has the highest risk because Medication occurred before Lab Test, creating a high-severity workflow sequencing issue.

Patient 3 has moderate risk because Medication was recorded without Lab Test, suggesting incomplete diagnostic validation.

## Business Value

This layer helps healthcare teams:

- prioritize urgent workflow failures
- distinguish high-risk issues from medium-risk issues
- support proactive operational intervention
- move from retrospective reporting toward predictive workflow intelligence

## Future Direction

Future versions may calculate risk scores dynamically using machine learning models trained on workflow history, timestamps, staff workload, department type, and patient acuity.
