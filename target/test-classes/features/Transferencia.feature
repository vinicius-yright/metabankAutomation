#language: en
#encoding: utf-8
#author: Vinicius Souza

@MetaBank @Transferencia
Feature: Validar funcionalidade de transferencia pix via backend

    Background:
      * def urlLocal = 'http://89.116.225.253:8080'

  @TC-06
  Scenario: Realizar transferencia
    Given url urlLocal
    And path '/transferencia/'
    And param idCarteiraPagadora = '2'
    And param chavePix = 'email@email.com'
    And param valor = '29'
    And method post
    And status 200

  @TC-07
  Scenario: Tentativa de realizar transferencia sem enviar id da carteiraPagadora
    Given url urlLocal
    And path '/transferencia/'
    And param idCarteiraPagadora = '0'
    And param chavePix = 'email@email.com'
    And param valor = '29'
    And method post
    And print response
    And status 200

