*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

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
Resource    ../../../Resources/EnquiriesConsole/GlobalButtons.robot
Resource    ../../../Resources/ServiceCloud/HPEP/uploadData.robot
Resource    ../../../Resources/ServiceCloud/HPEP/DepCampaingLogsCreation.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

Quick Links of campaign object -Today's New Member report
    [Tags]  DEP-921-985
    Go To Salesforce login
    Login as Admin Agent
    Reset View (if applicable)
    Sleep   5s
    Go To Accounts Tab
    Create a new Account asocciated to AvianFluAutumn2022 as admin user
    Open the campaign member from the account layout
    Sleep    3s
    Open HPEP Comms Logs
    Create Comms Logs Item - Outcome Yes sympthoms
    Go to Campaigns Tab
    Go to AvianFlu2022 Campaign
    Open Todays New Members report
    Sleep   5s
    Page Should Contain    Today's New Campaign Members
    Page Should Contain    Identifies all the new Campaign Members created today belonging to a given campaign
    Page Should Contain    Member First Associated Date
    Page Should Contain    Campaign Name
    Page Should Contain    HPEP External Data Source
    Page Should Contain    HPEP External Data Source ID
    Capture Page Screenshot

Quick Links of campaign object - Today's All Outcomes report
    [Tags]  DEP-909-982
    Go To Salesforce login
    Login as Admin Agent
    #Login as POC Test Agent
    Reset View (if applicable)
    Sleep    5s
    Go to Campaigns Tab
    Go to AvianFlu2022 Campaign
    Open Todays All Outcome report
    Sleep    3s
    Page Should Contain    Today's All Outcomes
    Page Should Contain    Identifies Outcomes of all Campaign Members who have been issued a communication as part of the automated service TODAY.
    Page Should Contain    Total Records
    Page Should Contain    Total Monitoring Day
#
Quick Links of campaign object - Today's Non-Responders report
    [Tags]  DEP-906-981-1022
    Go To Salesforce login
    Login as Admin Agent
    Reset View (if applicable)
    Sleep    5s
    Go To Accounts Tab
    Create a new Account asocciated to AvianFluAutumn2022 as admin user
    Open the campaign member from the account layout
    Sleep    3s
    Open HPEP Comms Logs
    Create Comms Logs Item - No responders
    Go to Campaigns Tab
    Go to AvianFlu2022 Campaign
    Open Todays Non Responders report
    Sleep   5s
    Page Should Contain    Today's Non Responders
    Page Should Contain    Identifies all Campaign Members who have not responded to the automated service today.
    Capture Page Screenshot

Quick Links of campaign object - Today's Referrals report
    [Tags]  DEP-983-1023
    Go To Salesforce login
    Login as Admin Agent
    Reset View (if applicable)
    Sleep    5s
    Go To Accounts Tab
    Create a new Account asocciated to AvianFluAutumn2022 as admin user
    Open the campaign member from the account layout
    Sleep    3s
    Open HPEP Comms Logs
    Create Comms Logs Item - Outcome Yes sympthoms
    Go to Campaigns Tab
    Go to AvianFlu2022 Campaign
    Open Todays Referrals report
    Sleep   3s
    Page Should Contain    Today's Referrals
    Page Should Contain   Identifies all Campaign Members who have been escalated/responded 'YES' to symptoms TODAY.
    Capture Page Screenshot
