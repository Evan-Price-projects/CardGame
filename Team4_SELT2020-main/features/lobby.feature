Feature: Allow user to enter games from lobby

  As a game player and user
  So that I could play a game with friends
  I want to be able to join multiple games

  Scenario: I want to join the table I created
    Given I am on the lobby page with game created
    When I have clicked to join game
    Then I should be redirected to the game table
