*** Settings ***
Library         SeleniumLibrary
Library         BuiltIn
Library         Collections
Resource        Keyword.robot
Resource        Variable.robot
Test Setup      Run Keywords
...             Open browser to test    AND
...             Verify Login page    ${TITLE_DATA}    ${DESCRIPTION_DATA}    ${USERNAME_DATA}    ${PASSWORD_DATA}    ${LOGIN_BUTTON_DATA}

*** Test Cases ***
Test login success
    Input username and password and login    ${USERNAME_INPUT_DATA}    ${PASSWORD_INPUT_DATA}
    Verify page after login success    ${TEXT_ALERT_LOGIN_SUCCESS}    ${TITLE_LOGIN_SUCCESS_PAGE}    ${DESCRIPTION_LOGIN_SUCCESS_PAGE}    ${LOGOUT_BUTTON_DATA}
    Logout success     ${TEXT_ALERT_LOGOUT_SUCCESS}
    Verify Login page    ${TITLE_DATA}    ${DESCRIPTION_DATA}    ${USERNAME_DATA}    ${PASSWORD_DATA}    ${LOGIN_BUTTON_DATA}