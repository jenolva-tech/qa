Feature: Search and View Contract Profile Assignment Details
  As a Contract Specialist
  I want to search for a Contract Profile Assignment and view its details
  So that I can verify the information for a specific contract record

  ## Key
  # TS-103-001 — Search and View Details (Positive)
  # TS-103-002 — Negative: No Results or Invalid Search

  Background:
    Given the user navigates to the Contract Profile URL
    Then the header "Contract Profile" is displayed
    And the search criteria fields are displayed:
      | Assignment |
      | Customer   |
    And the corresponding labels are displayed:
      | Assignment |
      | Customer   |
    And the expected columns are displayed:
      | Assignment |
      | Customer   |
      | Car Count  |
    And 0 row(s) are displayed on the Assignment results table
    And the message "no records" is displayed

  @SearchViewDetailsPage
  Scenario Outline: TS-103-001 Search a Contract Profile Assignment and view the Details page
    When the user enters the value "<searchvalue>" into the search criteria field "<assignmentField>"
    And the user clicks the Search button
    Then 1 row is displayed on the Assignment results table

    When the user clicks the assignment "<assignment>" in the Assignment column
    Then the Contract Profile Details tab is displayed
    And the expected value "<assignmentValue>" for the field "<assignmentField>" is displayed
    And the expected value "<customerValue>" for the field "<customerField>" is displayed
    And the expected value "<carcountValue>" for the field "<carcountField>" is displayed

    Examples:
      | assignmentField | searchvalue | assignment | assignmentValue | customerField | customerValue | carcountField | carcountValue |
      | Assignment      | A12345      | A12345     | A12345          | Customer      | ABC Corp      | Car Count     | 12            |
      | Assignment      | B98765      | B98765     | B98765          | Customer      | XYZ Rentals   | Car Count     | 4             |

  @Negative
  Scenario Outline: TS-103-002 Search with no results or invalid criteria
    When the user enters the value "<searchvalue>" into the search criteria field "<assignmentField>"
    And the user clicks the Search button
    Then 0 row(s) are displayed on the Assignment results table
    And the message "<errorMessage>" is displayed

    Examples:
      | assignmentField | searchvalue      | errorMessage     |
      | Assignment      | UNKNOWN123       | no records       |
      | Assignment      | !@#$%            | invalid criteria |
      | Assignment      |                  | no records       |

