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
#These test could be vastly improved my searching for the case no, as right now it looks for the latets on in that queue which will always be a trace case so is a bit pointless
Test case to trace generalist queue
    [Tags]  TTCS20-1037
    Login as Generalist Test Agent
    Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Agent Creates Case
    Sleep   5s
    Case Status Text Should Be   New
    Case Record Type Text Should Be     Complaints and Enquiries(Test)
    Sleep   4s
    Change Owner To     Generalist Enquiries – Trace
    Wait Until Case Owner Has Saved
    Sleep  3s
    End Test
    Sleep  3s
    Open Browser and Go To Salesforce Login
    Login as Generalist Trace Agent
    Open Most Recent Case From Generalist Enquiries – Trace Queue
    Case Record Type Text Should Be     Complaints and Enquiries(Trace)

Test case to trace specialist queue
    [Tags]  CS20-1058
    Login as Generalist Test Agent
#    Open Most Recent Case From General Complaints & Enquiries- Trace Queue
    Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Agent Creates Case
    Sleep   5s
    Case Status Text Should Be   New
    Case Record Type Text Should Be     Complaints and Enquiries(Test)
    Sleep   3s
    Change Owner To     Specialist Enquiries – Trace
    Wait Until Case Owner Has Saved
    End Test
    Open Browser and Go To Salesforce Login
    Login as Specialist Trace Agent
    Open Most Recent Case From Specialist Enquiries – Trace Queue
    sleep   5s
    Case Record Type Text Should Be     Complaints and Enquiries(Trace)



#Test case to trace expert queue
#    [Tags]  TTCS20-1044
#    Login as Generalist Test Agent
#    Display Most Recent Cases From General Complaints & Enquiries- Test Queue
#    Agent Creates Case
#    sleep   5s
#    Case Status Text Should Be   New
#    Case Record Type Text Should Be     Complaints and Enquiries(Test)
#    sleep   3s
#
#    Change Owner To     Expert Enquiries – Trace
#    Wait Until Case Owner Has Saved
#
#    End Test
#    Open Browser and Go To Salesforce Login
#
#    Login as Expert Trace Agent
#
#   Open Most Recent Case From Expert Enquiries – Trace Queue
#    sleep   5s
#    Case Record Type Text Should Be     Complaints and Enquiries(Trace)

