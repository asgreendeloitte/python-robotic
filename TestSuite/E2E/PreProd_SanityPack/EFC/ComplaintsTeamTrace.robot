*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***
Trace Agent assign the case to Complaints Trace Team if Case Type is complaint
  [Tags]  CS20-1290  CS20-118

        Login as Generalist Trace Agent
        #Display Most Recent Cases From Generalist Enquiries – Trace Queue
        Reset View (if applicable)
        Go To Cases Tab
        Sleep  3s
        Agent Creates Case - Trace - Complaint1
        Sleep  4s
        Click Edit
        Click Drop Down By Name     Assign Trace Case
        Select Dropdown Option      Complaints Team - Test & Trace
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be       Complaints Team – Test & Trace
#Trace Agent Can't assign the case to Complaints Trace Team if Case Type is notcomplaint
#  [Tags]  CS20-1290
#
#        Login as Generalist Trace Agent
#        Display Most Recent Cases From Generalist Enquiries – Trace Queue
#        Agent Creates Case
#        Sleep  4s
#        Click Edit
#        Click Drop Down By Name     Assign Trace Case
#        Select Dropdown Option      Complaints Trace Team
#        Click Save
#        Sleep  2s
#        Check Error Message Content
#        Sleep  2s
#        Click Cancel
