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
Test - Category International arrivals - Exemption
    [Tags]  TTCS20-1996

        Login as Generalist Test Agent
        #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        Reset View (if applicable)
        Go To Cases Tab
         Sleep  3s
        Agent Creates Case
        Sleep  3s
        Click Edit
        Click Drop Down By Name            Category
        GlobalButtons.Select Drop down option    International arrivals - Exemption
        Click Drop Down By Name            Subcategory
        GlobalButtons.Select Drop down option        Exemption - Other
        Click Save
        Wait Until Page Has Saved
        Page Should Contain     International arrivals - Exemption


Trace - Category International arrivals - Exemption
    [Tags]  TTCS20-1996  TTCS20-2011

        Login as Generalist Trace Agent
        #Display Most Recent Cases From Generalist Enquiries – Trace Queue
        Reset View (if applicable)
        Go To Cases Tab
        Sleep  3s
        Agent Creates Case - Trace
        Click Edit
        Click Drop Down By Name            Category
        GlobalButtons.Select Drop down option    International arrivals - Exemption
        Click Drop Down By Name            Subcategory
        GlobalButtons.Select Drop down option        Exemption - Other
        Click Save
        Wait Until Page Has Saved
        Page Should Contain     International arrivals - Exemption