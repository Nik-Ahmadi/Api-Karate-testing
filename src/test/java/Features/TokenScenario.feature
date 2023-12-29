@api1
Feature:

  Scenario Outline: Generating a valid token from /api/token
  Given url BASE_URL
  And path "/api/token"
  And request {"username":"<username>", "password": "<password>"}
  When method post
    And print response
  Then  status <status>
    Examples:
      |username|password|status|
      |supervisoo|tek_supervisor|200|
      | admin|tek_supervisor|404|
      |superviso|tek_sueikjd|200|
