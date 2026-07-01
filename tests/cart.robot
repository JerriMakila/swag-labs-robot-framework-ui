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

Cart Page Header Should Have Correct Elements In Place
    [Tags]     32    33    34    41    42
    [Setup]    Run Keywords    Login    username=${USER}[userid]    password=${USER}[password]    AND
    ...        Open Cart Page

    # 32
    Get Element States    css=.header_secondary_container >> css=span[data-test="title"]    contains    visible
    Get Text              css=.header_secondary_container >> css=span[data-test="title"]    ==    Your Cart

    # 33
    Get Element States    css=div[data-test="cart-list"]    contains    visible

    # 34
    Get Element States    css=div[data-test="cart-list"] > div[data-test="cart-quantity-label"]    contains    visible
    Get Element States    css=div[data-test="cart-list"] > div[data-test="cart-desc-label"]        contains    visible
    Get Element States    css=div[data-test="cart-list"] > div[data-test="inventory-item"]         contains    detached

    # 41
    Get Element States    css=div.cart_footer    contains    visible
    
    # 42
    Get Element States    css=div.cart_footer > button[data-test="continue-shopping"]    contains    visible
    Get Element States    css=div.cart_footer > button[data-test="checkout"]             contains    visible

    [Teardown]    Close Context

If cart has items, cart list should contain a list item for every added product
    [Tags]     35    36    37
    [Setup]    Login    username=${USER}[userid]    password=${USER}[password]

    ${inventory_item_1}=    Get Element    css=.inventory_item >> nth=0
    ${inventory_item_2}=    Get Element    css=.inventory_item >> nth=1
    Click    ${inventory_item_1} >> button.btn_inventory
    Click    ${inventory_item_2} >> button.btn_inventory
    @{inventory_item_list}=    Create List    ${inventory_item_1}    ${inventory_item_2}
    @{inventory_item_list}=    Get Dict List Of Inventory Items      ${inventory_item_list}
    
    Open Cart Page
    @{cart_item_list}=    Get Elements    css=div[data-test="cart-list"] >> div[data-test="inventory-item"]
    Lists Should Be Equal In Length    ${inventory_item_list}    ${cart_item_list}
    
    FOR    ${cart_item}    IN    @{cart_item_list}
        ${cart_item_name}=    Get Text    ${cart_item} >> div[data-test="inventory-item-name"]
        ${inventory_item}=    Find Dict By Key Value    data=${inventory_item_list}    key=name    value=${cart_item_name}
        Get Text    ${cart_item} >> div[data-test="inventory-item-desc"]     ==    ${inventory_item}[description]
        Get Text    ${cart_item} >> div[data-test="inventory-item-price"]    ==    ${inventory_item}[price]
    END

    [Teardown]    Clear Cart

Pressing 'Remove' button in a cart item should remove the cart item from the cart
    [Tags]     38    39
    [Setup]    Login    username=${USER}[userid]    password=${USER}[password]

    Click    css=.inventory_item >> nth=0 >> button.btn_inventory
    Click    css=.inventory_item >> nth=1 >> button.btn_inventory
    
    Open Cart Page
    ${cart_item_list_count}=    Get Element Count    css=div[data-test="cart-list"] >> div[data-test="inventory-item"]
    
    FOR    ${index}    IN RANGE    ${cart_item_list_count}
        ${first_cart_item_name}=    Get Text    div[data-test="inventory-item-name"] >> nth=0
        Click    button.cart_button >> nth=0
        Get Element States    text="${first_cart_item_name}"    contains    detached
    END

    Get Element Count    css=div[data-test="cart-list"] >> div[data-test="inventory-item"]    ==    0

    [Teardown]    Clear Cart

If cart has more than one item, removing one item should not remove other items
    [Tags]    40
    [Setup]    Login    username=${USER}[userid]    password=${USER}[password]

    Click    css=.inventory_item >> nth=0 >> button.btn_inventory
    Click    css=.inventory_item >> nth=1 >> button.btn_inventory
    Click    css=.inventory_item >> nth=2 >> button.btn_inventory
    
    Open Cart Page
    ${cart_item_2_name}=    Get Text    div[data-test="inventory-item-name"] >> nth=1
    ${cart_item_3_name}=    Get Text    div[data-test="inventory-item-name"] >> nth=2

    Click    button.cart_button >> nth=0
    Get Element States    text="${cart_item_2_name}"    contains    visible
    Get Element States    text="${cart_item_3_name}"    contains    visible

    [Teardown]    Clear Cart

Pressing 'Continue Shopping' button in cart footer should open Products page
    [Tags]    43
    [Setup]    Login    username=${USER}[userid]    password=${USER}[password]

    Open Cart Page
    Click    css=div.cart_footer >> button[data-test="continue-shopping"]
    Get Text    css=span[data-test="title"]    ==    Products

Pressing 'Checkout' button in cart footer should open Checkout: Your Information page if cart has items
    [Tags]    44
    [Setup]    Login    username=${USER}[userid]    password=${USER}[password]

    Click    css=.inventory_item >> nth=0 >> button.btn_inventory
    Open Cart Page
    Click    css=div.cart_footer >> button[data-test="checkout"]
    Get Text    css=span[data-test="title"]    ==    Checkout: Your Information

    [Teardown]    Clear Cart

Pressing 'Checkout' button in cart footer should not open Checkout: Your Information page if cart is empty
    [Tags]    45    OPEN_BUG
    [Setup]    Login    username=${USER}[userid]    password=${USER}[password]
    
    Open Cart Page
    Click    css=div.cart_footer >> button[data-test="checkout"]
    Get Text    css=span[data-test="title"]    ==    Your Cart

*** Keywords ***

Open Cart Page
    Click    css=a[data-test="shopping-cart-link"]

Get Dict List Of Inventory Items
    [Arguments]    ${inventory_item_elements}

    @{inventory_item_dictionaries}=    Create List
    FOR    ${inventory_item_element}    IN    @{inventory_item_elements}
        ${inventory_item_name}=     Get Text    ${inventory_item_element} >> div[data-test="inventory-item-name"]
        ${inventory_item_desc}=     Get Text    ${inventory_item_element} >> div[data-test="inventory-item-desc"]
        ${inventory_item_price}=    Get Text    ${inventory_item_element} >> div[data-test="inventory-item-price"]
        &{inventory_item_dictionary}=    Create Dictionary
        ...    name=${inventory_item_name}
        ...    description=${inventory_item_desc}
        ...    price=${inventory_item_price}
        Append To List    ${inventory_item_dictionaries}    ${inventory_item_dictionary}
    END

    RETURN    ${inventory_item_dictionaries}
    
Clear Cart
    Go To    ${CART_URL}
    ${cart_item_list_count}=    Get Element Count    css=div[data-test="cart-list"] >> div[data-test="inventory-item"]
    

    FOR    ${index}    IN RANGE    ${cart_item_list_count}
        Click    button.cart_button >> nth=0
    END