Feature: Provide Authentication

  Background:
    Given url 'https://practice.expandtesting.com/notes/api'
    When method get
    Then status 200

  Scenario: Authenticate valid user
    Given path 'users/login'
    And header Content-Type = 'application/json'
    * def loginPayload = { email: 'John2.Doe@gmail.com', password: 'John@Doe123' }
    When request loginPayload
    When method post
    Then status 200
    * def tokens = response.data.token
