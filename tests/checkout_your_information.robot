*** Settings ***
Library     Browser
Library     Collections
Variables   resources/variables.py

Resource    resources/keywords/test_data_keywords.resource
Resource    resources/keywords/common_keywords.resource
Resource    resources/keywords/login_keywords.resource

Suite Setup       Run Keywords    Setup User As Suite Variable    ${test_user}    AND
...               New Browser     browser=${BROWSER}    headless=${HEADLESS}
Suite Teardown    Close Browser

*** Variables ***

${test_user}    standard_user
${USER}         ${NONE}

*** Test Cases ***

Your Information Page Should Have Correct Elements In Place
    [Tags]     48    49    50
    [Setup]    Run Keywords    Login    username=${USER}[userid]    password=${USER}[password]    AND
    ...        Open Checkout Your Information
    
    # 48
    Get Element States    css=.header_secondary_container >> css=span[data-test="title"]    contains    visible
    Get Text              css=.header_secondary_container >> css=span[data-test="title"]    ==    Checkout: Your Information

    # 49
    Get Element States    css=.checkout_info >> input[data-test="firstName"]     contains    visible
    Get Attribute         css=.checkout_info >> input[data-test="firstName"]     type    ==    text
    Get Element States    css=.checkout_info >> input[data-test="lastName"]      contains    visible
    Get Attribute         css=.checkout_info >> input[data-test="lastName"]      type    ==    text
    Get Element States    css=.checkout_info >> input[data-test="postalCode"]    contains    visible
    Get Attribute         css=.checkout_info >> input[data-test="postalCode"]    type    ==    text

    # 50
    Get Element States    css=div[data-test="checkout-info-container"] >> .checkout_buttons >> button[data-test="cancel"]     contains    visible
    Get Element States    css=div[data-test="checkout-info-container"] >> .checkout_buttons >> input[data-test="continue"]    contains    visible
    Get Attribute         css=div[data-test="checkout-info-container"] >> .checkout_buttons >> input[data-test="continue"]    type    ==    submit

    [Teardown]    Close Context

Pressing 'Cancel' button in information form should open cart page
    [Tags]     51
    [Setup]    Run Keywords    Login    username=${USER}[userid]    password=${USER}[password]    AND
    ...        Open Checkout Your Information

    ${cancel_button}=    Get Element    css=div[data-test="checkout-info-container"] >> .checkout_buttons >> button[data-test="cancel"]
    Click    ${cancel_button}
    Get Text    css=.header_secondary_container >> css=span[data-test="title"]    ==    Your Cart

    [Teardown]    Close Context

Pressing 'Continue' button in information form should open Checkout - Overview page if every text field in information form is filled
    [Tags]     52
    [Setup]    Run Keywords    Login    username=${USER}[userid]    password=${USER}[password]    AND
    ...        Open Checkout Your Information

    Fill Checkout Form With Default Values And Continue
    Get Text    css=.header_secondary_container >> css=span[data-test="title"]    ==    Checkout: Overview

    [Teardown]    Close Context

Pressing 'Continue' in information form when First Name field is empty should show error icon and error message
    [Tags]     53
    [Setup]    Run Keywords    Login    username=${USER}[userid]    password=${USER}[password]    AND
    ...        Open Checkout Your Information

    Fill Text    css=input[data-test="lastName"]      Doe
    Fill Text    css=input[data-test="postalCode"]    12345
    Click        css=div[data-test="checkout-info-container"] >> .checkout_buttons >> input[data-test="continue"]

    Get Element States    css=div[data-test="checkout-info-container"] >> .error-message-container >> h3[data-test="error"]    contains    visible
    Get Text              css=.error-message-container >> h3[data-test="error"]    ==    Error: First Name is required

    [Teardown]    Close Context

Pressing 'Continue' in information form when Last Name field is empty should show error icon and error message
    [Tags]     54
    [Setup]    Run Keywords    Login    username=${USER}[userid]    password=${USER}[password]    AND
    ...        Open Checkout Your Information

    Fill Text    css=input[data-test="firstName"]     John
    Fill Text    css=input[data-test="postalCode"]    12345
    Click        css=div[data-test="checkout-info-container"] >> .checkout_buttons >> input[data-test="continue"]

    Get Element States    css=div[data-test="checkout-info-container"] >> .error-message-container >> h3[data-test="error"]    contains    visible
    Get Text              css=.error-message-container >> h3[data-test="error"]    ==    Error: Last Name is required

    [Teardown]    Close Context

Pressing 'Continue' in information form when Zip/Postal Code field is empty should show error icon and error message
    [Tags]     55
    [Setup]    Run Keywords    Login    username=${USER}[userid]    password=${USER}[password]    AND
    ...        Open Checkout Your Information

    Fill Text    css=input[data-test="firstName"]    John
    Fill Text    css=input[data-test="lastName"]     Doe
    Click        css=div[data-test="checkout-info-container"] >> .checkout_buttons >> input[data-test="continue"]

    Get Element States    css=div[data-test="checkout-info-container"] >> .error-message-container >> h3[data-test="error"]    contains    visible
    Get Text              css=.error-message-container >> h3[data-test="error"]    ==    Error: Postal Code is required

    [Teardown]    Close Context

Pressing 'Continue' in information form when all text fields are empty should show error icon and error message
    [Tags]     56    57
    [Setup]    Run Keywords    Login    username=${USER}[userid]    password=${USER}[password]    AND
    ...        Open Checkout Your Information

    Click    css=div[data-test="checkout-info-container"] >> .checkout_buttons >> input[data-test="continue"]

    # 56
    Get Element States    css=div[data-test="checkout-info-container"] >> .error-message-container >> h3[data-test="error"]    contains    visible
    Get Text              css=.error-message-container >> h3[data-test="error"]    ==    Error: First Name is required

    # 57
    ${error_button}=    Get Element    .error-message-container >> button[data-test="error-button"]
    Click    ${error_button}
    Get Element States    css=div[data-test="checkout-info-container"] >> .error-message-container >> h3[data-test="error"]    contains    detached

    [Teardown]    Close Context

*** Keywords ***

Open Checkout Your Information
    Add Item To Cart
    Open Cart Page
    ${checkout_button}=    Get Element    css=div.cart_footer >> button[data-test="checkout"]
    Click    ${checkout_button}
