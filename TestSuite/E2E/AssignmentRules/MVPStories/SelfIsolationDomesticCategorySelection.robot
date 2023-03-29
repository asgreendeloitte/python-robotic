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
Test Agent adds Self Isolation-Domestic Category selection
    [Tags]  TTCS20-1995

    Go To Salesforce login


   Login as Generalist Test Agent
    #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
    Agent Creates Case
    sleep   3s

    Click Edit
    Click Drop Down By Name     Category
    Select Dropdown Option      Self isolation - Domestic

    Click Drop Down By Name     Subcategory
   Select Dropdown Option      Self-isolation - Other

    Click Save
    Wait Until Page Has Saved


Trace Agent adds Self Isolation-Domestic Category selection
    [Tags]  TTCS20-1995

    Go To Salesforce login

     Login as Generalist Trace Agent
     #Display Most Recent Cases From Generalist Enquiries – Trace Queue
     Reset View (if applicable)
     Go To Cases Tab
    Sleep  3s
    Agent Creates Case - Trace1
    sleep   3s

     Click Edit
     Click Drop Down By Name     Category
     Select Dropdown Option      Self isolation - Domestic

     Click Drop Down By Name     Subcategory
     Select Dropdown Option      Self-isolation - Other

     Click Save
      Wait Until Page Has Saved



