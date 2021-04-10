*** Settings ***
Documentation   Random Email Generator
Library  String

*** Variable ***
&{CLIENT}       name=John   last_name=Doe   

*** Test Cases ***
Test Case 01
    Return custom email  ${CLIENT.name}  ${CLIENT.last_name}

*** Keywords ***
Return custom email
    [Arguments]  ${USER_NAME}  ${USER_LAST_NAME}
    ${RANDOM_STRING}  Generate Random String
    ${EMAIL}  Set Variable  ${USER_NAME}${USER_LAST_NAME}${RANDOM_STRING}@testerobot.com
    [Return]  ${EMAIL}