*** Test Cases ***
*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/CaseView/UserRoleGeneralist&Specialist.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***
${success-message}     //span[@class='toastMessage slds-text-heading--small forceActionsText']

*** Test Cases ***
Test case agent can edit the Case Owner field to assign the case to other individual user
    [Tags]  TTCS20-2954_01_03
    Login as Generalist Test Agent
    #Display Most Recent Cases From General Complaints & Enquiries- Test Queuey
    Reset View (if applicable)
    Go To Cases Tab
		Sleep  3s
    Agent Creates Case
    Sleep   5s
    Case Status Text Should Be   New
    Case Record Type Text Should Be     Complaints and Enquiries(Test)
    Sleep   4s
    Change Owner To Generalist User   Hasen Tier 2 Test & Trace
    Wait Until Case Owner Has Saved
    Sleep  3s
    Change Owner To   Complaints Team – Test & Trace
    Sleep  3s
    Wait Until Page Contains Element    ${success-message}

Trace case agent can edit the Case Owner field to assign the case to other individual user
    [Tags]  TTCS20-2954_02_04
    Login as Generalist Trace Agent
    #Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Reset View (if applicable)
    Go To Cases Tab
		Sleep  3s
    Agent Creates Case - Trace
    Sleep   4s
    Case Status Text Should Be   New
    Case Record Type Text Should Be     Complaints and Enquiries(Trace)
    Sleep   4s
    Change Owner To Generalist User   Hasen Tier 2 Test & Trace
    Wait Until Case Owner Has Saved
    Sleep  3s
    Change Owner To   Complaints Team – Test & Trace
    Sleep  3s
    Wait Until Page Contains Element    ${success-message}

Test agent is able to view and populate the fields from Assign Test Cases picklist
    [Tags]  TTCS20-2954_05
    Login as Generalist Test Agent
    #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Reset View (if applicable)
    Go To Cases Tab
		Sleep  3s
    Agent Creates Case with Case Type Complaint
    Sleep   4s
    Click Edit
    Click Drop Down By Name     Assign Test Case
    Sleep  2s
    Populate Fields From Assign Test Case Picklist      Assign Test Case
    Sleep  4s

Trace agent is able to view and populate the fields from Assign Trace Cases picklist
    [Tags]  TTCS20-2954_06
     Login as Generalist Trace Agent
     #Display Most Recent Cases From Generalist Enquiries – Trace Queue
     Reset View (if applicable)
     Go To Cases Tab
		Sleep  3s
     Agent Creates Case - Trace - Complaint1
     Sleep   4s
     Click Edit
     Click Drop Down By Name     Assign Trace Case
     Sleep  2s
     Populate Fields From Assign Trace Case Picklist      Assign Trace Case
     Sleep  4s

Test Case agent can edit the Case Owner field and also can assign the case to a Queue
    [Tags]  TTCS20-2954_07_09
    Login as Head of Enquiries Complaints and Disputes
    #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Reset View (if applicable)
    Go To Cases Tab
		Sleep  3s
    #Agent Creates Case
    Central Agent Creates Case
    Sleep   5s
    Case Status Text Should Be   New
    Case Record Type Text Should Be     Complaints and Enquiries(Test)
    Sleep   4s
    Change Owner To Generalist User   Hasen Tier 2 Test & Trace
    Wait Until Case Owner Has Saved
    Sleep  3s
    Change Owner To   Complaints Team – Test & Trace
    Sleep  3s

Trace agent can edit the Case Owner field and also can assign the case to a Queue
    [Tags]  TTCS20-2954_08_10
    Login as Head of Enquiries Complaints and Disputes
    #Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Reset View (if applicable)
    #Agent Creates Case - Trace
    Go To Cases Tab
		Sleep  3s
    Central Agent Creates Case - Trace
    Sleep   4s
    Case Status Text Should Be   New
    Case Record Type Text Should Be     Complaints and Enquiries(Trace)
    Sleep   4s
    Change Owner To Generalist User   Hasen Tier 2 Test & Trace
    Sleep  2s
    Wait Until Case Owner Has Saved
    Sleep  3s
    Change Owner To   Complaints Team – Test & Trace
    Sleep  3s