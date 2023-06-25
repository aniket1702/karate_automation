Feature: Login to website using POST request and validate response

  Background:
    Given url 'https://opensource-demo.orangehrmlive.com/web/index.php/'
    * def payload = { username: 'Admin', password: 'admin123' }
    When path 'auth/login'
    Then request payload
    When method get
    Then status 200
    * def sessionCookie = karate.get('responseHeaders["Set-Cookie"][0].split(";")[0]')
    Then karate.set('token', sessionCookie)

  Scenario: Login with cookie credentials
    * cookie JSESSIONID = token
    When path 'dashboard/index'
    Then method get
    And status 200
    * def pageTitle = karate.jsonPath(karate.responseHtml(), '$.head.title').toString()
    And match pageTitle == 'OrangeHRM'





