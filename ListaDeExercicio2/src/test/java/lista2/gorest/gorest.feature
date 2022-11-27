Feature: Testando API GoRest

  Background: Executa antes de cada teste
    * def url_base = 'https://gorest.co.in/public/v2/users/'

  Scenario: Deletando usuario usando o método DELETE
    Given url url_base
    And path '2177'
    * def token = '3ef8e3c99b2914ea47426de897b2d3c3781974f3583aef5cfe50d8a0775264ec'
    * header Authorization = 'Bearer ' + token
    When method delete
    Then status 204

  Scenario: Testando retorno invalido usuario 38
    Given url url_base
    And path '38'
    When method get
    Then status 404
    And match response.message == 'Resource not found'

  Scenario: Testando criar usuario usando o método POST
    Given url url_base
    * def token = '3ef8e3c99b2914ea47426de897b2d3c3781974f3583aef5cfe50d8a0775264ec'
    * header Authorization = 'Bearer ' + token
    And request { "name": "Antoniows Victors", "email": "Antoniows@jjj.br", "gender": "female", "status": "active" }
    When method post
    Then status 201
    And match $.name == 'Antoniows Victors'
    And match $.email == 'Antoniows@jjj.br'
    And match $.gender == 'female'
    And match $.status == 'active'

  Scenario: Testando retorno válido usuario 39
    Given url url_base
    And path '39'
    When method get
    Then status 200
    And match $.id == 39
    And match $.name == 'Kamlesh Sharma'
    And match $.email == 'sharma_kamlesh@barrows-carter.info'
    And match $.gender == 'male'
    And match $.status == 'active'

  Scenario: Atualizando usuario usando o método PUT
    Given url url_base
    And path '44'
    * def token = '3ef8e3c99b2914ea47426de897b2d3c3781974f3583aef5cfe50d8a0775264ec'
    * header Authorization = 'Bearer ' + token
    And request { "name": "Antoniows Victors", "email": "Antoniows@uuu.br", "gender": "female", "status": "active" }
    When method put
    Then status 200
    And match $.name == 'Antoniows Victors'
    And match $.email == 'Antoniows@uuu.br'
    And match $.gender == 'female'
    And match $.status == 'active'

  Scenario: Testando método PUT com dados invalidos
    Given url url_base
    And path '42'
    * def token = '3ef8e3c99b2914ea47426de897b2d3c3781974f3583aef5cfe50d8a0775264ec'
    * header Authorization = 'Bearer ' + token
    And request { "name": "Antoniows Victors", "gender": "tttt", "status": "active" }
    When method put
    Then status 422



