*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.
${MP}           //*[@class='test-id__field-value slds-form-element__static slds-grow word-break-ie11']//*[text()='MP']
${showmore-arrow}     //*[@class='slds-button slds-button_icon-border-filled']
${accept-btn}               //span[text()='Accept']
${case-num}             (//*[@slot='outputField'])[5]

*** Test Cases ***

Covid-19 App case record validations
    [Tags]  TTCS20-3975

    Go To Salesforce login
    Login as MP Trace team agent
    Display Most Recent Cases From MP Trace Queue
    Agent Creates Case - MP Complaints
    Sleep   5s
    Click Edit
    Sleep  4s
    Click Drop Down By Name     Case Theme
    Select Dropdown Option      The NHS COVID-19 app
    Click Drop Down By Name     Case Topic
    Populate Fields From Case Topic Picklist   Case Topic
    Click Save
    Wait Until Page Has Saved
    Sleep  3s


