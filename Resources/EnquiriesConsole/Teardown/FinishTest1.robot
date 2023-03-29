*** Keywords ***
End Test
    Close Tab
    sleep   2s
    Logout of Salesforce
    Wait Until Page Contains    Forgot Your Password?
    Close Browser