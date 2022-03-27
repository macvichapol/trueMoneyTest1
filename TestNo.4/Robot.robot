*** Settings ***
Library         SeleniumLibrary
Library         BuiltIn
Library         Collections
Library         RequestsLibrary
Resource        Keyword.robot
Resource        Variable.robot


*** Test Cases ***
Test Get user profile success
    Get user profile     ${CORRECT_URL}
    Verify user profile    ${ID_DATA}    ${EMAIL_DATA}    ${FIRSTNAME_DATA}    ${LASTNAME_DATA}    ${AVARTAR_DATA}