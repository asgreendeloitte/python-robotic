*** Settings ***
Documentation    Tests to verify that emails with special characters and unusual formats
...              can be submitted on the digital helper and are stored in Salesforce

Library  SeleniumLibrary    implicit_wait=15

# Setup & Logins
Resource    ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot

# DigitalHelper pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup     Open Browser, Go To Digital Helper and Accept Cookies
Test Teardown  End Test

Test Template  Submit form with valid email and check Salesforce

Default Tags    CS20-619

*** Variables ***
${case-number-element}      //div[@class='govuk-panel__body']/div/div
${search}       //input[@placeholder='Search this list...']

*** Test Cases ***
#ID     name                    valid-email
VE-1    Top Hat                 john_barnes123^@test.com
#VE-2    Dot before domian       firstname.lastname@example.com
#VE-3    Plus symbol             firstname+lastname@example.com
#VE-4    Quotation Marks         "email"@example.com
#VE-5    Underscores             _______@example.com
#VE-7    Hyphen                  firstname-lastname@example.com
#VE-8    Numbers                 1234567890@example.com
#VE-9    Unusual domain          email@example.co.jp

*** Keywords ***
Submit form with valid email and check Salesforce
    [Arguments]  ${name}    ${valid-email}
    Complete Short Form User Flow  name=${name}  email=${valid-email}
    Wait Until Element Is Visible     ${case-number-element}
    Sleep  5s
    ${case-number}=     Get Text      ${case-number-element}

#   Check email is the same in Salesforce
    Go To Salesforce login
    Login as E&C Central Agent
#    Display Most Recent Cases From Specialist Enquiries – Trace Queue
#    sleep   4s
#    Click Element   ${search}
#    Input Text      ${search}     ${case-number}
#    PRESS KEYS  None   ENTER
#    sleep   2s
#    Click Element   ${first-list-option}
#    Open Most Recent Case From E&C Central Trace Queue

    Log to Console  ${case-number}
    Sleep   5s
    Open cases tab and select list view
#    Open most recent case   ${case-type}    ${topic}
    Sleep   3s

    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']


    Page Should Contain     ${valid-email}

