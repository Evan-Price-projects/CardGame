Feature: Allow users to create new tables to play games on

  As a game player
  So that I can play from beginning with my friends
  I want to be able to create a new table to play games on

  Scenario: I have to create a new table
    Given I am on the lobby page
    When I have clicked to create a new game or table
    Then I should be redirected to the create new game page

  Scenario: I have to create a game or table named "Table1"
    Given I am on the lobby page
    And I have clicked to create a new game or table
    When I enter and submit "Table1"
    Then I should be able to start the game