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
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/QAdetails.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.

*** Test Cases ***
New Tab QA visible
    [Tags]  TTCS20-1130   TTCS20-1141  TTCS20-1137  TTCS20-1138  TTCS20-1553


    Login as Specialist Test Agent
    Sleep  2s
    Display Most Recent Cases From Specialist Complaints & Enquiries- Test Queue
    Agent Creates Case for Specialist
    Sleep  6s
    Click QA
    QA Details Edit without filling any details
    QA Details Edit without filling Comments
    QA Details Edit by adding all details

