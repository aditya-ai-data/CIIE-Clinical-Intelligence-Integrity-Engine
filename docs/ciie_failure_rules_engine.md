# CIIE Level 5 — Failure Rules Engine

## Purpose
The Failure Rules Engine stores workflow failure types, severity levels, and business explanations in a centralized rules table.

## Why This Matters
Instead of hardcoding all failure logic inside SQL queries, CIIE stores rule definitions separately so the system becomes easier to maintain, expand, and explain.

## Table: failure_rules

| Column | Purpose |
|---|---|
| rule_id | Unique identifier for each rule |
| failure_type | Type of detected workflow issue |
| severity | Business risk level |
| description | Plain-English explanation of the failure |

## Rules Added

| rule_id | failure_type | severity | description |
|---:|---|---|---|
| 1 | Missing Lab Test | Medium | Patient received Medication without Lab Test |
| 2 | Wrong Order | High | Medication occurred before Lab Test |
| 3 | No Issue | Low | Workflow followed correct order |

## Business Value
Centralizing failure rules allows healthcare teams to standardize risk classification, improve auditability, and update workflow logic without redesigning the entire system.

## Next Step
CIIE Level 6 will connect detected workflow failures to the rules engine and generate richer operational intelligence.
