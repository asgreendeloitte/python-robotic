*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
#Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.

*** Test Cases ***
Host Agent FAQ document - Test
    [Tags]  TTCS20-1980  TTCS20-2044  TTCS20-2330
    Maximize Browser Window
    Go To Salesforce login
    Login as Generalist Test Agent
    Reset View (if applicable)
    #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Go To Cases Tab
    Sleep  3s
    Agent Creates Case
    Sleep  4s
    Page Should Contain   The Trace FAQ document can be accessed
#    Click Link    href=https://nhs--comptest.lightning.force.com/lightning/r/0693L000000cPNaQAM/view
      Select FAQ document
      Page Should Contain   pdf
      Close Browser

Host Agent FAQ document - Trace
    [Tags]   TTCS20-2330
    Maximize Browser Window
    Go To Salesforce login
    Login as Generalist Trace Agent
   # Display Most Recent Cases From Generalist Enquiries – Trace Queue
   Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
    Agent Creates Case - Trace1
    Sleep  4s
    Page Should Contain   The Trace FAQ document can be accessed
#    Click Link    href=https://nhs--comptest.lightning.force.com/lightning/r/0693L000000cPNaQAM/view
      Select FAQ document
      Page Should Contain   pdf
      Close Browser



