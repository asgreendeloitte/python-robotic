*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

Resource     ${EXECDIR}/Resources/EnvLoginsHPEP.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot


# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource    ../../../Resources/ServiceCloud/HPEP/GlobalButtons.robot
Resource    ../../../Resources/ServiceCloud/HPEP/uploadData.robot
Resource    ../../../Resources/EnquiriesConsole/GlobalButtons.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

#Register Campaign members through a single inclusion criterion
#    [Tags]  DEP-131
#    Go To Salesforce login
#    Login as POC Test Agent
#    Close all mini tabs
#    Sleep    5s
#    Go To Accounts Tab
#    Create a new Account
#    Sleep   3s
#    ${name}=        Get Text      //lightning-formatted-name[@slot="primaryField"]
#    Sleep    3s
#    Close mini tab
#    Go to Campaigns Tab
#    Go to Test Campaign
#    Sleep    3s
#    Execute javascript   window.scrollTo(0,1000)
#    View all campaigns members
#    Sleep    3s
#    Page should contain     ${name}
#
#DEP HPT NOT updated on Campaign Member
#    [Tags]  DEP-532-529
#    Go To Salesforce login
#    Login as POC Test Agent
#    Go To Accounts Tab
#    Create a new Account
#    Sleep   3s
#    ${name}=        Get Text      //lightning-formatted-name[@slot="primaryField"]
#    Sleep    3s
#    Close mini tab
#    Sleep    2s
#    Go to Campaigns Tab
#    Go to Test Campaign
#    Sleep    3s
#    Execute javascript   window.scrollTo(0,1000)
#    View all campaigns members
#    Sleep    3s
#    Click Element     //a[@title="${name}"]
#    Click Element       //div[@title="Edit"]
#    Click Drop Down By Name       Status
#    Select Dropdown Option       Sent
#    Click Save
#    Sleep   4s
#    Click Element       //div/a[text()="${name}"]
#    Sleep   7s
#    Click Edit
#    Click Element       //label[contains(text(), 'HPT')]/ancestor::lightning-combobox/div
#    Click Element       //lightning-base-combobox-item/span/span[@title='London West']
#    Click Element       //button[@name='SaveEdit']
#    sleep       3s
#    Go Back
#    Sleep       5s
#    Page should not contain      London West
#
#DEP HPT updated on Campaign Member
#    [Tags]  DEP-531-529
#    Go To Salesforce login
#    Login as POC Test Agent
#    Close all mini tabs
#    Go To Accounts Tab
#    Create a new Account
#    Sleep   3s
#    ${name}=        Get Text      //lightning-formatted-name[@slot="primaryField"]
#    Sleep    5s
#    Close mini tab
#    Sleep    2s
#    Go to Campaigns Tab
#    Go to Test Campaign
#    Sleep    3s
#    Execute javascript   window.scrollTo(0,1000)
#    View all campaigns members
#    Sleep    3s
#    Click Element     //a[@title="${name}"]
#    Click Element       //div/a[text()="${name}"]
#    Sleep   7s
#    Click Edit
#    Click Element       //label[contains(text(), 'HPT')]/ancestor::lightning-combobox/div
#    Click Element       //lightning-base-combobox-item/span/span[@title='London West']
#    Click Element       //button[@name='SaveEdit']
#    sleep       3s
#    Go Back
#    Sleep       5s
#    Page should contain      London West
#
#
AIMS Feedback - Override Campaing Members Status
    [Tags]  DEP-803
    Go To Salesforce login
    Login as Campaign Manager
    Reset View (if applicable)
    Go to Campaigns Tab
    Go to AvianFlu2022 Campaign
    Capture Page Screenshot
    Sleep    3s
    Execute javascript   window.scrollTo(0,1000)
    View all campaigns members
    Capture Page Screenshot
    Sleep    3s
    Click Element     //a[contains(text(),"Pablo Test")]
    Capture Page Screenshot
    Page Should Contain Link     //a[@title="Override Campaign Status"]
    Page Should Contain Link     //a[@title="Edit"]
    Click on Override Campaign Status
    Change status to  Sent
    Sleep    2s
    Click quick actions
    Click Element    //a[@title="Campaign Member History"]
    Sleep    3s
    Capture Page Screenshot
    Page Should Contain    HPEP Campaign Member History
    Page Should Contain    Status
    Page Should Contain    Active
    Page Should Contain    Sent
    Page Should Contain    test

#AIMS Feedback - Override Monitoring Day
#    [Tags]  DEP-583
#    Go To Salesforce login
#    Login as Campaign Manager
#    Reset View (if applicable)
#    Go to Campaigns Tab
#    Go to AvianFlu2022 Campaign
#    Sleep    3s
#    Execute javascript   window.scrollTo(0,1000)
#    View all campaigns members
#    Sleep    3s
#    Click Element     //a[contains(text(),"Pablo Test")]
#    Capture Page Screenshot
#    Page Should Contain Link     //a[@title="Override Monitoring Day"]
#    Page Should Contain Link     //a[@title="Edit"]
#    Click on Override Campaign Status
#    Change status to  Referred
#    Sleep    2s
#    Click quick actions
#    Click Element    //a[@title="Campaign Member History"]
#    Sleep    3s
#    Capture Page Screenshot
#    Page Should Contain    HPEP Campaign Member History
#    Page Should Contain    Status
#    Page Should Contain    Active
#    Page Should Contain    Sent
#    Page Should Contain    test

DEP HPT updated on Campaign Member
    [Tags]  DEP-963-1008
    Go To Salesforce login
    Login as Campaign Manager
    Reset View (if applicable)
    Go To Accounts Tab
    Create a new Account asocciated to AvianFluAutumn2022
    Sleep   3s
    Click on Related tab
    Sleep   3s
    Click element   (//span[@title="Campaign Members"])[last()]
    Sleep   3s
    Capture Page Screenshot
    Page should contain     Campaign Members
    Page should contain     AvianFlu2022Autumn_SMS
    Close all mini tabs

#Addition a new field - HPT Zone field
#    [Tags]  DEP-995
#    Go To Salesforce login
#    Login as Campaign Manager
#    Reset View (if applicable)
#    Go To Accounts Tab
#    Create a new Account asocciated to AvianFluAutumn2022
#    Sleep    3s
#    Open the campaign member from the account layout
#    Page should contain     HPEP HPT Zone
#    Page should contain     South East London
#    Capture Page Screenshot
#    Close all mini tabs

Date of Final SMS Override layout button
    [Tags]  DEP-1195
    Go To Salesforce login
    Login as Campaign Manager
    Reset View (if applicable)
    Go to Campaigns Tab
    Go to AvianFlu2022 Campaign
    Capture Page Screenshot
    Sleep    3s
    Execute javascript   window.scrollTo(0,1000)
    View all campaigns members
    Sleep    3s
    Open campaign member
    Page Should Contain Link     //a[@title="Override Date of Final SMS"]
    Capture Page Screenshot
    Click on Override Date of Final SMS
    Date of final SMS       2 Dec 2022
    Sleep   3s
    Page should contain     2/12/2022
    Page should contain     ${override_reason}
    Capture Page Screenshot


AIMS Feedback - New value Removed From Campaign
    [Tags]  DEP-1145
    Go To Salesforce login
    Login as Campaign Manager
    Reset View (if applicable)
    Go to Campaigns Tab
    Go to AvianFlu2022 Campaign
    Capture Page Screenshot
    Sleep    3s
    Execute javascript   window.scrollTo(0,1000)
    View all campaigns members
    Capture Page Screenshot
    Sleep    3s
    Click Element     //a[contains(text(),"Pablo Test")]
    Click on Override Campaign Status
    Change status to  Removed from Campaign
    Sleep    2s
    Page should contain     Removed from Campaign
    Capture Page Screenshot
