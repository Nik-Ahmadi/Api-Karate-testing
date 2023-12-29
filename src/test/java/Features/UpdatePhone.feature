@put
Feature: Update Phone Number

  Scenario: update phone number via /api/accounts/update-account-phone
    Given url BASE_URL
    And path "/api/token"
    And request {"username": "supervisor", "password": "tek_supervisor"}
    And method post
    Then status 200
    And print response
    * def token = "Bearer " + response.token
    And path "/api/accounts/update-account-phone"
    And header Authorization = token
    And param primaryPersonId = 2383
    And request
    """
    {
    "id": 408,
    "phoneNumber": "2537894562",
    "phoneExtension": "206",
    "phoneTime": "pacific",
    "phoneType": "Cell Phone"
    }
    """
    And method put
    Then status 200
    And print response