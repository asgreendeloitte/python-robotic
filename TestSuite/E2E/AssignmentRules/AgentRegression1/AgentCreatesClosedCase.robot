*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

#Logins
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***


*** Test Cases ***

EFC Central Agent Creates Test Closed Case throws error
    [Tags]  TTCS20-1235

        Login as E&C Central Agent
        Go To Cases Tab
        Queues.Reset View (if applicable)
        #Agent Creates a Closed Case
        Central Agent Creates a Closed Case
        Check Error Message Content for CloseCase

EFC Central Agent Creates Trace Closed Case throws error
    [Tags]  TTCS20-1235

        Login as E&C Central Agent
        Go To Cases Tab
        Queues.Reset View (if applicable)
        EFC Central Agent Creates a Trace Closed Case
        Check Error Message Content for CloseCase


# Test logins
Test Generalist Agent Creates Closed Case throws error
    [Tags]  TTCS20-1235

        Login as Generalist Test Agent
        Go To Cases Tab
        Queues.Reset View (if applicable)
        Agent Creates a Closed Case
        Check Error Message Content for CloseCase

Test Specialist Agent Creates Closed Case throws error
    [Tags]  TTCS20-1235

        Login as Specialist Test Agent
        Go To Cases Tab
        Queues.Reset View (if applicable)
        Central Agent Creates a Closed Case
        #Agent Creates a Closed Case
        Check Error Message Content for CloseCase


## Trace logins

Trace Generalist Agent Creates Closed Case throws error
    [Tags]  TTCS20-1235

        Login as Generalist Trace Agent
        Go To Cases Tab
        Queues.Reset View (if applicable)
        Agent Creates a Closed Case
        Check Error Message Content for CloseCase

Trace Specialist Agent Creates Closed Case throws error
    [Tags]  TTCS20-1235

        Login as Specialist Trace Agent
        Go To Cases Tab
        Queues.Reset View (if applicable)
        Agent Creates a Closed Case
        Check Error Message Content for CloseCase


