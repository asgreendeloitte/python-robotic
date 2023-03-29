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
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.

*** Test Cases ***
Future Contact and Title Field -Person Account
    [Tags]  TTCS20-1998  TTCS20-1999   TTCS20-1992  TTCS20-1999

    Go To Salesforce login
    Login as Generalist Test Agent
    #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
    Person Account Validation
#    Agent Creates Case
#    Sleep  4s
#    Page Should Contain   Test FAQ document could be found
#    Click Link    href=https://nhs--comptest.lightning.force.com/lightning/r/0693L000000cPNaQAM/view
#      Select FAQ document




