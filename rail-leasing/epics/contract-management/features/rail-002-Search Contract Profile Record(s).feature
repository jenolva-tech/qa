Feature: Search Contract Profile Record(s)
  As a Contract Specialist
  I want to enter values in the search fields and perform a search
  So that I can view the Contract Profile records that I need to work on

  # Key
  # TS-102-001 — Test Scenario ID
  # TC-102-XX — Test Case ID (if expanded into test cases)

  Background:
    Given the user navigates to the Contract Profile URL
    And the header "Contract Profile" is displayed
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

  @NoResults
  Scenario Outline: TS-102-001 Search using criteria and view the Assignment table with no rows
    When the user enters the value(s) "<value>" in the search field(s) "<field>"
    And the user clicks the Search button
    Then 0 row(s) are displayed on the Assignment results table
    And the message "no records" is displayed

    Examples:
      | field      | value        |
      | Assignment | XYZ999       |
      | Customer   | Unknown Corp |
      | Assignment | INVALID123   |

  @WithResults
  Scenario Outline: TS-102-002 Search using criteria and view the Assignment table with rows
    When the user enters the value(s) "<value>" in the search field(s) "<field>"
    And the user clicks the Search button
    Then <rows> row(s) are displayed on the Assignment results table
    And the row(s) are displayed with expected row number <row>, values "<values>", for the column headers "<headers>"

    Examples:
      | field      | value     | rows | row | values                                        | headers                         |
      | Assignment | A12345    | 1    | 1   | Assignment=A12345; Customer=ABC; Car Count=12 | Assignment, Customer, Car Count |
      | Customer   | ABC Corp  | 2    | 1   | Assignment=A10001; Customer=ABC Corp; Car Count=5 | Assignment, Customer, Car Count |
      | Customer   | ABC Corp  | 2    | 2   | Assignment=A10002; Customer=ABC Corp; Car Count=3 | Assignment, Customer, Car Count |

  @Negative
  Scenario Outline: TS-102-003 Search using invalid or unsupported criteria
    When the user enters the value(s) "<value>" in the search field(s) "<field>"
    And the user clicks the Search button
    Then the system displays a validation message "<message>"
    And no search results are displayed

    Examples:
      | field      | value              | message                                   |
      | Assignment | !@#$%              | Invalid characters entered                |
      | Customer   | 123456789012345678 | Value exceeds maximum length allowed      |
      | Assignment | (empty)            | Please enter at least one search criteria |

  