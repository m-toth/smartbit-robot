*** Settings ***
Documentation        Ações e elementos do menu de navegação

Library              AppiumLibrary

*** Keywords ***
Touch My Body
    Click Element    xpath=//android.widget.TextView[@text="Meu corpo"]

Touch My Account
    Click Element    xpath=//android.widget.TextView[@text="Minha conta"]