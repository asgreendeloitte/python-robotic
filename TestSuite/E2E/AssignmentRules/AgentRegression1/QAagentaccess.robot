*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

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
${first-list-option}        (//a[@data-refid='recordId'])[1]
${account_url}              https://nhs--comptest.sandbox.lightning.force.com/lightning/o/Account/home

*** Test Cases ***

Quality Assurance Agent navigating and viewing Test/Trace case
    [Tags]  TTCS20-5664-01
    #validating cases have read only and no edit access for QA agents for any test/trace cases
      Login as Quality Assurance Agent
      Display Most Recent Cases Queue
      Click Element   ${first-list-option}
      sleep  4s
      Page Should Not Contain Element    //button[@name='Edit']

Quality Assurance Agent navigating and viewing accounts
    [Tags]  TTCS20-5664-03
    #validating accounts have read only and no edit access for QA agents
      Login as Quality Assurance Agent
      sleep  4s
      Reset View (if applicable)
      Go To Accounts Tab
      Click Element   ${first-list-option}
      sleep  4s
      Page Should Not Contain Element    //button[@name='Edit']