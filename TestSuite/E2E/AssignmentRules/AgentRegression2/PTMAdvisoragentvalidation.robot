*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${showmore-arrow}     //*[@class='slds-button slds-button_icon-border-filled']
${delete}             //span[contains(text(),'Delete')]
${delete-btn}         //button[@title='Delete']
*** Test Cases ***

PTM Advisor validations
    [Tags]  TTCS20-3138
        Login as PTM Advisor
        Sleep  3s
        app launcher check  Cases
        Sleep  3s
        click element  ${app_launcher}
        app launcher check  Accounts
        Sleep  3s
        click element  ${app_launcher}
        app launcher check  Reports
        Sleep  3s
        click element  ${app_launcher}
        app launcher check  Dashboards
        Sleep  3s
        click element  ${app_launcher}
        app launcher check  Live issues
        Sleep  3s
        click element  ${app_launcher}
        app launcher check  Knowledge
        Sleep  4s
        Open testproviders tab
        PTM Advisor creates a test provider
        Sleep  5s
        Click Edit
        Input Date Field By Name in PTM      End Date         18/03/2022
        Click Element       ${ptm_save}
        Wait Until Page Contains   was saved  # try and get the html, it disappears so quickly i cant get the element yet
        sleep   4s
        click element  ${showmore-arrow}
        sleep  3s
        click element  ${delete}
        sleep  3s
        click element  ${delete-btn}
        Wait Until Page Contains   was deleted
        sleep  3s




