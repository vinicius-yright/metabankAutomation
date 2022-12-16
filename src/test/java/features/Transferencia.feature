#language: en
#encoding: utf-8
#author: Vinicius Souza

@MetaBank @Transferencia
Feature: Validar funcionalidade de transferencia pix via backend

    Background:
      * def urlLocal = 'http://89.116.225.253:8080'

  @TC-06
  Scenario Outline: Realizar transferencia com chave <tipoChave>
    Given url urlLocal
    And path '/transferencia/'
    And param idCarteiraPagadora = <idCarteiraPagadora>
    And param chavePix = <chave>
    And param valor = '6'
    And method post
    And print response
    And status 200

    Examples:
    |tipoChave  | idCarteiraPagadora|         chave           |
    |email      |         '2'       |  'email@email.com'      |
    |celular    |         '2'       |  '11999999999'          |
    |cpf        |         '1'       |  '4044040430'           |
    |aleatoria  |         '1'       |  'hfghfgsfdfsddgdf3213' |

  @TC-10
  Scenario: Tentativa de realizar transferencia com chave aleatoria sem enviar id da carteira pagadora
    Given url urlLocal
    And path '/transferencia/'
    And param chavePix = 'hfghfgsfdfsddgdf3213'
    And param valor = '9'
    And method post
    And print response
    And status 400
    And match response.error == 'Bad Request'

  @TC-11
  Scenario: Tentativa de realizar transferencia sem enviar valor da chavePix
    Given url urlLocal
    And path '/transferencia/'
    And param valor = '9'
    And method post
    And print response
    And status 400
    And match response.error == 'Bad Request'


