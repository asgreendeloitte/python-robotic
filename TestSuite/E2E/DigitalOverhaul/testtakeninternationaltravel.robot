*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/intnlTravel.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Variables ***
${completingform}     //*[@class='nhsuk-error-message']
${err_msg1}     Select who you are completing this form for
${err_msg3}     Select yes if the test was taken for international travel


*** Test Cases ***
Covid-19 Testing was the test taken for International Travel - error message validation
    [Tags]  TTCS20-2203
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     2
    Getting a test for covid-19 testing
    Page should contain     Getting a test
    Page should contain     Use the link below to find information on getting a test. If you need more help, you can make an enquiry.
    Click Submit form
    Click Continue on the page
    Page should contain     Who are you completing this form for?

    Select myself Radio Button
    Click Continue on the page

    Page should contain     Can you provide more detail about the enquiry?
    Click Continue on the page
    Page should contain  Enter the reason for your enquiry
    Enter details in text area      testing
    Click Continue on the page

    Page should contain     What are your contact details?
    Click Continue on the page
    Page should contain      Enter your first name
    Page should contain      Enter your last name

    Input your First Name   Firstname
    Input your Last Name    Lastname
    Input your mobile phone number (Optional)   07766556677
    Click Continue on the page

    Page should contain     What is your email address?
    Click Continue on the page
    Page should contain      Enter your email address
    Enter email address     testtrace4@gmail.com
    Confirm email address   testtrace4@gmail.com
    Click Continue on the page


