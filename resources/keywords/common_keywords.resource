*** Settings ***
Library      Browser
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

Fill Checkout Form With Default Values
    Fill Text    css=input[data-test="firstName"]     John
    Fill Text    css=input[data-test="lastName"]      Doe
    Fill Text    css=input[data-test="postalCode"]    12345