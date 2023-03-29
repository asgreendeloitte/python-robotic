*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  DateTime

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
#These test could be vastly improved my searching for the case no, as right now it looks for the latets on in that queue which will always be a test case so is a bit pointless
Trace case to test generalist queue
    [Tags]  TTCS20-1055
    Login as Generalist Trace Agent
    Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Agent Creates Case - Trace
    sleep   5s
    Case Status Text Should Be   New
    Case Record Type Text Should Be     Complaints and Enquiries(Trace)
    sleep   3s

    Change Owner To     Generalist Enquiries - Test
    Wait Until Case Owner Has Saved

    End Test
    Open Browser and Go To Salesforce Login

    Login as Generalist Test Agent
    Open Most Recent Case From General Complaints & Enquiries- Test Queue
    Case Record Type Text Should Be     Complaints and Enquiries(Test)

Trace case to test specialist queue
    [Tags]  TTCS20-1046
    Login as Generalist Trace Agent
    Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Agent Creates Case - Trace
    sleep   5s
    Case Status Text Should Be   New
    Case Record Type Text Should Be     Complaints and Enquiries(Trace)
    sleep   3s

    Change Owner To     Specialist Enquiries - Test
    Wait Until Case Owner Has Saved

    End Test
    Open Browser and Go To Salesforce Login

    Login as Specialist Test Agent
    Queues.Open Most Recent Case From Specialist Complaints & Enquiries- Test Queue
    sleep   5s
    Case Record Type Text Should Be     Complaints and Enquiries(Test)

Trace case to test expert queue
    [Tags]  TTCS20-1028
    Login as Generalist Trace Agent
    Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Agent Creates Case - Trace
    sleep   5s
    Case Status Text Should Be   New
    Case Record Type Text Should Be     Complaints and Enquiries(Trace)

    sleep   3s

    Change Owner To     Expert Enquiries - Test
    Wait Until Case Owner Has Saved

    End Test
    Open Browser and Go To Salesforce Login

    Login as Expert Test Agent
    Open Most Recent Case From Expert Complaints & Enquiries- Test Queue
    sleep   5s
    Case Record Type Text Should Be     Complaints and Enquiries(Test)

