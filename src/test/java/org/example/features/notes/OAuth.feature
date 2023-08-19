Feature: Feature to Provide Authentication

  Background:
    Given url baseUrl

  Scenario: Authenticate valid user
    Given path 'users/login'
    And header Content-Type = 'application/json'
    * def loginPayload = { email: 'John2.Doe@gmail.com', password: 'John@Doe123' }
    When request loginPayload
    When method post
    Then status 200
    * def tokens = response.data.token
    * print tokens
