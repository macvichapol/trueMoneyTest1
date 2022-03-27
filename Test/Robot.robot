*** Settings ***
Library         SeleniumLibrary
Library         BuiltIn
Library         Collections
Resource        Keyword.robot
Resource        Variable.robot
Test Setup      Run Keywords
...             Open browser    AND
...             Verify Login page    ${TITLE_DATA}    ${DESCRIPTION_DATA}    ${USERNAME_DATA}    ${PASSWORD_DATA}    ${LOGIN_BUTTON_DATA}

*** Test Cases ***
Test login success 