Feature: Testando API GoRest

  Background: Executa antes de cada teste
    * def url_base = 'https://gorest.co.in/public/v2/users/'

  Scenario: Testando criar usuario usando o método POST
    Given url url_base
    * def token = '3ef8e3c99b2914ea47426de897b2d3c3781974f3583aef5cfe50d8a0775264ec'
    * header Authorization = 'Bearer ' + token
    And request { "name": "Diferente de Antoniows Victors", "email": "naoehAntoniows@bbb.br", "gender": "male", "status": "active" }
    When method post
    Then status 201
    And match $.name == 'Diferente de Antoniows Victors'
    And match $.email == 'naoehAntoniows@aaa.br'
    And match $.gender == 'male'
    And match $.status == 'active'

  Scenario: Testando criar usuario usando o método POST com dados invalidos
    Given url url_base
    * def token = '3ef8e3c99b2914ea47426de897b2d3c3781974f3583aef5cfe50d8a0775264ec'
    * header Authorization = 'Bearer ' + token
    And request { "name": "Diferente de Antoniows Victors", "gender": "aaa", "status": "active" }
    When method post
    Then status 422

  Scenario: Testando retorno válido usuario 36
    Given url url_base
    And path '36'
    When method get
    Then status 200
    And match $.id == 36
    And match $.name == 'Achyut Dubashi'
    And match $.email == 'achyut_dubashi@harber.net'
    And match $.gender == 'male'
    And match $.status == 'inactive'

  Scenario: Testando retorno válido usuario 37
    Given url url_base
    And path '37'
    When method get
    Then status 200
    And match $.id == 37
    And match $.name == 'Dayaanidhi Kapoor Esq.'
    And match $.email == 'esq_dayaanidhi_kapoor@abernathy.io'
    And match $.gender == 'female'
    And match $.status == 'active'

  Scenario: Testando retorno inválido usuario 3
    Given url url_base
    And path '3'
    When method get
    Then status 404
    And match $.message == 'Resource not found'




