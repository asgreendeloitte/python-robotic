*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/Confirmation.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser, Go To Digital Helper and Accept Cookies
Test Teardown   Close Browser

Test Template       Generate Short Form (Trace Case) In Digital Helper And Verify It's Created in Salesforce

Default Tags  CS20-4018

*** Variables ***
${name}     Draco Malfoy
${email}    malfoy@test.com
${message}  Training Environment data creation for test case.
${case1}
${global-search}    //button[@aria-label="Search"]

*** Test Cases ***
#Enquiry
E-ST-Q1    2    Enquiry     The NHS COVID-19 app        I want to know who can use the app


*** Keywords ***
Generate Short Form (Trace Case) In Digital Helper And Verify It's Created in Salesforce
    [Arguments]  ${flow-type}   ${case-type}   ${topic}   ${question}=optional     ${sub-question}=optional     ${sub-question-2}=optional
    ${message-date}=     Create Description With Date And Time   ${message}
    ${email-date}=     Create Email With Date    ${email}
    Log     In the test
    Log     ${question}
    Complete Short Form User Flow   flow-type=${flow-type}    case-type=${case-type}  topic=${topic}  question=${question}    sub-question=${sub-question}  sub-question-2=${sub-question-2}  name=${name}    email=${email-date}    message=${message-date}
    #Get Case Number
    Wait Until Element Is Visible     ${case-number-element}
    Sleep  10s
    ${case-number}=     Get Text      ${case-number-element}
    sleep  5s
   # ${case1} = ${case-number}

#   Check Salesfore
    Go To Salesforce login
    Login as E&C Central Agent
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


    #    Display Most Recent Cases From Digital Helper and Email Cases - Test Queue
#    sleep  2s
#    Click Element   ${search}
#    Input Text      ${search}     ${case-number}
#    #Input Text      ${search}     ${case1}
#    sleep   7s
#    PRESS KEYS  None   ENTER
#    sleep   2s
#    Click Element   ${first-list-option}

#    Account Name
    Page Should Contain     ${name}

#   Case Origin
    Page Should Contain     Online-Web

#   Description
    Page Should Contain     ${message-date}
#
#    # Web Email
    Page Should Contain     ${email-date}

    Display Field text Should be1    Case Theme    The NHS COVID-19 app
    Display Field text Should be1    Case type     Enquiry
    Display Field text Should be1    Case Topic    I want to know who can use the app