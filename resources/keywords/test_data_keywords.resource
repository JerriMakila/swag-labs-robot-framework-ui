*** Settings ***

Library    resources/libraries/csv_library.py
Library    resources/libraries/collection_utils.py

*** Variables ***

${filepath_to_datasources}    resources${/}datasources${/}
${hamburger_menu_csv}         hamburger_menu_items
${products_csv}               products
${sort_dropdown_items_csv}    sort_dropdown_items
${test_user_csv}              test_users

*** Keywords ***

Get Users
    @{users}=    Read Csv File    filepath=${filepath_to_datasources}    filename=${test_user_csv}
    RETURN    ${users}

Get User By Username
    [Arguments]    ${username}
    @{users}=    Get Users
    ${user}=     Find Dict By Key Value    ${users}    userid    ${username}
    RETURN    ${user}

Get Hamburger Menu Items
    @{hamburger_menu_items}=    Read Csv File    filepath=${filepath_to_datasources}    filename=${hamburger_menu_csv}
    RETURN    ${hamburger_menu_items}

Get Products
    @{products}=    Read Csv File    filepath=${filepath_to_datasources}    filename=${products_csv}
    RETURN    ${products}

Get Sort Dropdown Menu Items
    @{sort_dropdown_menu_items}=    Read Csv File    filepath=${filepath_to_datasources}    filename=${sort_dropdown_items_csv}
    RETURN    ${sort_dropdown_menu_items}