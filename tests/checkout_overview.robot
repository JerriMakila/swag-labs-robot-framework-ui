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
    [Tags]     58    59    60    63    67
    [Setup]    Run Keywords    Login    username=${USER}[userid]    password=${USER}[password]    AND
    ...        Open Checkout Overview
    
    # 58
    Get Element States    css=.header_secondary_container >> span[data-test="title"]    contains    visible
    Get Text              css=.header_secondary_container >> span[data-test="title"]    ==    Checkout: Overview

    # 59
    Get Element States    css=div[data-test="cart-list"]    contains    visible

    # 60
    Get Element States    css=div[data-test="cart-list"] >> div[data-test="cart-quantity-label"]    contains    visible
    Get Element States    css=div[data-test="cart-list"] >> div[data-test="cart-desc-label"]        contains    visible
    Get Text    css=div[data-test="cart-list"] >> div[data-test="cart-quantity-label"]    ==    QTY
    Get Text    css=div[data-test="cart-list"] >> div[data-test="cart-desc-label"]        ==    Description
    
    # 63
    Get Element States    css=.summary_info >> div[data-test="payment-info-label"]     contains    visible
    Get Element States    css=.summary_info >> div[data-test="payment-info-value"]     contains    visible
    Get Element States    css=.summary_info >> div[data-test="shipping-info-label"]    contains    visible
    Get Element States    css=.summary_info >> div[data-test="shipping-info-value"]    contains    visible
    Get Element States    css=.summary_info >> div[data-test="total-info-label"]       contains    visible
    Get Text    css=.summary_info >> div[data-test="payment-info-label"]     ==    Payment Information:
    Get Text    css=.summary_info >> div[data-test="shipping-info-label"]    ==    Shipping Information:
    Get Text    css=.summary_info >> div[data-test="total-info-label"]       ==    Price Total

    # 67
    Get Element States    css=.cart_footer >> button[data-test="cancel"]    contains    visible
    Get Element States    css=.cart_footer >> button[data-test="finish"]    contains    visible
    Get Text    css=.cart_footer >> button[data-test="cancel"]    ==    Cancel
    Get Text    css=.cart_footer >> button[data-test="finish"]    ==    Finish

    [Teardown]    Close Context

Product info in list items should be identical to the product info in Products page
    [Tags]     61    62    64
    [Setup]    Login    username=${USER}[userid]    password=${USER}[password]

    ${inventory_item_1}=    Get Element    css=.inventory_item >> nth=0
    ${inventory_item_2}=    Get Element    css=.inventory_item >> nth=1
    Click    ${inventory_item_1} >> button.btn_inventory
    Click    ${inventory_item_2} >> button.btn_inventory
    @{inventory_item_list}=    Create List    ${inventory_item_1}    ${inventory_item_2}
    @{inventory_item_list}=    Get Dict List Of Inventory Items      ${inventory_item_list}

    Open Cart Page
    Click    css=div.cart_footer >> button[data-test="checkout"]
    Fill Checkout Form With Default Values And Continue

    @{cart_item_list}=    Get Elements    css=div[data-test="cart-list"] >> div[data-test="inventory-item"]
    Lists Should Be Equal In Length    ${inventory_item_list}    ${cart_item_list}

    FOR    ${cart_item}    IN    @{cart_item_list}
        # 61
        ${cart_item_name}=    Get Text    ${cart_item} >> div[data-test="inventory-item-name"]
        ${inventory_item}=    Find Dict By Key Value    data=${inventory_item_list}    key=name    value=${cart_item_name}
        Get Text    ${cart_item} >> div[data-test="inventory-item-desc"]     ==    ${inventory_item}[description]
        Get Text    ${cart_item} >> div[data-test="inventory-item-price"]    ==    ${inventory_item}[price]
        # 62
        Get Text    ${cart_item} >> div[data-test="item-quantity"]           ==    1
    END

    # 64

    # 65

    # 66

    

*** Keywords ***

Open Checkout Overview
    Add Item To Cart
    Open Cart Page
    Click    css=div.cart_footer >> button[data-test="checkout"]
    Fill Checkout Form With Default Values And Continue
