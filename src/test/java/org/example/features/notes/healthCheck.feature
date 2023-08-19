

Feature: Health Check Feature Test

  Background:
    * def RandomStringUtils = Java.type('org.example.util.RandomStringUtils')
    * def randomStringUtils = new RandomStringUtils()
    Given url baseUrl


  Scenario: Health check feature
    Given path '/health-check'
    * def name = randomStringUtils.getName()
    Then print 'Name:', name
    When method get
    Then status 200

  Scenario Outline: User Login
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
    * print response

    Examples:
      | email | password |
      | John2.Doe@gmail.com | John@Doe123 |
      | Larry2.Gill@gmail.com | Larry@Gill123 |
      | Johny2.Doe@gmail.com | Johny@Doe123 |

  @ignore
  Scenario Outline: User Registration
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
    * print response

    Examples:
      | name | email | password |
      | John | John4.Doe@gmail.com | John@Doe123 |
      | Larry | Larry4.Gill@gmail.com | Larry@Gill123 |
      | Johny | Johny4.Doe@gmail.com | Johny@Doe123 |