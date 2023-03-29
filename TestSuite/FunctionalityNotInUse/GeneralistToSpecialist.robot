*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***
Trace Generalist To Specialist Queue
    [Tags]  TTCS20-1048   TTCS20-740
        Login as Generalist Trace Agent
        Display Most Recent Cases From Generalist Enquiries – Trace Queue
        Agent Creates Case - Trace
        Case Status Text Should Be   New
        Display Field text Should Be    Category        Contact Tracing
        Click Edit
        Click Drop Down By Name     Category
        Select Dropdown Option      Contact Tracing
        Click Drop Down By Name     Subcategory
        Select Dropdown Option      Contact Tracing - Other
        Click Drop Down By Name     Assign Trace Case
        Select Dropdown Option      Specialist Trace Team
        Click Save
        Wait Until Page Has Saved
        Display Field text Should Be    Category        Contact Tracing
        Case Owner Text Should Be       Specialist Enquiries – Trace
#
Test Generalist To Specialist Queue
    [Tags]  TTCS20-1053  TTCS20-740
        Login as Generalist Test Agent
        Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        Agent Creates Case
        Case Status Text Should Be   New
        Display Field text Should Be    Category        Test - General
        Click Edit
        Click Drop Down By Name     Category
        Select Dropdown Option      Test - General
        Click Drop Down By Name     Subcategory
        Select Dropdown Option      Test - General - Other
        Click Drop Down By Name     Assign Test Case
        Select Dropdown Option      Specialist Test Team
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be       Specialist Enquiries - Test