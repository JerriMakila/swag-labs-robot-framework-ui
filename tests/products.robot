*** Settings ***
Library     Browser
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

Dropdown menu for sorting options should have correct items
    [Tags]     15
    [Setup]    Login    username=${USER}[userid]    password=${USER}[password]

    @{actual_sorting_options}=      Get Select Options    css=select[data-test="product-sort-container"]
    @{expected_sorting_options}=    Get Sort Dropdown Menu Items

    FOR    ${actual_sorting_option}    IN    @{actual_sorting_options}
        ${expected_sorting_option}=    Find Dict By Key Value    data=${expected_sorting_options}    key=value    value=${actual_sorting_option}[value]
        Should Be Equal As Strings   ${actual_sorting_option}[label]    ${expected_sorting_option}[item]
    END
    
    [Teardown]    Close Context

Product page should have inventory container with correct inventory items
    [Tags]     16    17    18    19    20    21    22    23
    [Setup]    Login    username=${USER}[userid]    password=${USER}[password]

    # 16
    Get Element States    css=#inventory_container > div[data-test="inventory-list"]    contains    visible

    # 17
    @{expected_inventory_items}      Get Products
    @{actual_inventory_items}=       Get Elements    css=.inventory_list > .inventory_item
    ${are_lists_equal_in_length}=    Are Lists Equal In Length    ${expected_inventory_items}    ${actual_inventory_items}
    Should Be True    ${are_lists_equal_in_length}

    # 18 19 20 21 22
    FOR    ${actual_inventory_item}    IN    @{actual_inventory_items}
        Get Element States    ${actual_inventory_item}    contains    visible
        Get Element States    ${actual_inventory_item} >> css=div[data-test="inventory-item-name"]    contains    visible
        ${actual_inventory_item_name}=    Get Text    ${actual_inventory_item} >> css=div[data-test="inventory-item-name"]
        ${expected_inventory_item}=       Find Dict By Key Value    data=${expected_inventory_items}    key=name    value=${actual_inventory_item_name}
    END
    