*** Settings ***
Library      Browser
Library      Collections
Resource     resources/keywords/test_data_keywords.resource

*** Keywords ***

Setup User As Suite Variable
    [Arguments]    ${username}

    &{user}=    Get User By Username    ${username}
    Set Suite Variable    ${USER}    ${user}

Lists Should Be Equal In Length
    [Arguments]    ${list1}    ${list2}

    ${list1_length}=    Get Length    ${list1}
    ${list2_length}=    Get Length    ${list2}
    Should Be Equal As Integers    ${list1_length}    ${list2_length}

Add Item To Cart
    ${add_to_cart_button}=    Get Element    css=.btn_inventory >> nth=0
    Click    ${add_to_cart_button}

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

Fill Checkout Form With Default Values And Continue
    Fill Text    css=input[data-test="firstName"]     John
    Fill Text    css=input[data-test="lastName"]      Doe
    Fill Text    css=input[data-test="postalCode"]    12345
    Click        css=div[data-test="checkout-info-container"] >> .checkout_buttons >> input[data-test="continue"]

Open Cart Page
    Click    css=a[data-test="shopping-cart-link"]