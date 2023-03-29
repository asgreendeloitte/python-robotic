*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

#Logins
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot


Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CaseE2EoutboundsendingEmailonTracecase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

Test/Trace Agent Vaccination picklist validation - test
    [Tags]  TTCS20-5692

        Login as Tier 2 Test & Trace Agent
        Open Most Recent Case From inbound 119 tier2 - Test Queue
        Sleep  4s
        Click Edit
        Click Drop Down By Name     Category
        Sleep  2s
        Select Dropdown Option      Vaccinations
        Click Drop Down By Name     Subcategory
        Select Drop down option Vaccinations data
        #Select Drop down option Vaccinations
        Sleep  3s
        Click Drop Down By Name     Subcategory
        Select Drop down option Vaccinations
        Click Drop Down By Name     Subcategory
        Select Drop down option Other
        Sleep  3s
        Click Drop Down By Name     Subcategory
        Populate Fields From subcategory Picklist in Vaccination  Subcategory
        Sleep  2s
        Click Drop Down By Name     Category
        Sleep  2s
        Select Dropdown Option      Other
        Click Drop Down By Name     Subcategory
        Populate Fields From subcategory Picklist in Other   Subcategory
        #Populate Fields From RIT Resend Picklist    RIT Resend Result
        #Sleep  4s

Test/Trace Agent Vaccination picklist validation - trace
    [Tags]  TTCS20-5692-1

        Login as Tier 2 Test & Trace Agent
        Open Most Recent Case From inbound 119 tier2 - Trace Queue1
        Sleep  4s
        Click Edit
        Click Drop Down By Name     Category
        Sleep  2s
        Select Dropdown Option      Vaccinations
        Click Drop Down By Name     Subcategory
        Select Drop down option Vaccinations data
        #Select Drop down option Vaccinations
        Sleep  3s
        Click Drop Down By Name     Subcategory
        Select Drop down option Vaccinations
        Click Drop Down By Name     Subcategory
        Select Drop down option Other
        Sleep  3s
        Click Drop Down By Name     Subcategory
        Populate Fields From subcategory Picklist in Vaccination  Subcategory
        Sleep  2s
        Click Drop Down By Name     Category
        Sleep  2s
        Select Dropdown Option      Other
        Click Drop Down By Name     Subcategory
        Populate Fields From subcategory Picklist in Other   Subcategory