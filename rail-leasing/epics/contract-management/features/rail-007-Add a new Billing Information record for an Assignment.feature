Feature: Add a New Billing Information Record for an Assignment
  As a Contract Specialist
  I want to enter the billing information for an Assignment
  So that the system can store accurate Start, Stop, Rent, Maintenance, and Notes details for billing and contract management

  ## Key
  # TS-107-001 — Add New Empty Billing Row (Positive)
  # TS-107-002 — Add and Save Billing Record (Positive)
  # TS-107-003 — Negative: Invalid Billing Data

  Background:
    Given the user navigates to the Contract Profile URL
    And the user enters the value <searchValue> into the search criteria field <assignmentField>
    And the user clicks the Search button
    Then 1 row is displayed on the Assignment results table
    When the user clicks the assignment <assignment> in the Assignment column
    Then the Contract Profile Details tab is displayed
    And the expected value <assignmentValue> for the field <assignmentField> is displayed
    When the user clicks the Billing tab
    Then the header "Billing" is displayed
    And a table is displayed with columns:
      | Start | Stop | Rent | Maintenance | Notes |

  @AddNewEmptyRow
  Scenario Outline: Add a new empty row in the Billing table
    When the user clicks the Add icon
    Then 1 row is inserted with empty columns

    Examples:
      | searchValue | assignmentField | assignment | assignmentValue |
      | A12345      | Assignment      | A12345     | A12345          |

  @AddNewRow
  Scenario Outline: Add a new Billing record and save
    When the user clicks the Add icon
    Then 1 row is inserted with empty columns
    When the user updates the fields:
      | Start | Stop | Rent | Maintenance | Notes |
      with values <values>
    And the user clicks the Save icon
    Then the Billing record is saved and displayed with the updated values

    Examples:
      | searchValue | assignmentField | assignment | assignmentValue | values                                                                 |
      | A12345      | Assignment      | A12345     | A12345          | Start=01/01/2024; Stop=01/31/2024; Rent=1200; Maintenance=200; Notes=N/A |
      | A54321      | Assignment      | A54321     | A54321          | Start=02/01/2024; Stop=02/28/2024; Rent=900; Maintenance=150; Notes=None |

  @Negative
  Scenario Outline: Attempt to add a Billing record with invalid data
    When the user clicks the Add icon
    Then 1 row is inserted with empty columns
    When the user updates the fields:
      | Start | Stop | Rent | Maintenance | Notes |
      with values <values>
    And the user clicks the Save icon
    Then a validation message <message> is displayed
    And the Billing record is not saved

    Examples:
      | values                                                                 | message                                      |
      | Start=INVALID; Stop=01/31/2024; Rent=1200; Maintenance=200; Notes=N/A  | "Invalid Start date format"                  |
      | Start=01/01/2024; Stop=INVALID; Rent=1200; Maintenance=200; Notes=N/A  | "Invalid Stop date format"                   |
      | Start=01/01/2024; Stop=01/31/2024; Rent=-100; Maintenance=200; Notes=N/A | "Rent must be a positive number"           |
      | Start=01/01/2024; Stop=01/31/2024; Rent=1200; Maintenance=-50; Notes=N/A | "Maintenance must be a positive number"    |
      | Start=01/01/2024; Stop=01/31/2024; Rent=1200; Maintenance=200; Notes= | "Notes cannot be empty"                      |
