*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/QAdetails.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.
${new}                      //a[@title='New']
${new-Report}               //a[@title='New Report']
${new-folder}               //*[@title='New Folder']

*** Test Cases ***
MP Trace Agent add constituent Name from the list
    [Tags]  TTCS20-1139

    Login as E&C Central Agent
    Sleep  2s
    Display Most Recent Cases From MP Trace Queue
    Agent Creates Case - MP Complaints
    MP Trace Constituent name added

MP Trace Team Lead Agent validations
    [Tags]   TTCS20-3079  TTCS20-3079-9

    Go To Salesforce login
    Login as MP Trace Lead Agent
    Display Most Recent Cases From MP Trace Queue
    Agent Creates Case - MP Complaints
    Sleep   5s
    Click Edit
    Click Drop Down By Name     MP Case Status
    Select Dropdown Option      Further investigation required
    Click Save
    Wait Until Page Has Saved
    Sleep  3s
    Click QA
    Sleep  3s
    QA Details Edit by adding all details
    Sleep  3s


MP Trace Team Lead Agent Knowledge articles access
  [Tags]  TTCS20-3079-6

     Login as MP Trace Lead Agent
     Display Knowledge From IANTO - Team Queue
     Sleep  4s
     #ELEMENT SHOULD NOT BE VISIBLE  ${new}
     element should be visible   ${new}

MP Trace Team lead viewing report
  [Tags]  TTCS20-3079-7

      Login as MP Trace Lead Agent
      Display Reports From IANTO - Team Queue
      Sleep  5s
      element should be visible  ${new-Report}
      element should be visible  ${new-folder}


MP Trace Team Lead Agent Live issue field validations
    [Tags]   TTCS20-3248

    Go To Salesforce login
    Login as MP Trace Lead Agent
    Display Most Recent Cases From MP Trace Queue
    Agent Creates Case - MP Complaints
    Sleep   5s
    Click Edit
    Live Issue Search Text
    Click Save
    Wait Until Page Has Saved

MP Trace Team Agent Live issue field validations
    [Tags]   TTCS20-3248-1

    Go To Salesforce login
    Login as MP Trace team agent
    Display Most Recent Cases From MP Trace Queue
    Agent Creates Case - MP Complaints
    Sleep   5s
    Click Edit
    Live Issue Search Text
    Click Save
    Wait Until Page Has Saved