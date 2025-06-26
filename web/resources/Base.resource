*** Settings ***
Documentation            Arquivo principal do projeto Robot

Variables                Env.py

Library                  JSONLibrary

Library                  Browser
Library                  ../../libs/Account.py
Library                  ../../libs/Database.py

Resource                 pages/Components/Navbar.resource
Resource                 pages/Components/Toast.resource
Resource                 pages/Components/BoxNotice.resource
Resource                 pages/Components/Modal.resource

Resource                 pages/Landing.resource
Resource                 pages/Welcome.resource
Resource                 pages/Login.resource
Resource                 pages/Accounts.resource
Resource                 pages/Memberships.resource

*** Variables ***
${ADMIN_EMAIL}           sac@smartbit.com
${ADMIN_PASSWORD}        pwd123

*** Keywords ***
Start session
    New Browser          browser=${BROWSER}    headless=${HEADLESS}
    New Page             ${BASE_URL}

#Helpers
Get JSON fixture
    [Arguments]          ${file_name}    ${scenario}
    
        ${data}          Load Json From File    ${EXECDIR}/resources/fixtures/${file_name}.json    encoding=UTF-8

        RETURN           ${data}[${scenario}]

Signin admin
    [Arguments]          ${email}    ${password}
    
    Go to login page
    Submit login form    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    User is logged in    ${ADMIN_EMAIL}