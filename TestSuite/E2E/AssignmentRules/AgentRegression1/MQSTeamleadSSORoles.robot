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
Test Teardown   End Test1

*** Variables ***
${new}                      //a[@title='New']
${save_btn}                 //button[@title='Save']
${knw_art}                  (//a[contains(text(),'Test Article')])[1]
${newreport}                //a[@title='New Report']
${reportSearch}             //*[@class='search-text-field slds-input input uiInput uiInputText uiInput--default uiInput--input']
${EFCMQSreptfldr}            //span[@class='highlightSearchText' and contains(text(),'EFC MQS')]
*** Test Cases ***
Test Case Capability
        [Tags]  TTCS20-3245
        Login as MQS IA Teamlead Agent
        MQS Agent Private List View Check
        Display Most Recent Cases From MQS IA Team Queue
        sleep  3s
        Agent Creates Case - MQS IA Team
        Click Edit
        Click Drop Down By Name     Subcategory
        Select Dropdown Option      Hotels
        Click Save
        Wait Until Page Has Saved
        sleep  3s
        Click Edit
        Click Drop Down By Name         Status
        Select Drop down option         Closed
        Click Save
        Wait Until Page Has Saved
        sleep  2s
        Case Status Text Should Be  Closed


Reports Capability
        [Tags]  TTCS20-3245-1
        Login as MQS IA Teamlead Agent
        Open Reports tab and select list view
        sleep  5s
        ELEMENT SHOULD BE VISIBLE  ${newreport}
        click element   ${reportSearch}
        input text  ${reportSearch}  EFC MQS
        sleep  3s
        PRESS KEYS  None   ENTER
        sleep  3s
        page should contain element   ${EFCMQSreptfldr}

IANTO Test Agent Knowledge articles access
  [Tags]  TTCS20-3245-2

     Login as MQS IA Teamlead Agent
         Open knowledge tab and select list view
     Sleep  4s
     ELEMENT SHOULD BE VISIBLE  ${new}
     Sleep  10s
     click element  ${knw_art}
     Page Should Contain     Knowledge
     Page Should Contain     Test Article
     Page Should Contain     Publication Status
     Page Should Contain     Published

Knowledge Article list view and archiving
    [Tags]      TTCS20-5630

    Go To Salesforce Login
    Login as WebChat Content Manager User
    Reset View (if applicable)
    User selects list view on Knowledge object      Published Articles
    Sleep   4s
    User archives a Knowledge article
    Page Should Contain     article was archived
