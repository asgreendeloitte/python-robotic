*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/complaint.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***

Journey 12 - Other - Complaint for myself

    [Tags]   TTCS20-5121

    click on the make a complaint link
    Click on Make a complaint button
    Sleep  2s
    Make a complaint about the topic    Other
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