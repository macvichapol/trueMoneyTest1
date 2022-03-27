*** Keywords ***
Open browser 
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