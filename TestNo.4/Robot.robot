*** Settings ***
Library         BuiltIn
Library         RequestsLibrary
Resource        Keyword.robot
Resource        Variable.robot


*** Test Cases ***
Test Get user profile success
    Get user profile success     ${CORRECT_URL}
    Verify user profile    ${ID_DATA}    ${EMAIL_DATA}    ${FIRSTNAME_DATA}    ${LASTNAME_DATA}    ${AVARTAR_DATA}

Test Get user profile but user not found
    Get user profile fail    ${INCORRECT_URL}