*** Settings ***
Documentation            Arquivo principal do projeto Robot

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
    New Browser          browser=firefox    headless=False
    New Page             http://localhost:3000

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