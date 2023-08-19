Feature: Feature for User Login

  Background:
    Given url baseUrl
    * def getDetailsToLoginFeature = call read('user_register.feature')


  @Smoke @Regression @UserLogin
  Scenario: 1. User Login with valid details - Positive
    Given path 'users/login'
    And header Content-Type = 'application/json; charset=utf-8'
    * def name = getDetailsToLoginFeature.name
    * def email = getDetailsToLoginFeature.email
    * def password = getDetailsToLoginFeature.password
    When request {email: '#(email)',password: '#(password)'}
    And method post
    Then status 200
    * print response
    And match response.message =='Login successful'
    And match response.data.email == email
    And match response.data.name == name
