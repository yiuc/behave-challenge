Feature: Mass Assignment

  Background: Set endpoint and base URL
    Given I am using the endpoint "$APP2_URL"
    And I set base URL to "/"
    And I set variable "sid" to "1"
    And I set variable "username" to "student1"
    And I set variable "email" to "student1@securitychampion"
    And I set variable "group" to "admin"

  @runner.continue_after_failed_step
  Scenario: Do Mass Assignment with v1
    Given a json request payload template
    """
    {"sid": "{{ sid }}", "username": "{{ username }}", "email": "{{ email }}", "group": "{{ group }}"}
    """
    When I make a POST request to "/rest/v1/user"
    Then the response status should be "200"
    And the value of field "group" should be "{FITB}"
