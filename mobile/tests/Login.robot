*** Settings ***
Documentation                      Suite de testes de login
Resource                           ../resources/Base.resource

Test Setup                         Start session
Test Teardown                      Finish session

*** Test Cases ***

Deve logar com IP e CPF
    [Tags]     temp

    ${data}    Get JSON fixture    login

    Insert Membership              ${data}

    Signin with document           ${data}[account][cpf]
    User is logged in
  
Não deve logar com CPF não cadastrado
    Signin with document           45205170018
    Popup have text                Acesso não autorizado! Entre em contato com a central de atendimento

Não deve logar com CPF inválido
    Signin with document           12345678900
    Popup have text                CPF inválido, tente novamente
