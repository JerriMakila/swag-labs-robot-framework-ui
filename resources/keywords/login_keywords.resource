*** Settings ***
Library      Browser
Variables    resources/variables.py

*** Keywords ***

Open Login Page
    New Context    viewport={'width':1920, 'height': 1080}
    New Page       ${login_url}

Login
    [Arguments]    ${username}=${EMPTY}    ${password}=${EMPTY}
    
    Open Login Page
    Fill Text    css=input[name="user-name"]    ${username}
    Fill Text    css=input[name="password"]     ${password}
    Click        css=#login-button