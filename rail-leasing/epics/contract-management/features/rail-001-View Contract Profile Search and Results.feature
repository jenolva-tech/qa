Feature: View Contracts Search and Results
  As a Contract Specialist
  I want to view the search criteria page and the results table
  So that I know where contract records will appear once I perform a search

  ## Key
  # TS-101-001 — Test Scenario ID
  # TC-101-XX — Test Case ID (if expanded into test cases)

  Background:
    Given the user navigates to the Contracts URL
    Then the header "Contracts" is displayed
    And the search criteria fields are displayed:
      | Assignment |
      | Customer   |
    And the corresponding labels are displayed:
      | Assignment |
      | Customer   |
    And the expected Contract table columns are displayed:
      | Assignment |
      | Customer   |
      | Car Count  |
    And 0 row(s) are displayed on the Assignment results table
    And the message "no records" is displayed

  @InitialView
  Scenario: TS-101-001 View search criteria and Assignment table with no rows
    Then the Assignment results table displays 0 row(s)
    And the message "no records" is displayed

