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

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

POC on DEP service and marketing cloud journeys
    [Tags]  DEP-265
    Go To Salesforce login
    Login as POC Test Agent
    Close all mini tabs
    #app launcher check      Service Console
    Sleep   5s

    Click Element   ${global-search}
    Sleep   4s
    #wait until element is visible   (//input[@type='search'])[last()]
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   Andy Watson
    sleep   3s
    PRESS KEYS  None   ENTER
    Click Element   //a[text()='Andy Watson']
    Sleep   3s
    Close mini tab
    Go to Details tab
    Page Should Contain     Avian Flu
    Close mini tab

Upload the data into Salesforce using data import wizard
    Go To Salesforce Data Import Wizard url
    Login as POC Test Agent
    Sleep   5s
    Select Frame        //iframe[@title="Salesforce - Unlimited Edition"]
    Launch the import wizard


