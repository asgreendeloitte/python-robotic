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
Test Teardown   End Test



*** Test Cases ***
Trace Generalist To Expert Queue
    [Tags]  TTCS20-1043  TTCS20-1326
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
    Select Checkbox By Name     Create subcase and assign to Expert Team
    Click Drop Down By Name     Assign Trace Case
    Select Drop down option      Expert Trace Team
    Click Save
    Wait Until Page Has Saved
#    Display Field Text Should Be    Category        Contact Tracing
    Case Owner Text Should Be       Expert Enquiries – Trace
    Click View Case Hierarchy
    Page Should Contain     Sub Case
    Sleep  2s
    Select the Subcase Record
    Sleep  2s
    Execute Javascript    window.location.reload(true);
    Sleep  2s
    Click Edit   index=2
    Click Drop Down By Name     SubCase Type
    Select Dropdown Option      Dispute
    Click Save
    Wait Until Page Has Saved
    Page Should Contain     Dispute



Test Generalist To Expert Queue
    [Tags]  TTCS20-1031  TTCS20-1333
    Login as Generalist Test Agent
    Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Agent Creates Case
    Case Status Text Should Be   New
    Display Field text Should Be    Category        Symptoms and Testing
    Click Edit
    Click Drop Down By Name     Category
    Select Dropdown Option      Symptoms and Testing
    Click Drop Down By Name     Subcategory
    Select Dropdown Option      Symptoms and Testing - Other
    Click Drop Down By Name     Assign Test Case
    Select Drop down option      Expert Test Team
    Select Checkbox By Name     Create subcase and assign to Expert Team
    Click Save
    Wait Until Page Has Saved
    Display Field Text Should Be    Category        Symptoms and Testing
    Case Owner Text Should Be       Expert Complaints & Enquiries- Test
    Click View Case Hierarchy
    Page Should Contain     Sub Case
    Sleep  2s
    Select the Subcase Record
    Sleep  2s
    Execute Javascript    window.location.reload(true);
    Sleep  2s
    Click Edit   index=2
    Click Drop Down By Name     SubCase Type
    Select Dropdown Option      Dispute
    Click Save
    Wait Until Page Has Saved
    Page Should Contain     Dispute