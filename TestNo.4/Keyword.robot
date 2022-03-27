*** Keywords ***
Get user profile
    [Arguments]    ${get_user_url}
    Create session    GetUserDetail    ${get_user_url}    verify=true
    ${get_user_detail}=    GET On Session    alias=GetUserDetail     url=${get_user_url}
    Should Be Equal As Strings    ${get_user_detail.status_code}    200
    ${get_user_detail_response}    Set Variable    ${get_user_detail.json()}
    log    ${get_user_detail_response}
    Set test variable    ${get_user_detail_response}

Verify user profile
    [Arguments]     ${id_user}
    ...             ${email_user}
    ...             ${firstname_user}
    ...             ${lastname_user}
    ...             ${avatar_user}
    Should Be Equal As Strings     ${get_user_detail_response['data']['id']}    ${id_user}
    Should Be Equal As Strings     ${get_user_detail_response['data']['email']}    ${email_user}
    Should Be Equal As Strings     ${get_user_detail_response['data']['first_name']}    ${firstname_user}
    Should Be Equal As Strings     ${get_user_detail_response['data']['last_name']}    ${lastname_user}
    Should Be Equal As Strings     ${get_user_detail_response['data']['avatar']}    ${avatar_user}