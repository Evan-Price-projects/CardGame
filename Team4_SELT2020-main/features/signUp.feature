Feature: Allow User to create an account

  As a game player
  So that I can play card games with my friends
  I want to be able to create an account

  Scenario: I have to create a new account
    Given I am on the sign up page
    When I have to create a new account with username "John" and password "JohnDoe1"
    Then I should be redirected to the login page for "John"

