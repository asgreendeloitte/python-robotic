*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  AxeLibrary

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/complaint.robot


# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***

Journey 12 - Complaint Covid-19 - Myself - Click path
    [Tags]  TTCS20-3515   TTCS20-4244   TTCS20-5121

    Go To   ${digital-overhaul-url}
    click on the make a complaint link
    Click on Make a complaint button
    Sleep  2s
    Page should contain  What is your complaint about?

    Make a complaint about the topic    COVID-19 testing
    Click Continue on the page

    Page should contain     Who are you completing this form for?
    Select myself Radio Button
    Click Continue on the page

    Page should contain     Can you provide more detail about the complaint?
    Input text         ${complaint-details}        Test
    Click Continue on the page

    Page should contain     What are your contact details?
    Input your First Name   Test
    Input your Last Name    Last
    Input your mobile phone number (Optional)   077556644553
    Click Continue on the page

    Page should contain     What is your email address?
    Enter email address     testtrace4@gmail.com
    Confirm email address   testtrace4@gmail.com
    Click Continue on the page

    Page should contain     Check your answers before submitting your complaint
    Click submit complaint form
    Sleep  3s

    Page Should Contain         Form submitted
    Page Should Contain         Your case number is
    Wait Until Element Is Visible     ${Case-number-element}
    ${Case-number}=     Get Text      ${Case-number-element}
    Length Should Be            ${Case-number}     8
     Sleep  8s

    Go To Salesforce login
    Login as dhqa Test Agent

    Log to Console  ${case-number}
    Sleep   8s
    Open cases tab and select list view
#    Open most recent case   ${case-type}    ${topic}
    Sleep   8s

    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']

    #   Account Name
    Page Should Contain     test

#   Case Origin
    Page Should Contain     Online-Web
    page should contain     Complaints
    page should contain     testtrace4@gmail.com
   # page should contain     01/01/2000
    page should contain     test


