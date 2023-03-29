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
${message}      The way to get started is to quit talking and begin doing.

*** Test Cases ***
MP Trace Complaint Agent Category validation
    [Tags]  TTCS20-2239

    Go To Salesforce login
    Login as E&C Central Agent
    Display Most Recent Cases From MP Trace Queue
    Agent Creates Case - MP Complaints without mandatory fields
    Click Edit
     Click Drop Down By Name     Category
     Select Dropdown Option      MP Trace
      Click Drop Down By Name     Case type
       Select Dropdown Option      Complaint
        Click Drop Down By Name     Subcategory
       Select Dropdown Option       MP Trace - Other
        Click Drop Down By Name     Subcategory
         Select Dropdown Option       MP Trace - Other
         Click Drop Down By Name     Second Subcategory
          Select Dropdown Option       MP Trace - Other      index=2
          Click Drop Down By Name     Third Subcategory
          Select Dropdown Option       MP Trace - Other      index=3
          Click Save
          Wait Until Page Has Saved

