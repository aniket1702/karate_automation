Feature: Get User profile using token

  Background:
    * def OAuth = call read('OAuth.feature')
    * url 'https://practice.expandtesting.com/notes/api'
    #* def rows = karate.read('classpath:org/example/inputs/notes/csv/data/testData.csv')

  Scenario Outline: <TestScenarioNo> Get user profile
    Given path 'users/profile'
    And header x-auth-token = OAuth.tokens
    When method get
    Then print response
    And match response.status == <expectedStatusCode>
    Examples:
      | read('classpath:org/example/inputs/notes/csv/data/testData.csv') |

  Scenario Outline: <TestScenarioNo> Get user profile
    Given path 'users/profile'
    And header x-auth-token = OAuth.tokens
    When method get
    Then print response
    And match response.status == <expectedStatusCode>
    Examples:
      | read('classpath:org/example/inputs/notes/csv/data/testData.csv') |