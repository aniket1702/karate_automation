

Feature: Health Check Feature Test

  Background:
    Given url 'https://practice.expandtesting.com/notes/api'
    When method get
    Then status 200

  Scenario: Health check feature
    Given path '/health-check'
    When method get
    Then status 200

  Scenario Outline: User Login read via json
    Given path 'users/login'
    And header Content-Type = 'application/json; charset=utf-8'
    * def userLogin = read('classpath:org/example/inputs/notes/userLogin.json')
    * replace userLogin.email = '<email>'
    * replace userLogin.password = '<password>'
    When request
    """
    {
      "email": "<email>",
      "password": "<password>"
    }
    """
    When method post
    Then status 200
    * print <expectedStatus>
    And match response.status == Number(expectedStatus)

    Examples:
      | email                 | password      | expectedStatus |
      | John2.Doe@gmail.com   | John@Doe123   | 200      |
      | Larry2.Gill@gmail.com | Larry@Gill123 | 200      |
      | Johny2.Doe@gmail.com  | Johny@Doe123  | 200     |

  @ignore
  Scenario Outline: User Registration read values from json
    Given path '/users/register'
    And header Content-Type = 'application/json; charset=utf-8'
    * def userRegistration = read('classpath:org/example/inputs/notes/userRegisterV1.json')
    * replace userRegistration.name = '<name>'
    * replace userRegistration.email = '<email>'
    * replace userRegistration.password = '<password>'
    When request
    """
    {
      "name": "<name>",
      "email": "<email>",
      "password": "<password>"
    }
    """
    When method post
    Then status 201
    * print <response>
    And match response.status == <response>

    Examples:
      | name  | email                 | password      | response |
      | John  | John4.Doe@gmail.com   | John@Doe123   | 201      |
      | Larry | Larry4.Gill@gmail.com | Larry@Gill123 | 201      |
      | Johny | Johny4.Doe@gmail.com  | Johny@Doe123  | 201      |


  Scenario Outline:<TestScenarioNo> User Login read via CSV
    Given path 'users/login'
    And header Content-Type = 'application/json; charset=utf-8'
    When request { email: '<email>', password: '<password>' }
    And method post
    Then status 200
    * print <expectedStatusCode>
    And match response.status == Number(expectedStatusCode)

    Examples:
      | read('classpath:org/example/inputs/notes/csv/data/testData.csv')  |

