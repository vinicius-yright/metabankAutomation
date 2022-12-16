#language: en
#encoding: utf-8
#author: Vinicius Souza

@MetaBank @Pix
Feature: Validar funcionalidade de chaves pix via backend

    Background:
      * def urlLocal = 'http://89.116.225.253:8080'
      * def body = read('classpath:features/payloads/payload_addchavepix.json')
      * def randomNum =
      """
        function(args) {
          var randomNum = Java.type('utils.Utils');
          var rn = new randomNum();
          return rn.randomNum();
        }
      """

  @TC-05
  Scenario Outline: Cadastrar chave tipo <tipoChave> e remover em seguida
    * def novaCarteira = callonce read('classpath:features/Carteira.feature@TC-02')
    #registrando nova carteira
    Given url urlLocal
    And path '/chaves-pix/' + novaCarteira.idCarteira
    And set body.tipoChave = <tipoChave>
    And set body.descricao = '<chave>'
    And request body
    And method post
    And status 201
    Then match response.id == '#number'
    Then match response.tipoChave == <tipoChave>
    Then match response.descricao == '<chave>'
    * def idChaveCriada = response.id
    And print idChaveCriada
    #confirmando registro da chave pix via listagem
    Given url urlLocal
    And path '/chaves-pix'
    When method get
    And print response
    Then match response[*].id contains idChaveCriada
    #removendo a chave criada para não manter duplicadas
    Given url urlLocal
    And path '/carteira/', novaCarteira.idCarteira, '/<chave>'
    And method delete
    And status 200

    Examples:
    | tipoChave   |       chave                |
    | 'EMAIL'     |  karatemetabank.com   |
    | 'CELULAR'   |  11940018032               |
    | 'CPF'       |  50308545940               |
    | 'ALEATORIA' |  chavecompletamentealeatoriasemlogica           |
