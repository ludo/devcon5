Feature: Manage Customers
  In order to do something
  As a user
  I want to manage customers
  
  Scenario: View list of customers
    Given the following customers:
      | name      | email           |
      | Sun       | sun@example.com |
      | Microsoft | ms@example.com  |
    When I go to the customers page
    Then I should see "Sun"
    And I should see "Microsoft"