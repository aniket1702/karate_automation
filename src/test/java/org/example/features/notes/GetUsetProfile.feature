Feature: Get User profile using token

  Background:
    * def OAuth = call read('OAuth.feature')
    Given url baseUrl

  Scenario: Get user profile
    Given path 'users/profile'
    And header x-auth-token = OAuth.tokens
    When method get
    Then status 200
    * print response