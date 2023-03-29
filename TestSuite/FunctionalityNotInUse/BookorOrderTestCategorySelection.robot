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

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.

*** Test Cases ***
Test Agent adds Book/Order a Test Category selection
    [Tags]  TTCS20-1926

    Go To Salesforce login

    Login as Generalist Test Agent
      Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Agent Creates Case
    sleep   3s

    Click Edit
    Click Drop Down By Name     Category
    Select Dropdown Option      Book/order a test

    Click Drop Down By Name     Subcategory
   Select Dropdown Option      Book PCR test

    Click Save
    Wait Until Page Has Saved


Trace Agent adds Book/Order a Test Category selection
    [Tags]  TTCS20-1926

    Go To Salesforce login

    Login as Generalist Trace Agent
    Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Agent Creates Case - Trace
    sleep   3s

     Click Edit
     Click Drop Down By Name     Category
     Select Dropdown Option      Book/order a test

     Click Drop Down By Name     Subcategory
    Select Dropdown Option      Book PCR test
    Click Save
    Wait Until Page Has Saved


