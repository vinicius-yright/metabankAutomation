#language: en
#encoding: utf-8
#author: Vinicius Souza

@Pessoa
Feature: Validar funcionalidade de cadastro de pessoas via backend

    Background:
      * def urlLocal = 'http://localhost:8080'

  @TC-01
  Scenario: Registrar uma nova pessoa e validar seu cadastro
    #registrando nova pessoa
    * def body = read('classpath:features/payloads/payload_pessoa.json')
    Given url urlLocal
    And path '/pessoa'
    And request body
    When method post
    And print response
    Then status 201
    * def idCriado = response.id
    #consultando a pessoa registrada
    Given url urlLocal
    And path '/pessoa/' + idCriado
    When method get
    And print response
    Then status 200
    Then match response.id == idCriado
    Then match response.cpf == '043.700.270-55'
    Then match response.nome == 'RoboAutomacao'
    Then match response.email == 'automacao@gmail.com.br'
    Then match response.status == 'Teste'
    Then match response.login == 'Automacao'
    Then match response.telefone == '11940028922'




