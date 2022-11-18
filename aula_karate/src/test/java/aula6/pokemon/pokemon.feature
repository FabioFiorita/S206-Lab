Feature: Testando API Pokemon

  Background: Executa antes de cada teste
    * def url_base = 'https://pokeapi.co/api/v2/'

  Scenario: Testando retorno pikachu
    Given url url_base
    And path 'pokemon/pikachu'
    When method get
    Then status 200
    And match response.name == 'pikachu'
    And match response.id == 25

  Scenario: Testando retorno invalido
    Given url url_base
    And path 'pokemon/didi'
    When method get
    Then status 404

  Scenario: Testando retorno pokemon Rede entrando em um dos elementos do array de idiomas e testando retorno JSON
    Given url url_base
    And path 'version/1/'
    When method get
    Then status 200
    And def idioma = $.names[5].language.url
    And url idioma
    When method get
    Then status 200
    And match response.name == 'es'
    And match response.id == 7

  Scenario: Testando retorno mew
    Given url url_base
    And path 'pokemon/mew'
    When method get
    Then status 200
    And match response.name == 'mew'
    And match response.id == 151

  Scenario: Testando retorno charmander entrando na abilidade solar-power e testando o retorno JSON
    Given url url_base
    And path 'pokemon/charmander'
    When method get
    Then status 200
    And def abilidade = $.abilities[1].ability.url
    And url abilidade
    When method get
    Then status 200
    And match response.name == 'solar-power'
    And match response.id == 94