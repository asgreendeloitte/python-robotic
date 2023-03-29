*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library    DateTime

Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource    ../../../Resources/EnquiriesConsole/GlobalButtons.robot
Resource    ../../../Resources/HPEP/HPEP/GlobalButtons.robot
Resource    ../../../Resources/HPEP/HPEP/uploadData.robot
Resource    ../../../Resources/HPEP/HPEP/DepCampaingLogsCreation.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

New 'On Hold - No Response' and 'Completed - No Response' Statuses
    [Tags]  DEP-1268
    Go To Salesforce login
    Login as Admin Agent
    Reset View (if applicable)
    Go to Campaigns Tab
    Go to AvianFlu2022 Campaign
    Execute javascript   window.scrollTo(0,1000)
    View all campaigns members
    Sleep    3s
    Click Element     //a[contains(text(),"Pablo Test")]
    Click on Override Campaign Status
    Change status to  Completed - No Response
    Page Should Contain    Completed - No Response
    Click on Override Campaign Status
    Change status to  On Hold - No Response
    Page Should Contain    On Hold - No Response

New 'On Hold - No Response' and 'Completed - No Response' Statuses - 1
    [Tags]  DEP-1268
    Go To Salesforce login
    Login as Admin Agent
    Reset View (if applicable)
    Go to Campaigns Tab
    Go to AvianFlu2022 Campaign
    Execute javascript   window.scrollTo(0,1000)
    View all campaigns members
    Sleep    3s
    Click Element     //a[contains(text(),"Pablo Test")]
    Click on Override Campaign Status
    Change status to  On Hold - No Response
    Page Should Contain    On Hold - No Response
#    Click on Override Date of Final SMS
#    Date of final SMS       18 Jan 2023
#    Sleep   3s
#    Page should contain     18/1/2023
    Click Edit1
    Select Checkbox By Name - DEP     HPEP Synchronise to Marketing Cloud
    Click Save (bug fix)
    Sleep    4s
    Capture Page Screenshot
    Execute the flow
    Sleep    7s
    Capture Page Screenshot
    Go to AvianFlu2022 Campaign
    Execute javascript   window.scrollTo(0,1000)
    View all campaigns members
    Sleep    3s
    Click Element     //a[contains(text(),"Pablo Test")]
    Capture Page Screenshot
    Page Should Contain    Completed - No Response
    Page Should Not Contain Checkbox    //span[text()='HPEP Synchronise to Marketing Cloud']/following::div[1]//span[@class="uiImage uiOutputCheckbox"]

    Scroll Element Into View    (//div[@title='Edit'])[1]
    Click Edit1
    Select Checkbox By Name - DEP     HPEP Synchronise to Marketing Cloud
    Click Save (bug fix)
    Sleep    4s
    Capture Page Screenshot
    Execute the flow
    Sleep    7s
    Capture Page Screenshot
    Go to AvianFlu2022 Campaign
    Execute javascript   window.scrollTo(0,1000)
    View all campaigns members
    Sleep    3s
    Click Element     //a[contains(text(),"Pablo Test")]
    Capture Page Screenshot
    Page Should Contain    Completed - No Response
    Page Should Not Contain Checkbox    //span[text()='HPEP Synchronise to Marketing Cloud']/following::div[1]//span[@class="uiImage uiOutputCheckbox"]


New 'On Hold - No Response' and 'Completed - No Response' Statuses - 2
    [Tags]  DEP-1268
    Go To Salesforce login
    Login as Admin Agent
    Reset View (if applicable)
    Go to Campaigns Tab
    Go to AvianFlu2022 Campaign
    Execute javascript   window.scrollTo(0,1000)
    View all campaigns members
    Sleep    3s
    Click Element     //a[contains(text(),"Pablo Test")]
    Click on Override Campaign Status
    Change status to  On Hold - No Response
    Page Should Contain    On Hold - No Response
    Click on Override Date of Final SMS
    Date of final SMS       30 Jan 2023
    Sleep   3s
    Page should contain     30/1/2023
    Click Edit1
    Select Checkbox By Name - DEP     HPEP Synchronise to Marketing Cloud
    Click Save (bug fix)
    Sleep    4s
    Capture Page Screenshot
    Execute the flow
    Sleep    7s
    Capture Page Screenshot
    Go to AvianFlu2022 Campaign
    Execute javascript   window.scrollTo(0,1000)
    View all campaigns members
    Sleep    3s
    Click Element     //a[contains(text(),"Pablo Test")]
    Capture Page Screenshot
    Page Should Contain    On Hold - No Response
    Page Should Contain Checkbox    //span[text()='HPEP Synchronise to Marketing Cloud']/following::div[1]//span[@class="uiImage uiOutputCheckbox"]
