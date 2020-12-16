Feature: Allow User to draw a card

  As a Game Player
  So that I can have cards in my hand
  I want to be able to draw a card

  Scenario: I want to draw a specific card into my hand
    Given I am on the game board
    When I click the Select Card button
    Then I should have another card in my hand

  Scenario: I want to move card from action to hand
    Given I am on the game board
    When I click on the Move Card button
    Then I should see card moved

  Scenario: I want to recover all the discarded cards
    Given I am on the game board
    When I click on the Recover Discard button
    Then I should see all discarded cards recovered

  Scenario: I want to pass card to myself
    Given I am on the game board
    When I click on the Pass button
    Then I should see message telling me I cannot do this

  Scenario: I want to end the game
    Given I am on the game board
    When I click the End Game button
    Then I should be redirected to the lobby