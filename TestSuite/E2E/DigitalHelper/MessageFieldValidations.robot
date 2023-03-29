*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup
Resource    ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot

# DigitalHelper Flows
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup     Open Browser, Go To Digital Helper and Accept Cookies
Test Teardown  Close Browser

*** Variables ***
${msg-before-conversion}    This ‘’ & “” should be converted to this '' and ""
${msg-after-conversion}     This '' and "" should be converted to this '' and ""
${case-number-element}      //div[@class='govuk-panel__body']/div/div
${search}       //input[@placeholder='Search this list...']

*** Test Cases ***
Special characters and naughty words can not be submitted
    [Template]      Verify invalid characters
    [Tags]  CS20-42 CS20-46 CS20-47
#   Invalid charcters
    Messages can't contain special characters like / # £ : ; or %
    Messages can't contain naughty words like boob, fudgepacker and muff

Curly quotations and ambersands are converted after form submission
    [Documentation]     Curly quotation marks (‘’ “”) and ambersands (&) are not allowed in salesforce for security reasons,
    ...                 they are converted upon form submission. Note IOS keyboard uses curly quotation marks as default
    [Tags]  CS20-1644

    Complete Short Form User Flow  message=${msg-before-conversion}
    Wait Until Element Is Visible     ${case-number-element}
    sleep  7s
    ${case-number}=     Get Text      ${case-number-element}

#   Check email is the same in Salesforce
    Go To Salesforce login
    Login as E&C Central Agent
#    Display Most Recent Cases From Specialist Enquiries – Trace Queue
#    sleep   3s
#    Click Element   ${search}
#    Input Text      ${search}     ${case-number}
#    sleep   2s
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

    Page Should Contain     ${msg-after-conversion}

# To-do, bypass front end validation and check the backend strips out bad characters and abusive words
# Speak to ben

*** Keywords ***
Verify invalid characters
    [Arguments]  ${invalid-message}
    Complete Short Form User Flow  message=${invalid-message}
    Page Should Contain     Your message must not include special characters, like / # £ : ; or %

