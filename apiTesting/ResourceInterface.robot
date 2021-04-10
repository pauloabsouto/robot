*** Settings ***
Documentation  Documentação da API: https://fakerestapi.azurewebsites.net/swagger/ui/index#/Books
Library  RequestsLibrary
Library  Collections

*** Variables ***
${URL_API}  https://fakerestapi.azurewebsites.net/api/
&{FUNCTION_15}  ID=15  
...  Title=Book 15  
...  PageCount=1500 

*** Keywords ***
#Setup e Teardown
Conectar a minha Interface
    Create Session  fakeInterface  ${URL_API}

#Ações
Requisitar todas as funções
    ${RESPOSTA}  Get Request  fakeInterface  Books
    Request Should Be Successful  ${RESPOSTA}
    Log  ${RESPOSTA.text}
    Set Test Variable  ${RESPOSTA}

Requisitar a função "${ID_FUNCAO}"
    ${RESPOSTA}  Get Request  fakeInterface  Books/${ID_FUNCAO}
    Log  ${RESPOSTA.text}
    Set Test Variable  ${RESPOSTA}

Adicionar nova função
    ${HEADERS}  Create Dictionary  content-type=application/json
    ${RESPOSTA}  Post Request  fakeInterface  Books
    ...  data={"ID": 201,"Title": "Function 201","Description": "FAL","PageCount": 0,"Excerpt": "FAL","PublishDate": "2020-06-16T12:27:48.671Z"}
    ...  headers=${HEADERS}
    Log  ${RESPOSTA.text}
    Set Test Variable  ${RESPOSTA}

#Conferências
Conferir o status code
    [Arguments]  ${STATUS_CODE_DESEJADO}
    Should Be Equal As Strings  ${RESPOSTA.status_code}  ${STATUS_CODE_DESEJADO}

Conferir o reason
    [Arguments]  ${REASON_DESEJADO}
    Should Be Equal As Strings  ${RESPOSTA.reason}  ${REASON_DESEJADO}    

Conferir se retorna uma lista com "${QTD_FUNCOES}" funções
    Length Should Be  ${RESPOSTA.json()}  ${QTD_FUNCOES}

Conferir se retorna todos os dados corretos da função 15
    Dictionary Should Contain Item  ${RESPOSTA.json()}  ID  ${FUNCTION_15.ID}  
    Dictionary Should Contain Item  ${RESPOSTA.json()}  Title  ${FUNCTION_15.Title}
    Should Not Be Empty  ${RESPOSTA.json()["Description"]}
    Dictionary Should Contain Item  ${RESPOSTA.json()}  PageCount  ${FUNCTION_15.PageCount}
    Should Not Be Empty  ${RESPOSTA.json()["Excerpt"]}
    Should Not Be Empty  ${RESPOSTA.json()["PublishDate"]}