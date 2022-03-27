*** Keywords ***
Open browser to test
    Open browser    http://the-internet.herokuapp.com/login     chrome

Verify Login page
    [Arguments]    ${Title_login_page}
    ...            ${Description_login_page}
    ...            ${Input_username_text}
    ...            ${Input_password_text}
    ...            ${Login_button_text}
    ${Title}    Get text    //*[@id="content"]/div/h2
    ${Description}    Get text    //*[@id="content"]/div/h4
    ${Input_username}    Get text    //*[@id="login"]/div[1]/div/label
    ${Input_password}    Get text    //*[@id="login"]/div[2]/div/label
    ${Login_button}    Get text     //*[@id="login"]/button/i
    Should Be Equal As Strings    ${Title}    ${Title_login_page}
    Should Be Equal As Strings    ${Description}    ${Description_login_page}
    Should Be Equal As Strings    ${Input_username}    ${Input_username_text}
    Should Be Equal As Strings    ${Input_password}    ${Input_password_text}
    Should Be Equal As Strings    ${Login_button}    ${Login_button_text}
    Element Should Be Visible    xpath=//*[@id="username"]
    Element Should Be Visible    xpath=//*[@id="password"]

Input username and password and login
    [Arguments]    ${Username_input_data}
    ...            ${Password_input_data}
    Input Text    xpath=//*[@id="username"]    ${Username_input_data}
    Input Text    xpath=//*[@id="password"]    ${Password_input_data}
    Click Element    xpath=//*[@id="login"]/button/i

Verify page after login success
    [Arguments]    ${Text_alert_login_success}
    ...            ${Title_login_success_page}
    ...            ${Description_login_success_page}
    ...            ${Logout_button_text}
    Element Should Be Visible    xpath=//*[@id="flash"]
    ${Text_alert}    Get text    //*[@id="flash"]
    ${Title}    Get text    //*[@id="content"]/div/h2
    ${Description}    Get text    //*[@id="content"]/div/h4
    ${Logout_button}    Get text    //*[@id="content"]/div/a
    Should contain    ${Text_alert}    ${Text_alert_login_success}
    Should Be Equal As Strings    ${Title}    ${Title_login_success_page}
    Should Be Equal As Strings    ${Description}    ${Description_login_success_page}
    Should Be Equal As Strings    ${Logout_button}    ${Logout_button_text}

Logout success
    [Arguments]    ${Text_alert_logout_success}
    Click Element    xpath=//*[@id="content"]/div/a/i
    ${Text_alert}    Get text    //*[@id="flash"]
    Should contain    ${Text_alert}    ${Text_alert_logout_success}

Verify Login failed - Password incorrect
    [Arguments]    ${Text_alert_password_incorrect}
    ${Text_alert}    Get text    //*[@id="flash"]
    Should contain    ${Text_alert}    ${Text_alert_password_incorrect}

Verify Login failed - Username not found
    [Arguments]    ${Text_alert_username_not_found}
    ${Text_alert}    Get text    //*[@id="flash"]
    Should contain    ${Text_alert}    ${Text_alert_username_not_found}


