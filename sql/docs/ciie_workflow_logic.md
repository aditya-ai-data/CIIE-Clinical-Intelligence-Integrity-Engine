# CIIE Workflow Logic — Level 1 to 3

## Project Name
Clinical Intelligence Integrity Engine (CIIE)

## Purpose
CIIE is designed to detect hidden workflow breakdowns in healthcare processes before they affect patient safety, operational quality, or clinical workflow integrity.

## Business Problem
Healthcare workflows can fail when required clinical steps are missing or performed in the wrong order.

Examples:
- Lab Test missing before Medication
- Medication given before Lab Test
- Required patient workflow steps skipped

These breakdowns can create patient safety risks, reporting issues, and operational inefficiencies.

## Workflow Rule
A safe basic workflow should follow:

Admission → Lab Test → Medication

## Data Tables

### patients
Stores patient-level information.

Columns:
- patient_id
- patient_name

### workflow_steps
Stores steps completed for each patient.

Columns:
- step_id
- patient_id
- step_name
- step_sequence

## Failures Detected

### 1. Missing Lab Test
A patient received Medication but does not have a Lab Test step.

Severity:
Medium

### 2. Wrong Order
Medication happened before Lab Test.

Severity:
High

### 3. No Issue
Workflow followed the correct sequence.

Severity:
Low

## SQL Logic Used

### LEFT JOIN + NULL Detection
Used to find missing workflow steps.

### JOIN with Sequence Comparison
Used to compare whether Medication happened before Lab Test.

### CASE Statements
Used to classify failure type and severity.

## Business Value
This logic helps identify hidden healthcare workflow failures that could affect patient safety, process quality, and clinical decision-making.

## Current Output

Expected results:

John:
- No Issue
- Low severity

Alice:
- Wrong Order
- High severity

Bob:
- Missing Lab Test
- Medium severity

## Next Step
CIIE Level 4 will calculate system-level KPIs such as:
- total patients analyzed
- total failures detected
- failure rate
- high-severity failure count
