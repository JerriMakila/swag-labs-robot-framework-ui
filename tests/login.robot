*** Settings ***
Library     Browser
Variables   resources/variables.py

Resource    resources/keywords/login_keywords.resource
Resource    resources/keywords/test_data_keywords.resource

Suite Setup       New Browser    browser=${BROWSER}    headless=${HEADLESS}
Suite Teardown    Close Browser

*** Variables ***

${standard_user}        standard_user
${non_existing_user}    non_existing_user
${wrong_password}       wrong_password
${default_password}     default_password
${locked_out_user}      locked_out_user

*** Test Cases ***

Login Page Should Have Correct Elements In Place
    [Tags]     01    02    03    04
    [Setup]    Open Login Page

    # 01
    Get Element States    css=.login_logo    contains    visible
    Get Text    css=.login_logo    ==    Swag Labs

    # 02
    Get Element States    css=.login_wrapper-inner >> css=#login_button_container >> css=.login-box
    ...                   contains    visible
    
    # 03
    Get Element States    css=.login-box >> css=#user-name
    ...                   contains    visible
    Get Element States    css=.login-box >> css=#password
    ...                   contains    visible
    Get Attribute         css=input[name="user-name"]    type    ==    text
    Get Attribute         css=input[name="password"]     type    ==    password

    # 04
    Get Element States    css=.login-box >> css=#login-button
    ...                   contains    visible
    Get Attribute         css=input[name="login-button"]    type    ==    submit

    [Teardown]    Close Context

Logging in with a standard user using correct username and password should succeed
    [Tags]     05

    VAR    ${username}    ${standard_user}
    &{user}=    Get User By Username    username=${username}
    Login    username=${user}[userid]    password=${user}[password]
    Get Text    css=.title    ==    Products

Logging in with non-existing username should show error message in error message container
    [Tags]     06

    VAR    ${username}    ${non_existing_user}
    VAR    ${password}    ${default_password}

    Login    username=${username}    password=${password}
    Get Element States    css=h3[data-test="error"]
    ...                   contains    visible
    Get Text              css=h3[data-test="error"]    ==    Epic sadface: Username and password do not match any user in this service
    
    [Teardown]    Close Context

Logging in with a standard user using correct username and incorrect password should show error message in error message container
    [Tags]     07

    VAR    ${username}    ${standard_user}
    VAR    ${password}    ${wrong_password}

    Login    username=${username}    password=${password}
    Get Element States    css=h3[data-test="error"]
    ...                   contains    visible
    Get Text              css=h3[data-test="error"]    ==    Epic sadface: Username and password do not match any user in this service

    [Teardown]    Close Context

Logging in without entering username should show error message in error message container
    [Tags]     08

    VAR    ${password}    ${default_password}

    Login    password=${password}
    Get Element States    css=h3[data-test="error"]
    ...                   contains    visible
    Get Text              css=h3[data-test="error"]    ==    Epic sadface: Username is required

Logging in without entering password should show error message in error message container
    [Tags]    09

    VAR    ${username}    ${standard_user}

    Login    username=${username}
    Get Element States    css=h3[data-test="error"]
    ...                   contains    visible
    Get Text              css=h3[data-test="error"]    ==    Epic sadface: Password is required

    [Teardown]    Close Context

Logging in without entering either username or password should show error message in error message container
    [Tags]    10

    Login
    Get Element States    css=h3[data-test="error"]
    ...                   contains    visible
    Get Text              css=h3[data-test="error"]    ==    Epic sadface: Username is required

    [Teardown]    Close Context

Logging in with a locked out user using correct username and password should not succeed
    [Tags]    11

    VAR    ${username}    locked_out_user
    &{user}=    Get User By Username    username=${username}
    Login    username=${user}[userid]    password=${user}[password]
    Get Element States    css=h3[data-test="error"]
    ...                   contains    visible
    Get Text              css=h3[data-test="error"]    ==    Epic sadface: Sorry, this user has been locked out.

    [Teardown]    Close Context