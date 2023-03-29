*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  DateTime

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CaseE2EoutboundsendingEmailonTracecase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1
*** Variables ***

${casecomment}        //textarea[@class=' textarea']
${new-account-btn}                 //a[@title='New']

#//*[@class='uiInput uiInputTextArea uiInput--default uiInput--textarea']/textarea

*** Test Cases ***
Deduplication of Accounts
    [Tags]  TTCS20-5601
    Login as Tier 2 Test & Trace Agent
    Reset View (if applicable)
    Go To Accounts Tab
    Click Element                   ${new-account-btn}
    Person Account Creation     Duplication     Test    07590551283  Dedupe@dupe.com
    Click Save & New
    sleep   4s
    Person Account Creation     Duplication     Test    07590551284  Dedupe@dupe.com
    Page should contain         This record looks like an existing record. Make sure to check any potential duplicate records before saving.
    Click Save & New
    sleep   4s
    Person Account Creation     Duplication2     Test    07590551283  Dedupe@dupe.com
    Page should contain         This record looks like an existing record. Make sure to check any potential duplicate records before saving.
    Click Save & New
    sleep   4s
    Person Account Creation     Duplication     Test    07590551283  Dedupe2@dupe.com
    Page should contain         This record looks like an existing record. Make sure to check any potential duplicate records before saving.
    Click Save & New
    sleep   4s
    Person Account Creation     Duplication     Test2    07590551283  Dedupe@dupe.com
    Page should contain         This record looks like an existing record. Make sure to check any potential duplicate records before saving.
    Click Save
    Sleep    4s
    Page Should Contain Element    //a[text()='View Duplicates']
#    click element                  //a[text()='View Duplicates']
#    Sleep    2s
#    Page Should Contain Element    //th[@aria-label='Birthdate']