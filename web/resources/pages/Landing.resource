*** Settings ***
Documentation   Ações e elementos da Landing Page

Library     Browser
Resource    Components/BoxNotice.resource

*** Keywords ***
Submit signup form
    [Arguments]    ${account}
    
    Get Text     css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name     ${account}[name]
    Fill Text    id=email    ${account}[email]
    Fill Text    id=cpf      ${account}[cpf]

    Take Screenshot

    Click        css=button >> text=Cadastrar

Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}            Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}

    Submit signup form    ${account}
    Notice should be      ${output_message}
    Take Screenshot