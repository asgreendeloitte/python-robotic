*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/GeneralistChangeCaseType.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup       Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.

*** Test Cases ***
Generalist Team Changes The Case Type To Complaints
    [Tags]     TTCS20-1427

        Go To Salesforce login
        Login as Generalist Test Agent
        #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        Reset View (if applicable)
        Go To Cases Tab
          Sleep  3s
        Agent Creates Case
        Click Edit
        Agent Clears Acocunt information and enters new account
        Click Drop Down By Name     Case type
        Select Dropdown Option      Complaint
        Click Save
#       Check Error Message Content
#       ${ErrorMessageNotified}=  Get Text    ${ErrorMessagecaptured}
#       Log to Console    ${ErrorMessageNotified}
#       sleep   3s
#       Click Cancel


