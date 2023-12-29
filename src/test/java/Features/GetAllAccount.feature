@getAllAccounts
Feature: Get All Accounts
  Background: Setup
    Given url BASE_URL
    Given path "/api/token"
    * def username = "supervisor"
    * def password = "tek_supervisor"
    And request {"username": "#(username)","password": "#(password)"}
    When method post
    Then status 200
    * def validToken = "Bearer " + response.token


  Scenario: get all accounts from /api/accounts/get-all-accounts
    And print response
    And path "/api/accounts/get-all-accounts"
    And header Authorization = validToken
    When method get
    And print response
    Then status 200
    Scenario: get account by Id /api/accounts/get-account

      And print response
      And path "/api/accounts/get-account"
      And header Authorization = validToken
      * def primaryId = 2365
      And param primaryPersonId = primaryId
      When method get
      And print response
      Then status 200
      And assert response.primaryPerson.id == primaryId
