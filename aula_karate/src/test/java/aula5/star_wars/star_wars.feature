Feature: Testando API Star Wars

    Scenario: Testando retorno de people/1
        Given url "https://swapi.co/api/people/1"
        When method get
        Then status 200

    Scenario: Testando retorno de people/2
        Given url "https://swapi.co/api/people/2"
        When method get
        Then status 200

    Scenario: Testando retorno de planets/1
        Given url "https://swapi.co/api/planets/1"
        When method get
        Then status 200

    Scenario: Testando retorno de starships/1
        Given url "https://swapi.co/api/starships/1"
        When method get
        Then status 200