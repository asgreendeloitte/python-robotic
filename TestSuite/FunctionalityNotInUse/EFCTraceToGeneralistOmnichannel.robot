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

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Omnichannel.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***
${message}      The way to get started is to quit talking and begin doing.

*** Test Cases ***
EFC Central Team Assigns Trace Case To Specialist Queue
    [Tags]  TTCS20-1051

        Go To Salesforce login
        Login as E&C Central Agent
        Display Most Recent Cases From Generalist Enquiries – Trace Queue
        #Agent Creates Case - Trace
        Central Agent Creates Case - Trace
        Sleep   3s
        Click Edit
        Click Drop Down By Name     Assign Trace Case
        Select Dropdown Option      Specialist Trace Team
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be       Specialist Enquiries – Trace

Omnichannel - Accept work from Specialist Test Team
   [Tags]  TTCS20-1051

#       Go To Salesforce login
        Login as Specialist Trace Agent
        Accept work through Omnichannel

