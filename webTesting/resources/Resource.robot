*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  firefox
${URL}  http://automationpractice.com


*** Keywords ***
# Setup e Teardown
Abrir navegador
    Open Browser  http://automationpractice.com  ${BROWSER}  

Fechar navegador
    Close Browser

# Ações
Acessar a página home do site
    Title Should Be  My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text  name=search_query  ${PRODUTO}

Clicar no botão pesquisar
    Click Element  name=submit_search

# Conferências
Conferir se o produto "${PRODUTO}" foi listado no site   
    Wait Until Element Is Visible  css=#center_column > h1
    Title Should Be  Search - My Store
    Page Should Contain Image  xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link  xpath=//*[@id="center_column"]/ul/li/div/div[2]/h5/a

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible  xpath=//*[@id="center_column"]/p
    Element Text Should Be  xpath=//*[@id="center_column"]/p  ${MENSAGEM_ALERTA}