*** Variables ***
#Close variables
${chevron-svg}                                  xpath://button[@class='slds-button slds-button_icon-container slds-button_icon-x-small']
${close-tab-btn}                                xpath://li[@title='Close Tab']
${close-btn}                                    xpath://button[@class='slds-button slds-button_icon slds-button_icon-x-small slds-button_icon-container']
${objSuccessMsg}                                xpath://div[contains(@class, 'slds-theme--success')]
${DHSCLogo}                                     xpath://div[@class='viewport']
${tabBarItems}                                  xpath://ul[contains(@class, 'tabBarItems')]
${ConfirmCloseTabDlg}                           xpath://h2[@id='modal-heading-01']
${CloseAllTabButton}                            xpath://*[contains(@class, 'slds-button_brand')]





*** Keywords ***
End Test
    Close Tab
    sleep   2s
    Logout of Salesforce
    Wait Until Page Contains    Forgot Your Password?
    Close Browser



End Test1
    Close tabs JS
    sleep   2s
    Logout of Salesforce
    #Wait Until Page Contains    Forgot Your Password?
    Close Browser



Close tabs JS
    [Documentation]     This function should be called as a part of test teardown only, please know this is using JS
    ${OpenTabVisible} =     get element count    ${tabBarItems}
    ${OpenTabVisible}=    Evaluate    ${OpenTabVisible} - 1

     Run Keyword If  '${OpenTabVisible}' =='0'
         ...   log to console    NO TABS TO CLOSE
         ...   ELSE
         ...   Log to console    ${OpenTabVisible} TABS CLOSED

    ${index}=    Set Variable    0

    FOR    ${index}   IN RANGE   ${OpenTabVisible}
        execute javascript      document.querySelectorAll('.slds-button_icon-x-small')[1].click();
        ${index}=    Evaluate    ${index} + 1
    END
