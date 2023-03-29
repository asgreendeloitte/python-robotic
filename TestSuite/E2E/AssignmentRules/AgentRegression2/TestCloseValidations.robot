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

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.

*** Test Cases ***
#Case Type with Outcome value selected
#    [Tags]  TTCS20-2375    TTCS20-2368
#    Go To Salesforce login
#
#    Login as Generalist Test Agent
#    Display Most Recent Cases From General Complaints & Enquiries- Test Queue
#    Agent Creates Case with Case Type Complaint
#    sleep   3s
#    Click Edit
#    Page Should Contain     Complaint Outcome Details
#    Click Drop Down By Name    Outcome
#    Select Dropdown Option      Upheld
#    Click Save
#    Wait Until Page Has Saved
#    Page Should Contain    Upheld

Case Type complaint-Fields mandatory while closing a case-Test
     [Tags]  TTCS20-2375
         Go To Salesforce login

         Login as Generalist Test Agent
         #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
         Reset View (if applicable)
         Go To Cases Tab
		 Sleep  3s
         Agent Creates Case with Case Type Complaint
         sleep   3s
#        Test Close if Test Taken is Yes-Mandatory fields missing outcome and Friction
         Click Edit
         Click Drop Down By Name   Test Type
         Select Dropdown Option      PCR test
         Input Text for Date of Test    26/10/2021
         Click Drop Down By Name   Test Provider Type
         Select Dropdown Option      To be determined
         Click Drop Down By Name       Reason for feedback
         Select Dropdown Option       Availability of testing
         Click Drop Down By Name      Customer journey friction point
         Select Dropdown Option      Returning test
         Click Drop Down By Name      Outcome
         Select Dropdown Option       Partially upheld
         Sleep  2s
         Click Save
         Wait Until Page Has Saved
         Sleep  2s
         Test Close if Test Taken is Yes-Mandatory fields


Case Type complaint-Fields mandatory while closing a case-Trace
     [Tags]  TTCS20-2375
        Go To Salesforce login

        Login as Generalist Trace Agent
        #Display Most Recent Cases From Generalist Enquiries – Trace Queue
        Go To Cases Tab
		Sleep  3s
		Reset View (if applicable)
        Agent Creates Case - Trace - Complaint1
        Sleep   3s
#       Trace Close- without mandatory fields
        Click Edit
        Click Drop Down By Name    Reason for feedback
        Select Dropdown Option      Availability of testing
        Click Drop Down By Name    Outcome
        Select Dropdown Option      Upheld
        Click Drop Down By Name    Customer journey friction point
        Select Dropdown Option      Requesting test
        Click Save
        Wait Until Page Has Saved
        Page Should Contain    Upheld
        Trace Close- with mandatory fields