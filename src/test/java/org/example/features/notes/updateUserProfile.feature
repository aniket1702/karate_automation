Feature: Feature to update users profile
  Background:
    * def OAuth = call read('OAuth.feature')
    * url baseUrl

  Scenario Outline: Update users profile based on unique name
    Given path 'users/profile'
    And header Content-Type = 'application/json; charset=utf-8'
    And header x-auth-token = OAuth.tokens
    * def userProfileUpdate = read('classpath:org/example/inputs/notes/userProfile_update.json')
    * replace userProfileUpdate.name = '<name>'
    * replace userProfileUpdate.phone = '<phone>'
    * replace userProfileUpdate.company = '<company>'
    When request
    """
    {
  "name": "<name>",
  "phone": "<phone>",
  "company": "<company>"
}
    """
    When method patch
    Then status 200
    * print response
    Examples:
      | name | phone | company |
      | John | 7734234453 | DEF_XYS |


