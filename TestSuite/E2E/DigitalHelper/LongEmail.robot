*** Settings ***
Documentation    Tests to verify that emails with special characters and unusual formats
...              can be submitted on the digital helper and are stored in Salesforce

Library  SeleniumLibrary    implicit_wait=15

# Setup & Logins
Resource    ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot

# Digital Helper pages
Resource    ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource    ${EXECDIR}/Resources/DigitalHelper/Pages/ShortForm.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup     Open Browser, Go To Digital Helper and Accept Cookies
Test Teardown  Close Browser

*** Variables ***
${name}                 Long Email
${81-char-email}        this-email-is-81-chars-long-johnhnjohnjohnjohnjohnjohnjohnjohnjohnjohnjo@test.com
${79-char-email}        this-email-is-79-chars-long-hnhnjohnjohnjohnjohnjohnjohnjohnjohnjohnjo@test.com
${case-number-element}      //div[@class='govuk-panel__body']/div/div
${search}       //input[@placeholder='Search this list...']

*** Test Cases ***
Verify long email format
    [Tags]  CS20-642
#   Create Case with valid email in DigitalHelper
    Complete Short Form User Flow  name=${name}  email=${81-char-email}

    Page Should Not Contain     ${81-char-email}    # 81 chars can not be input into the email field
    sleep   2s
    Clear Email Address
    sleep   2s
    Input Email Address     ${79-char-email}
    sleep   2s
    Click Send Feedback
    Wait Until Element Is Visible     ${case-number-element}
    sleep   7s
    ${case-number}=     Get Text      ${case-number-element}

#    Wait Until Page Contains        Thank you for submitting your message
#   Check email is the same in Salesforce
    Go To Salesforce login
    Login as E&C Central Agent
   # Display Most Recent Cases From Specialist Enquiries – Trace Queue
    sleep   5s
    Open cases tab and select list view
    sleep   4s
    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']


#    Click Element   ${search}
#    Input Text      ${search}     ${case-number}
#    PRESS KEYS  None   ENTER
#    sleep   2s
#    Click Element   ${first-list-option}
#    Open Most Recent Case From Specialist Enquiries – Trace Queue
#    Open Most Recent Case From E&C Central Trace Queue

    Page Should Contain     ${79-char-email}
