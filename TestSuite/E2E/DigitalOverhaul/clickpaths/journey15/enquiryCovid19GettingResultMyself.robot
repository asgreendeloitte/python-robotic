*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  ImapLibrary2
Library  AxeLibrary

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/homeAddress.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Flows/emailVerification.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/salesforce.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***
${get-result}                //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/test-results/how-you-get-your-test-result/"]
${reg-kit}                   //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/register-a-test-kit/"]
${subject-text-Enquiry}      Sandbox: Confirmation of your enquiry to NHS Test and Trace
${Body-text1}                Case Number
${Body-text2}                Dear Test
${Body-text3}                Thank you
${Body-text4}                What you have provided to us

*** Test Cases ***

COVID-19 Testing Journey - Find a result for someone else - Address Not Known - Click path
    [Tags]      TTCS20-3403     TTCS20-3911     TTCS20-4325    TTCS20-4034   TTCS20-5729-03-01

    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Getting a test for covid-19 testing
    Page should contain     Getting a test
    Page Should Contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.
    Page Should Contain Element    //span[@id='helpButtonSpan']
    Click Submit form
    Sleep  2s

    Page should contain     Who are you completing this form for?
    Sleep  2s
    Select myself Radio Button
    Click Continue on the page

    Page should contain     Can you provide more detail about the enquiry?
    Enter details in text area      testing
    Click Continue on the page

    Page should contain     What are your contact details?
    Input your First Name   Firstname
    Input your Last Name    Lastname
    Input your mobile phone number (Optional)   07766556677
    Click Continue on the page

    Page should contain     What is your email address?
    Enter email address     testtrace4@gmail.com
    Confirm email address   testtrace4@gmail.com
    Click Continue on the page

    Page should contain     Check your answers before submitting your enquiry
    Submit enquiry form

    Page Should Contain         Form submitted
    Page Should Contain         Form submitted
    Page Should Contain         Your case number is
    Wait Until Element Is Visible     ${Case-number-element}
    ${Case-number}=     Get Text      ${Case-number-element}
    Length Should Be            ${Case-number}     8
   # Perform multipart email verification   ${subject-text-Enquiry}  ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}

    Sleep   8s
    Go To Salesforce login
    Login as dhqa E&C Agent working a Test or Trace case
    Reset View (if applicable)

    Log to Console  ${case-number}
    Sleep   8s
    Open cases tab and select list view
    Sleep   8s

    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']


