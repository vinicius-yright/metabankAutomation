#language: en
#encoding: utf-8
#author: Vinicius Souza

@Carteira
Feature: Validar funcionalidade de criação de carteiras via backend

    Background:
      * def urlLocal = 'http://localhost:8080'
      * def body = read('classpath:features/payloads/payload_carteira.json')

  @TC-02
  Scenario: Criar uma nova carteira e validar seu registro
    * def novaPessoa = callonce read('classpath:features/Pessoas.feature@TC-01')
    #registrando nova carteira
    Given url urlLocal
    And path '/carteira'
    And print novaPessoa.response.id
    And set body.idPessoa.id = novaPessoa.response.id
    And request body
    When method post
    And print response
    Then status 201
    * def idCarteira = response.id
    And print idCarteira
    #consultando a pessoa registrada
    Given url urlLocal
    And path '/carteira'
    When method get
    And print response
    Then status 200
    Then match response[*].id contains idCarteira

  @TC-03
  Scenario: Deletar carteira + conta e confirmar remoção via listagem
    * def novaCarteira = callonce read('classpath:features/Carteira.feature@TC-02')
    Given url urlLocal
    And path '/carteira/' + novaCarteira.novaPessoa.response.id
    When method delete
    Then status 200
    #confirmando a remoção
    Given url urlLocal
    And path '/carteira'
    When method get
    Then match response[*].id !contains novaCarteira.novaPessoa.response.id



