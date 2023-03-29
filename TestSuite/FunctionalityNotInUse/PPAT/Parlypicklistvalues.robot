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
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RelatedTab.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CaseDetailsTab.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variable ***
${Parliamentary-queue}      //span[contains(text(), 'PPAT Parliamentary')]/../../a
${first-list-option}        (//a[@data-refid='recordId'])[2]
${edit-link}                //*[@name='Edit']
${arrow-link}               //*[@class='slds-button slds-button_icon-border-filled']


*** Test Cases ***

Public Enquiries Case Layout - Parly Picklist Values
    [Tags]  TTCS20-4206

    Go To Salesforce login
    Login as PPAT Parliamentary Test Agent
    Reset View (if applicable)
	Sleep  3s
    Open cases tab and select list view
	Sleep  3s
    Click Element   ${Parliamentary-queue}
	Sleep  3s
    Click Element   ${first-list-option}
    Sleep  4s
   # Click Edit
   click element  ${arrow-link}
   Sleep  5s
   click element   ${edit-link}
   # will remove above 3 lines of code once edit button defect is fixed
   Sleep  4s
   Click Drop Down By Name     Priority
   Sleep  2s
   Populate Fields From Priority Picklist  Priority
   Sleep  3s
   #Select Dropdown Option      Medium
   Sleep  3s
   Click Drop Down By Name     PQ or OPB
   Sleep  2s
   Populate Fields From PQ or OPB Picklist   PQ or OPB
   Sleep  3s
  # Select Dropdown Option      PQ
   Sleep  3s
   Click Drop Down By Name     Case Origin
   Sleep  2s
   Populate Fields From Case Origin Picklist  Case Origin
   Sleep  3s
   # Select Dropdown Option    COVID-19 Helpline Mailbox
   Click Drop Down By Name     Status
   Sleep  2s
   Populate Fields From Case Status Picklist  Status
   Sleep  3s
   Click Drop Down By Name     Case type
   Sleep  2s
   Populate Fields From Case Type Picklist  Case type
   Sleep  3s
   Click Drop Down By Name     Reason for late return
   Sleep  2s
   Populate Fields From Reason for late return Picklist  Reason for late return
   Sleep  3s
   Click Drop Down By Name     Compliant / Non-complaint
   Sleep  3s
   Populate Fields From compliant-noncompliant Picklist   Compliant / Non-complaint
   Sleep  3s

















