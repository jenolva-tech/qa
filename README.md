# Quality Assurance Artifacts

This section of the **jenolva-tech-lab** portfolio showcases my Quality Assurance work, emphasizing test design, defect analysis, and alignment with business and technical requirements. These artifacts demonstrate how I ensure quality across the SDLC through structured testing and clear communication and the strategic use of AI to accelerate delivery.

---

## 📌 What’s Included

### 1. Test Plan
Documents outlining:
- Scope and objectives
- Test levels and types
- Tools and environments
- Entry/exit criteria

### 2. Features
Well-structured test documentation including:
- Positive and negative scenarios
- Preconditions and test data
- Coverage aligned with user story acceptance criteria

### 3. Test Workbook

#### A. Test Suite
- Full set of test cases covering positive, negative, and edge case scenarios
- Includes test case ID, objective, preconditions, test data, steps, and expected results

#### B. Test Execution
- Tracks tester, execution date, and status (Passed, Failed, Blocked, In Progress, Not Executed)
- Includes comments and linked defects

#### C. Traceability Matrix
- Links requirements → scenarios → test cases → execution status
- Demonstrates full coverage with no untested scenarios

#### D. Defect Log
- Captures defect ID, summary, steps to reproduce, expected vs actual result
- Includes severity, priority, status, and traceability back to the originating test case


---

## 📁 Folder Structure

```text
qa/
├── README.md
└── rail-leasing/
    └── epics/
        └── contract-management/
            ├── contract-management-test-plan.md
            ├── rail-004-View a Contract Profile Record.feature
            ├── features/
            │   ├── rail-001-View Contract Profile Search and Results.feature
            │   ├── rail-002-Search Contract Profile Record(s).feature
            │   ├── rail-003-Add a new Contract Profile Record.feature
            │   ├── rail-004-View a Contract Profile Record.feature
            │   ├── rail-005-Update an existing Contract Profile Record (Details Page).feature
            │   ├── rail-006-View the Billing Information of an Assignment.feature
            │   ├── rail-007-Add a new Billing Information record for an Assignment.feature
            │   └── rail-008-Update an existing Billing Information record of an Assignment.feature
            └── test-workbook/
                ├── Contract Management Test Workbook.xlsx
                └── README.MD
```
