*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LandingPage.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/CaseType.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/Topic.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/Enquiry/Answers.robot

Suite Setup     Open Browser, Go To Digital Helper and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***
${name}     Draco Malfoy
${email}    malfoy@test.com
${message}  Training Environment data creation for test case.
${case1}

*** Test Cases ***
Verify Symptoms and testing
    [Tags]  CS20-3627

     Click Get Started
    Page should contain     Do you want to make an enquiry, give feedback or make a complaint?
    Select Case Type Radio Button     Enquiry
    Click Continue
    Page should contain     What is your enquiry about?
    Select Symptoms And Testing Radio Button
    Click Continue
    Page should contain    What is your enquiry about symptoms and testing?
    capture page screenshot
    Select Topic Radio Button     I have an enquiry about testing when travelling
    Click Continue
    Page should contain    I have an enquiry about testing when travelling

    page should contain link   Read the latest travel guidance before travelling abroad (opens in new window).
    page should contain link   Find out more about foreign travel advice, including the latest information on entry requirements and travel warnings (opens in new window).
    page should contain link   Read about testing before travelling to England (opens in new window).
    page should contain link   Find a travel test provider (opens in new window).
    page should contain link   Check the guidance for travel to England from abroad (opens in new window).
    page should contain        Have you taken a COVID-19 test after travelling to England from another country?
    capture page screenshot




