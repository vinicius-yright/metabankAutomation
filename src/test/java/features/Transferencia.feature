#language: en
#encoding: utf-8
#author: Vinicius Souza

@MetaBank @Transferencia
Feature: Validar funcionalidade de transferencia pix via backend

    Background:
      * def urlLocal = 'http://89.116.225.253:8080'

  @TC-06
  Scenario: Realizar transferencia com chave email
    Given url urlLocal
    And path '/transferencia/'
    And param idCarteiraPagadora = '2'
    And param chavePix = 'email@email.com'
    And param valor = '6'
    And method post
    And print response
    And status 200

  @TC-07
  Scenario: Realizar transferencia com chave celular
    Given url urlLocal
    And path '/transferencia/'
    And param idCarteiraPagadora = '2'
    And param chavePix = '11999999999'
    And param valor = '9'
    And method post
    And print response
    And status 200

  @TC-08
  Scenario: Realizar transferencia com chave cpf
    Given url urlLocal
    And path '/transferencia/'
    And param idCarteiraPagadora = '1'
    And param chavePix = '4044040430'
    And param valor = '9'
    And method post
    And print response
    And status 200

  @TC-09
  Scenario: Realizar transferencia com chave aleatoria
    Given url urlLocal
    And path '/transferencia/'
    And param idCarteiraPagadora = '1'
    And param chavePix = 'hfghfgsfdfsddgdf3213'
    And param valor = '9'
    And method post
    And print response
    And status 200


