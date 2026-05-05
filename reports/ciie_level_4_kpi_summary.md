# CIIE Level 4 — KPI Summary Report

## Purpose
This report summarizes system-level workflow integrity metrics from the Clinical Intelligence Integrity Engine (CIIE).

## Workflow Rule
Expected workflow:

Admission → Lab Test → Medication

## KPIs Generated

| KPI | Result | Meaning |
|---|---:|---|
| Total Patients Analyzed | 3 | Number of patient workflows reviewed |
| Total Workflow Failures | 2 | Patients with missing or incorrect workflow steps |
| High-Severity Failures | 1 | Patients where Medication happened before Lab Test |
| Failure Rate | 66.67% | Percentage of workflows with integrity issues |

## Interpretation

CIIE detected workflow issues in 2 out of 3 patient journeys.

- John followed the correct workflow.
- Alice had a high-severity failure because Medication occurred before Lab Test.
- Bob had a medium-severity failure because Lab Test was missing.

## Business Value

These KPIs help healthcare teams monitor clinical workflow integrity, identify unsafe process patterns, and prioritize operational improvements before breakdowns affect patient safety or care quality.

## Next Step

CIIE Level 5 will expand the system by adding additional workflow failure types and a structured failure rules engine.
