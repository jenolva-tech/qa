📌 Purpose of This Workbook
This workbook consolidates all QA test assets for the Contract Profile module within the Contract Management system.
It provides a single, structured location for:

Test cases

Execution tracking

Requirement‑to‑test traceability

Defect logging

The workbook is designed to mirror real enterprise QA documentation standards and supports both manual testing and BDD‑driven workflows.

📘 Workbook Contents
The workbook contains four sheets, each representing a core QA artifact.

1. Test Suite
This sheet contains the full set of test cases for the Contract Profile features, including:

RAIL‑101 — View Contracts Search and Results

RAIL‑102 — Search Contract Profile Record(s)



What’s included:

Test Case ID

Scenario Tag (from Gherkin .feature files)

Test Case Name

Objective

Preconditions

Test Data

Step‑by‑step execution steps

Expected Results

Purpose:  
To define what is being tested and how the system should behave.

2. Test Execution
This sheet tracks the execution progress of each test case.

What’s included:

Tester

Execution Date

Status (Passed, Failed, Blocked, In Progress, Not Executed)

Comments / Defects

Purpose:  
To provide visibility into testing progress and overall feature quality.

3. Traceability Matrix
This sheet links requirements → scenarios → test cases → execution status.

What’s included:

Feature ID

Feature Name

Scenario Tag

Scenario Name

Test Case ID

Execution Status

Purpose:  
To demonstrate complete requirement coverage and ensure no scenario is left untested.

4. Defect Log
This sheet captures defects identified during test execution.

What’s included:

Defect ID

Scenario Tag

Test Case ID

Summary

Steps to Reproduce

Expected vs. Actual Result

Severity / Priority

Status

Assigned To

Purpose:  
To document issues, support defect lifecycle management, and maintain traceability back to the originating test case.
