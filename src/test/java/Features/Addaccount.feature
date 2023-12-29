@addAccount
Feature: add an account

  Scenario: adding account to /api/accounts/add-primary-account
    Given url "https://qa.insurance-api.tekschool-students.com"
    * def includedToken = callonce read('Token.feature')
    * def token = "Bearer " + includedToken.response.token
    And path "/api/accounts/add-primary-account"
    * def dataGenerator = Java.type('Data.DataGenerator')
    * def email = dataGenerator.generateEmail()
    * def fname = dataGenerator.generateFirstname()
    * def lname = dataGenerator.generateLastname()
    And request
    """
    {
  "id": 0,
  "email": "#(email)",
  "firstName": "#(fname)",
  "lastName": "#(lname)",
  "title": "Mr",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "employed",
  "dateOfBirth": "2023-12-26T01:14:52.766Z",
  "new": true
   }
    """
    And method post
    Then status 201
    And print response
    And assert response.email == email
    * def newId = response.id
    And path "/api/accounts/delete-account"
    And header Authorization = token
    And param primaryPersonId = newId
    And method delete
    Then status 200
    And match response contains
    """
    {
    "status": true,
    "httpStatus": "OK",
    "message": "Account Successfully deleted"
    }
    """






