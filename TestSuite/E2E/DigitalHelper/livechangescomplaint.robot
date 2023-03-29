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
${home}     //input[@value='Stay at home support']

*** Test Cases ***
Verify Symptoms and testing
    [Tags]  CS20-3628

     Click Get Started
    Page should contain     Do you want to make an enquiry, give feedback or make a complaint?
    Select Case Type Radio Button     Complaint
    Click Continue
    Page should contain     What is your complaint about?
    click element  ${home}
    Click Continue
    Page should contain    Make a complaint
    capture page screenshot







