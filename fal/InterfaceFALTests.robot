*** Settings ***
Resource  Resource.robot
Suite Setup  Conectar a minha Interface
Test Timeout  1 s

*** Test Cases ***
Verificar email válido
    Validar o email "email@robot.com" 
    Conferir informação  true

Verificar email inválido
    Validar o email "emailrobot.com" 
    Conferir informação  false

Verificar se o bluetooth está ativado
    #[Timeout]  NONE
    Requisitar a função "FAL_BluetoothHCITxReady"
    Conferir informação  true

Recuperar informações da FAL
    Recuperar informação da função com id "51"
    Conferir informação  FAL-51

