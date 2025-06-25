*** Settings ***
Documentation    Teste para verificar o Slogan da Smartbit na WebApp

Library          Browser
Resource         ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve exibir o Slogan na Landing Page
    Get Text     css=.headline h2    equal    Sua Jornada Fitness Começa aqui!