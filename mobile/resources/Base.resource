*** Settings ***
Documentation    Arquivo principal do projeto de testes automatizados para Mobile

Library                         AppiumLibrary
Library                         JSONLibrary

Library                         ../../libs/Database.py

Resource                        ../../services/Service.resource

Resource                        ./actions/Account.resource
Resource                        ./actions/Login.resource
Resource                        ./actions/MyBody.resource
Resource                        ./actions/Components/Menu.resource
Resource                        ./actions/Components/Popup.resource

*** Keywords ***
Start session
    Open Application            http://localhost:4723    
    ...                         platformName=Android
    ...                         deviceName=Pastel
    ...                         automationName=UiAutomator2
    ...                         udid=JCAXB601L5389BZ
    ...                         app=${EXECDIR}/app/smartbit-beta.apk
    ...                         autoGrantPermissions=true
    
    Wait Until Page Contains    IP da API    10

Finish session
    Capture Page Screenshot    
    Close Application

Get JSON fixture
    [Arguments]                 ${scenario}
    
        ${data}                 Load Json From File    ${EXECDIR}/resources/fixtures/data.json    encoding=UTF-8

        RETURN                  ${data}[${scenario}]
