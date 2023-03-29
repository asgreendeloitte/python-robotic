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
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/gettingATest.robot


Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser


*** Test Cases ***
Checkiing the differents topics for COVID-19
    [Tags]  TTCS20-2201     TTCS20-4326-01
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Getting a test for covid-19 testing
    Page should contain     Getting a test
    Page should contain     Use the link below to find information on getting a test. If you need more help, you can make an enquiry.
    I need help getting a test
    Click Link      https://www.nhs.uk/conditions/coronavirus-covid-19/testing/get-tested-for-coronavirus
    Switch Window   new
    Page should contain     Who can get a free NHS COVID-19 rapid lateral flow test
    Switch Window   main
    Click Start Again
    Page should contain     COVID-19 testing
    Getting a test for covid-19 testing
    Click Submit form
    Page should contain     Who are you completing this form for?

Check your answers before submitting your enquiry (Myself)
    [Tags]  TTCS20-3393
    Submit get help and make an enquiry on covid-19 testing for getting a test
    Page should contain     Check your answers before submitting your enquiry
    Page should contain     Completing form for
    Page should contain     Enquiry details
    Page should contain     Name
    Page should contain     Email address

    Click Change button to change the email address
    Enter email address     testtrace@gmail.com
    Confirm email address   testtrace@gmail.com
    Click Continue on the page
    Page should contain     Check your answers before submitting your enquiry

Check your answers before submitting your enquiry (someone else)
    [Tags]  TTCS20-3395
    Submit an enquiry form for covid-19 International testing for someone else

    Page should contain     Check your answers before submitting your enquiry
    Page should contain     Completing form for
    Page should contain     Their full name
    Page should contain     Their date of birth
    Page should contain     Relationship
    Page should contain     Enquiry details
    Page should contain     Name
    Page should contain     Email address

    Click Change button to change the email address
    Enter email address     testtrace@gmail.com
    Confirm email address   testtrace@gmail.com
    Click Continue on the page
    Page should contain     Check your answers before submitting your enquiry















