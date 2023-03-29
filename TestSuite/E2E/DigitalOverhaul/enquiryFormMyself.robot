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

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser


*** Test Cases ***

Enquiry on Covid-19 testing - User shown an error when no radio button of who we are is selected when
    [Tags]  TTCS20-3610
    click on the get help link
    Get help and make an enquiry about the topic     2
    Find a test result for covid-19 testing
    Click Submit form
    Click Continue on the page
    Page Should Contain        Select who you are completing this form for

User shown an error when no radio button of who we are is selected for Covid-19 enquiry
    [Tags]  TTCS20-3323_03
    Contniue without selecting who you are while submitting a Covid-19 enquiry form     2

Covid-19 Enquiry form for myself
    [Tags]  TTCS20-3323_01
    Enquiry form submission as myself for Covid-19 testing     1

