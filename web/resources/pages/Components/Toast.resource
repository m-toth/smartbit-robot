*** Settings ***
Documentation   Ações e elementos do componente Toast

Library    Browser

*** Keywords ***
Toast should be
    [Arguments]                ${expected_message}

    ${selector}    Set Variable    .Toastify__toast-body

    Wait For Elements State    css=${selector}
    ...     visible    5
    
    Get Text                   css=${selector}
    ...     equal
    ...     ${expected_message}
    
    Take Screenshot    selector=${selector}