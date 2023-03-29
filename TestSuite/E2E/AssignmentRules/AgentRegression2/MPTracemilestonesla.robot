*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}          The way to get started is to quit talking and begin doing.
${sla-text1}        1 month
${sla-text2}        2 days
${sla-text3}        4 days
${sla-milestone}    //*[@class='milestoneTimerText ontrackTimer']

${sla-text4}       19 days


*** Test Cases ***

#MP Trace case generation with Complaints
#    [Tags]  TTCS20-2701     TTCS20-3434
#
#    Go To Salesforce login
#    Login as E&C Central Agent
#    Display Most Recent Cases From MP Trace Queue
#    Agent Creates Case - MP Complaints without mandatory fields
#    Click Edit
#    Click Drop Down By Name     Assign Trace Case
#    Select Dropdown Option      Complaints Team - Test & Trace
#    Click Save
#    Wait Until Page Has Saved
#    Sleep  4s
#    page should contain     ${sla-text1}
#    ${ErrorMessageNotified}=  Get Text    ${sla-milestone}
#     Log to Console    ${ErrorMessageNotified}
#     Should Contain Any  ${ErrorMessageNotified}    ${sla-text1}
#    Sleep  4s
#     Click Edit
#    Click Drop Down By Name     Priority
#    Select Dropdown Option      High
#    Click Drop Down By Name     Priority Reasons
#    Select Dropdown Option      MP Case
#    Click Save
#    Wait Until Page Has Saved
#    Sleep  4s
#    #page should contain     ${sla-text2}
#    ${ErrorMessageNotified}=  Get Text    ${sla-milestone}
#     Log to Console    ${ErrorMessageNotified}
#     Should Contain Any  ${ErrorMessageNotified}    ${sla-text2}  ${sla-text3}
#    Click Edit
#
#Test case generation with SLA milestone complaints to Enquiry
#    [Tags]  TTCS20-2701-1   TTCS20-3434
#
#    Go To Salesforce login
#    Login as E&C Central Agent
#    Display Most Recent Cases From MP Trace Queue
#    Agent Creates Case - MP Complaints test case without mandatory fields
#    page should contain     ${sla-text1}
#    ${ErrorMessageNotified}=  Get Text    ${sla-milestone}
#     Log to Console    ${ErrorMessageNotified}
#     Should Contain Any  ${ErrorMessageNotified}    ${sla-text1}
#     Click Edit
#    Click Drop Down By Name     Case type
#    Select Dropdown Option      Enquiry
#    Click Save
#    Wait Until Page Has Saved
#    Sleep  4s
#    page should contain     ${sla-text2}
#    ${ErrorMessageNotified}=  Get Text    ${sla-milestone}
#     Log to Console    ${ErrorMessageNotified}
#     Should Contain Any  ${ErrorMessageNotified}    ${sla-text2}  ${sla-text3}

New SLA milestone complaints to Enquiry (test complaints)
    [Tags]   TTCS20-3434
    Go To Salesforce login
    Login as MP Trace team agent
    Display Most Recent Cases From MP Trace Queue
    Agent Creates Case - MP Complaints test case without mandatory fields1

    page should contain     ${sla-text4}
    ${ErrorMessageNotified}=  Get Text    ${sla-milestone}
     Log to Console    ${ErrorMessageNotified}
     Should Contain Any  ${ErrorMessageNotified}    ${sla-text4}
     Click Edit
     Click Drop Down By Name    Priority
    # Click Drop Down By Name    Priority
     Select Dropdown Option     High
     Click Drop Down By Name    Priority Reasons
     Select Dropdown Option    Other
    Click Save
       page should contain     ${sla-text2}
    ${ErrorMessageNotified}=  Get Text    ${sla-milestone}
     Log to Console    ${ErrorMessageNotified}
     Should Contain Any  ${ErrorMessageNotified}    ${sla-text2}
     page should contain    Case Origination Date/Time

New SLA milestone complaints to Enquiry (trace complaints)
    [Tags]   TTCS20-3434
    Go To Salesforce login
    Login as MP Trace team agent
    Display Most Recent Cases From MP Trace Queue
    Agent Creates Not a Genunine Case - MP Trace
    page should contain     ${sla-text4}
    ${ErrorMessageNotified}=  Get Text    ${sla-milestone}
     Log to Console    ${ErrorMessageNotified}
     Should Contain Any  ${ErrorMessageNotified}    ${sla-text4}
     page should contain    Case Origination Date/Time

