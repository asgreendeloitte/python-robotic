*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

Test Agent assign the case to Complaints Team Test if Case Type is complaint
  [Tags]  TTCS20-5723

      Login as Generalist Test Agent
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      Reset View (if applicable)
      Go To Cases Tab
      Sleep  3s
       Click Element                   ${new-case-btn}

    #Click Element                   ${next-modal-btn}
      Click Element                   ${account-name-lookup}
      Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Complaints Mailbox
    Sleep  4s
    Click Save
    Sleep  3s
    Check Error Message Content for Complaintsmailbox
    Sleep  3s
    capture page screenshot
    Click element    //lightning-button-icon/button[@title="Close error dialog"]
    Sleep  3s
    Click Drop Down By Name         Case type
    #Select Drop down option         Complaint
    Select Drop down option complaints
    Sleep  3s
    Click Drop Down By Name         Category
    Select Drop down option         Test - General
    Click Drop Down By Name         Subcategory
    Select Drop down option         Test - General - Other
    Sleep  3s
    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s


Trace Agent assign the case to Complaints Trace Team if Case Type is complaint
  [Tags]  TTCS20-5723-1

      Login as Generalist Trace Agent
      #Display Most Recent Cases From Generalist Enquiries – Trace Queue
      Go To Cases Tab
        Sleep  3s
      Reset View (if applicable)
      Go To Cases Tab
      Sleep  3s
      Click Element                   ${new-case-btn}

    #Click Element                 ${new-case-btn_Trace}

   # Click Element                   ${next-modal-btn}
    Sleep  3s
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Complaints Mailbox
    Sleep  3s
    Click Save
    Sleep  3s
    Check Error Message Content for Complaintsmailbox
    Sleep  3s
    capture page screenshot
    Click element    //lightning-button-icon/button[@title="Close error dialog"]
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option complaints
    Sleep  3s
    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s