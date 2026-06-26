*** Settings ***
Library      Browser

*** Keywords ***

Open Login Page
    New Context    viewport={'width':1920, 'height': 1080}
    New Page       ${LOGIN_URL}

Login
    [Arguments]    ${username}=${EMPTY}    ${password}=${EMPTY}
    
    Open Login Page
    Fill Text    css=input[name="user-name"]    ${username}
    Fill Text    css=input[name="password"]     ${password}
    Click        css=#login-button