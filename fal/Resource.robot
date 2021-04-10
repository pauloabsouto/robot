*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${URL_API}  http://localhost:8080/test/

*** Keywords ***
#Setup e Teardown
Conectar a minha Interface
    Create Session  fakeInterface  ${URL_API}

#Ações
Requisitar a função "${FUNCAO}"
    ${RESPOSTA}  Get Request  fakeInterface  ${FUNCAO}
    Log  ${RESPOSTA.text}
    Set Test Variable  ${RESPOSTA}

Validar o email "${EMAIL}"
    ${RESPOSTA}  Get Request  fakeInterface  isValidEmail?email=${EMAIL}
    Log  ${RESPOSTA.text}
    Set Test Variable  ${RESPOSTA}

Recuperar informação da função com id "${ID}"
    ${RESPOSTA}  Get Request  fakeInterface  FAL_GetSystemInfo?id=${ID}
    Log  ${RESPOSTA.text}
    Set Test Variable  ${RESPOSTA}

#Conferências
Conferir o status code
    [Arguments]  ${STATUS_CODE_DESEJADO}
    Status Should Be  ${STATUS_CODE_DESEJADO}  ${RESPOSTA}

Conferir o reason
    [Arguments]  ${REASON_DESEJADO}
    Should Be Equal As Strings  ${RESPOSTA.reason}  ${REASON_DESEJADO}    

Conferir informação
    [Arguments]  ${STATUS_DESEJADO}
    Should Be Equal As Strings  ${RESPOSTA.text}  ${STATUS_DESEJADO}
