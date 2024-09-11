Feature: Evaluate ticket buying workflow

  Background: Set endpoint and base URL
    Given I am using the endpoint "$APP1_URL"
    And I set base URL to "/"

  @runner.continue_after_failed_step
  Scenario: Select ticket
    When I make a GET request to "select_ticket"
    Then the response status should be 200
    And the key "token" should be in the response body and save its value for later use

  @runner.continue_after_failed_step
  Scenario: Buy ticket
    Given I set variable "{FITB}" to "370"
    And  I set key to "{FITB}" and value to last stored value
    And A request payload template
    """
    {FITB}
    """
    When I make a {FITB} request to "buy_ticket"
    Then <Statement 5>
    
  @runner.continue_after_failed_step
  Scenario: Confirm order
    Given <Statement 1>
    And <Statement 2>
    And A request payload template
    """
    {FITB}
    """
    When <Statement 4>
    Then <Statement 5>
