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
${save_btn}                 //button[@name="SaveEdit"]
${knw_art}                  //a[contains(text(),'What should I do if I know the person I have been ')]
*** Test Cases ***
Test Case Capability
        [Tags]  TTCS20-3146
        Login as RTS/LTS Advisor
        LTS&RTS Private List View Check
        Display Most Recent Cases From RTS/LTS Queue - New
        sleep  3s
        ELEMENT SHOULD NOT BE VISIBLE  ${new}
        sleep  3s
        Click Element   ${first-list-option}
        sleep  3s
        Click Edit
        element should be visible    ${save_btn}
        Click Save
        Capture Page Screenshot
        sleep  5s
        click element  ${app_launcher}
        app launcher check  Reports
        Sleep  3s
        click element  ${app_launcher}
        app launcher check  Knowledge
        Sleep  3s




