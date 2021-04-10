*** Settings ***
Documentation  Documentação da API: https://fakerestapi.azurewebsites.net/swagger/ui/index#/Books
Resource  ResourceInterface.robot
Suite Setup  Conectar a minha Interface

*** Test Cases ***
Buscar a listagem de todas as funções da FAL (GET em todas as funções)
    Requisitar todas as funções
    Conferir o status code  200
    Conferir o reason  OK
    Conferir se retorna uma lista com "200" funções

Buscar uma função específica (GET em uma função específica)
    Requisitar a função "15"
    Conferir o status code  200
    Conferir o reason  OK
    Conferir se retorna todos os dados corretos da função 15

Adicionar uma nova função (POST)
    Adicionar nova função

