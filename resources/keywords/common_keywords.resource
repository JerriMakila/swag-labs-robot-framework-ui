*** Settings ***
Resource     resources/keywords/test_data_keywords.resource

*** Keywords ***

Setup User As Suite Variable
    [Arguments]    ${username}

    &{user}=    Get User By Username    ${username}
    Set Suite Variable    ${USER}    ${user}