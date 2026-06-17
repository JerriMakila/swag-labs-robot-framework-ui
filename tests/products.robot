*** Settings ***
Library     Browser
Variables   resources/variables.py

Resource    resources/keywords/common_keywords.resource
Resource    resources/keywords/login_keywords.resource

Suite Setup       Run Keywords    Setup User As Suite Variable    ${test_user}    AND
...               New Browser     browser=${BROWSER}    headless=${HEADLESS}
Suite Teardown    Close Browser

*** Variables ***

${test_user}    standard_user
${USER}         ${NONE}

*** Test Cases ***

Product Page Header Should Have Correct Elements In Place
    [Tags]     12    13    14
    [Setup]    Login    username=${USER}[userid]    password=${USER}[password]

    # 12
    Get Element States    css=.header_secondary_container >> css=.title    contains    visible
    
    # 13
    Get Text    css=.header_secondary_container >> css=.title    ==    Products

    # 14
    Get Element States    css=select[data-test="product-sort-container"]    contains    visible

    [Teardown]    Close Context