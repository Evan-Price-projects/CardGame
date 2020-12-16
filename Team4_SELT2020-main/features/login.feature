Feature: Allow User to login into their account
  As a game player
  So that I can access the game
  I want to be able to login into the application

  Scenario: I have to login into my account which does not exist
    Given I am on the login page
    When I have entered username "John" and password "Doe"
    Then I should get a message

  Scenario: I have to login into an existing account
    Given I have an account
    And I am on the login page
    When I have entered username "John" and password "Doe"
    Then I should be redirected to the lobby