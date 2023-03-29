*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library    DateTime

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/EnvLoginsHPEP.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource    ../../../Resources/ServiceCloud/HPEP/GlobalButtons.robot
Resource    ../../../Resources/ServiceCloud/HPEP/uploadData.robot
Resource    ../../../Resources/EnquiriesConsole/Teardown/FinishTest.robot



Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

Addition of new HPEP Journey Cycle Last Override Value
    [Tags]  DEP-1000-1030-1041
    Go To Salesforce login
    Login as Campaign Manager
    Reset View (if applicable)
    Sleep    5s
    Go To Accounts Tab
    Capture Page Screenshot
    Create a new Account asocciated to AvianFluAutumn2022
    Sleep    5s
    Capture Page Screenshot
    ${account-name}=     Get Text      //lightning-formatted-name
    Sleep   3s
    Open the campaign member from the account layout
    Page Should Contain    HPEP Journey Cycle Override Date
    Capture Page Screenshot
    Sleep    3s
    Click quick actions
    Click on Override Monitoring date
    Sleep    5s
    Select Frame    //iframe[@title='accessibility title']
    Input Text    //input[@name="DEP_Journey_Cycle_New"]    3
    Input Text    //textarea    testing
    ${current-date}=     Get Current Date      result_format=%d/%m/%Y, %H:%M
    ${current-date2}=   Subtract Time From Date     ${current-date}     01:00:00        result_format=%d/%m/%Y, %H:%M      date_format=%d/%m/%Y, %H:%M
    Click on Finish button
    Logout of Salesforce
    Sleep   7s

    Go To Salesforce login
    Login as Admin Agent
    Go to Campaigns Tab
    Go to AvianFlu2022 Campaign
    View all campaigns members
    Sleep    5s
    Capture Page Screenshot
    Sleep    2s
    Select the campaign member    ${account-name}
    Sleep    2s
    Page Should Contain     ${current-date2}
    Page Should Contain     HPEP Date of Final SMS
    ${futuredate}=  Add Time To Date    ${current-date2}    8 days       result_format=%d/%m/%Y  date_format=%d/%m/%Y, %H:%M
    Page Should Contain     ${futuredate}
    Capture Page Screenshot



