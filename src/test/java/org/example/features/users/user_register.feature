Feature: Feature for User Registration

  Background:
    Given url baseUrl
    * def name = randomStringUtils.getName()
    * def email = randomStringUtils.getEmail()
    * def password = randomStringUtils.getPassword()

  @Smoke @Regression @UserRegistration
  Scenario: 1. Verify User Registration with valid details - Positive
    Given path 'users/register'
    And header Content-Type = 'application/json; charset=utf-8'
    When request {name: '#(name)',email: '#(email)',password: '#(password)'}
    And method post
    Then status 201
    * print response
    And match response.message =='User account created successfully'


  Scenario: 2. User Registration with Invalid details - Negative
    Given path 'users/register'
    And header Content-Type = 'application/json; charset=utf-8'
    When request {name: '#(name)',email: '#(name)',password: '#(password)'}
    And method post
    Then status 400
    * print response
    And match response.message =='A valid email address is required'