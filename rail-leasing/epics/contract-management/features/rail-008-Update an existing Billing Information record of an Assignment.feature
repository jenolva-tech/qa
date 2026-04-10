Feature: Update an Existing Billing Information Record of an Assignment
  As a Contract Specialist
  I want to update the billing information details of an Assignment
  So that the system can store accurate and updated Start, Stop, Rent, Maintenance, and Notes information for billing and contract management

  ## Key
  # TS-108-001 — Update Billing Record (Positive)
  # TS-108-002 — Negative: Invalid Billing Update

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

  @UpdateRow
  Scenario Outline: Update a row on the Billing table and save
    When the user clicks the row number <row>
    And the user updates the row fields:
      | Start | Stop | Rent | Maintenance | Notes |
      with values <values>
    And the user clicks the Save button
    Then the billing record is saved and displayed with the updated values

    Examples:
      | searchValue | assignmentField | assignment | assignmentValue | row | values                                                                 |
      | A12345      | Assignment      | A12345     | A12345          | 1   | Start=01/01/2024; Stop=01/31/2024; Rent=1300; Maintenance=250; Notes=Updated billing |
      | A54321      | Assignment      | A54321     | A54321          | 2   | Start=02/01/2024; Stop=02/28/2024; Rent=950; Maintenance=150; Notes=Corrected entry |

  @Negative
  Scenario Outline: Attempt to update a Billing record with invalid data
    When the user clicks the row number <row>
    And the user updates the row fields:
      | Start | Stop | Rent | Maintenance | Notes |
      with values <values>
    And the user clicks the Save button
    Then a validation message <message> is displayed
    And the billing record is not saved

    Examples:
      | row | values                                                                 | message                                      |
      | 1   | Start=INVALID; Stop=01/31/2024; Rent=1200; Maintenance=200; Notes=N/A  | "Invalid Start date format"                  |
      | 1   | Start=01/01/2024; Stop=INVALID; Rent=1200; Maintenance=200; Notes=N/A  | "Invalid Stop date format"                   |
      | 2   | Start=01/01/2024; Stop=01/31/2024; Rent=-100; Maintenance=200; Notes=N/A | "Rent must be a positive number"           |
      | 2   | Start=01/01/2024; Stop=01/31/2024; Rent=1200; Maintenance=-50; Notes=N/A | "Maintenance must be a positive number"    |
      | 3   | Start=01/01/2024; Stop=01/31/2024; Rent=1200; Maintenance=200; Notes= | "Notes cannot be empty"                      |
