*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/EnvLoginsHPEP.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/HPEP/uploadData.robot


# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource    ../../../Resources/ServiceCloud/HPEP/GlobalButtons.robot



Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

Reports in Active Monitoring Folder
    [Tags]  DEP-548
    Go To Salesforce login
    Login as Campaign Manager
    Reset View (if applicable)
    Sleep    5s
    Go To Reports Tab
    Select All Folders
    Sleep    3s
    Search folder   DEP Campaigns
    Sleep    3s
    Select the folder
    Sleep    4s
    Open the folder     Active Monitoring
    Sleep    5s
    Open the report     Today's Comms Logs
    Sleep    5s
    Page Should Contain    Report: Comms Log with Campaign Member
    Page should contain    Today's Comms Logs
    Go Back
    Open the report     All Comms Logs
    Sleep    5s
    Page Should Contain    Report: Comms Log with Campaign Member
    Page should contain    All Comms Logs


