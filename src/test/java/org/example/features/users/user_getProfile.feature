Feature: API to test User Profile

  Background:
    * def OAuth = call read('user_oauth.feature')
    Given url baseUrl

  Scenario: 1. Get valid user profile - Positive
    Given path 'users/profile'
    And header x-auth-token = OAuth.tokens
    When method get
    Then status 200
    * print response
    And match response.message == 'Profile successful'