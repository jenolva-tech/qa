Feature: Create New Contract Profile Record
  As a Contract Specialist
  I want to create a new Contract Profile record
  So that contract information is saved in the system

  ## Key
  # TS-102-001 — View New Contract Profile Form
  # TS-102-002 — Add New Contract Profile Record
  # TS-102-003 — Negative: Invalid or Missing Field Values

  Background:
    Given the user navigates to the Contract Profile URL

  @ViewNewForm
  Scenario Outline: TS-102-001 New Contract Profile page is displayed with empty fields
    When the user clicks the Add Icon
    Then the header "Enter a New Contract Profile Record" is displayed
    And the expected fields "<fields>" and labels "<labels>" are displayed
    And all fields are empty

    Examples:
      | fields                     | labels                     |
      | Assignment, Customer, VIN  | Assignment, Customer, VIN  |
      | Start Date, End Date       | Start Date, End Date       |

  @AddNewRecord
  Scenario Outline: TS-102-002 Add a new Contract Profile record and save
    When the user clicks the Add Icon
    And the header "Enter a New Contract Profile Record" is displayed
    And the user enters the value(s) "<values>" into the fields "<fields>"
    And the user clicks the Save button
    Then the main page with header "Contract Profile" is displayed
    And a new row is displayed with expected values "<values>" for the column headers "<headers>"

    Examples:
      | fields                     | values                               | headers                         |
      | Assignment, Customer, VIN  | A12345, ABC Corp, 1HGCM82633A123456  | Assignment, Customer, VIN       |
      | Assignment, Customer       | B98765, XYZ Rentals                  | Assignment, Customer            |

  @Negative
  Scenario Outline: TS-102-003 Attempt to create a Contract Profile record with invalid or missing values
    When the user clicks the Add Icon
    And the header "Enter a New Contract Profile Record" is displayed
    And the user enters the invalid value "<value>" into the field "<field>"
    And the user clicks the Save button
    Then the system displays a validation error message "<error>"
    And the record is not saved
    And the user remains on the "Enter a New Contract Profile Record" page

    Examples:
      | field      | value           | error                                   |
      | Assignment |                 | "Assignment is required."               |
      | Customer   | !@#$%           | "Invalid characters entered."           |
      | VIN        | 123             | "VIN must be 17 characters."            |
      | Start Date | 2025-13-40      | "Invalid date format."                  |

