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

Journey 12 - Complaint PTP - Someone else - Click path
    [Tags]  TTCS20-3517     TTCS20-2109-11      TTCS20-2109-01      TTCS20-4340-01   TTCS20-4245   TTCS20-4028
    Go To   ${digital-overhaul-url}
    click on the make a complaint link
    Page should contain     Make a complaint about a COVID-19 service
    click on the test and trace link
    Page should contain     Call 119 for NHS Test and Trace
    Page should contain     119 opening times:
    Page should contain     8am to 6pm, Monday to Friday
    Page should contain     9am to 1pm, Saturday and Sunday

    Click on Make a complaint button
    Sleep  2s

    Page should contain  What is your complaint about?
    Make a complaint about the topic    COVID-19 testing
    Click Continue on the page

    Page should contain     Who are you completing this form for?
    Select someone else Radio Button
    Sleep       2s
    Page should contain element     ${someone-else-text}
    Page should contain     If you are completing this form for someone else, you must be able to answer detailed questions on their behalf.
    Click Continue on the page

    Page should contain  Tell us about the person you're completing this form for
    Input their First Name      Kevin
    Input their Last Name       Smith
    Input their Date Of Birth   01  01  2000
    Click Continue on the page

    Page should contain     What is your relationship to this person?
    Relationship to this person     Guardian
    Click Continue on the page

    Page should contain     Can you provide more detail about the complaint?
    Page should contain     Do not give personal financial information, like your National Insurance number or credit card details. Do not include characters like £ : ; or %
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
    Page Should Contain     Kevin

#   Case Origin
    Page Should Contain     Online-Web
    page should contain     Complaints
    page should contain     testtrace4@gmail.com
    page should contain     Symptoms and testing
    page should contain     01/01/2000
    page should contain     test
    page should contain     Guardian

   # page should contain element   ${vaccinationstatus}

#    ${testtypedisplayed}=   get text  ${Test-type}
#
#    log to console  ${testtypedisplayed}
#
#    should contain  ${testtypedisplayed}    PCR test