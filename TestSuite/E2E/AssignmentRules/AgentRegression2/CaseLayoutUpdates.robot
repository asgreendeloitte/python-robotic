*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  DateTime

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CaseE2EoutboundsendingEmailonTracecase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1
*** Variables ***

*** Test Cases ***
EFC - Case Page Layout Cleanup
    [Tags]  TTCS20-3960-01
        Go To Salesforce login
        Login as Tier 2 Test & Trace Agent
        Sleep    3s
        Reset View (if applicable)
        Go To Cases Tab
		Sleep  3s
        Central Agent Creates Case - Trace
        Page Should Not Contain    MP Case Reference
        Page Should Not Contain    MP Case Status
        Page Should Not Contain    Second Subcategory
        Page Should Not Contain    Third Subcategory

        Page Should Not Contain    International Arrivals
        Page Should Not Contain    Country Status
        Page Should Not Contain    Travel Date to the UK
        Page Should Not Contain    Date of Arrival Not Applicable
        Page Should Not Contain    Country Travelling From
        Page Should Not Contain    Country Travelling To
        Page Should Not Contain    Quarantine Hotel Location
        Page Should Not Contain    Quarantine Hotel Name

        Page Should Not Contain    Consent Details
        Page Should Not Contain    Third Party Contacting?
        Page Should Not Contain    Name of affected person
        Page Should Not Contain    Web Name of affected person
        Page Should Not Contain    Web Date of Birth
        Page Should Not Contain    Web Phone of affected person
        Page Should Not Contain    All Consent Obtained
        Page Should Not Contain    Relationship to person contacting
        Page Should Not Contain    Relationship description

EFC - Case Page Layout Cleanup
    [Tags]  TTCS20-3960-02
        Go To Salesforce login
        Login as EFC Complaints Agent
        Sleep    3s
        Reset View (if applicable)
        Go To Cases Tab
		Sleep  3s
        Central Agent Creates Case - Trace
        Page Should Not Contain    MP Case Reference
        Page Should Not Contain    MP Case Status
        Page Should Not Contain    Second Subcategory
        Page Should Not Contain    Third Subcategory

        Page Should Not Contain    International Arrivals
        Page Should Not Contain    Country Status
        Page Should Not Contain    Travel Date to the UK
        Page Should Not Contain    Date of Arrival Not Applicable
        Page Should Not Contain    Country Travelling From
        Page Should Not Contain    Country Travelling To
        Page Should Not Contain    Quarantine Hotel Location
        Page Should Not Contain    Quarantine Hotel Name

        Page Should Not Contain    Consent Details
        Page Should Not Contain    Third Party Contacting?
        Page Should Not Contain    Name of affected person
        Page Should Not Contain    Web Name of affected person
        Page Should Not Contain    Web Date of Birth
        Page Should Not Contain    Web Phone of affected person
        Page Should Not Contain    All Consent Obtained
        Page Should Not Contain    Relationship to person contacting
        Page Should Not Contain    Relationship description