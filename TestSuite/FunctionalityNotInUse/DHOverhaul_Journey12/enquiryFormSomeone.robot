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
Submit an enquiry for someone else while checking the answers and links loaded on the screen
    [Tags]  TTCS20-3360  TTCS20-3299 TTCS20-3359
    Submit an enquiry form on behalf of someone else    1   2
    Completing form for Someone else    Completing form for     Someone else
    Their full name    	Test last
    Their Relationship to the user  Relationship     Relative
    Change their relationship
    Page should contain    What is your relationship to this person?
    Continue to complete submitting the enquiry after an update
    Confirm email address   testtrace4@gmail.com
    Click Continue on the page
    Check answers before submitting a enquiry for someoneelse
    Submit enquiry form
    Check Confirmation Page Contents
    View Guidance and Support page on GOV UK
    Switch Window
    View the latest NHS information and advice
    Use the online NHS 111 services
    Find your local NHS urgent mental health helpline
    View the NHS volunteer responders information online
    Tap back to home button
    Sleep   2s
    Page Should Contain     Get help with coronavirus (COVID-19) enquiries and complaints
