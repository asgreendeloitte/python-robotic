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
Verify Redlist Countries options
    [Tags]  CS20-3723

    Click Get Started
    Page should contain     Do you want to make an enquiry, give feedback or make a complaint?
    Select Case Type Radio Button     Enquiry
    Click Continue
    Page should contain     What is your enquiry about?
    Select Topic Radio Button   International travel
    Click Continue
    Page should contain    What is your enquiry about international travel?
    Page should contain    Red list countries and territories

    Select Topic Radio Button     Red list countries and territories
    Click Continue
    Page should contain    Red list countries and territories

    Page Should Contain Link    Read about the latest red and non-red list countries (opens in new window).
    Page Should Contain Link    Travel abroad from England during coronavirus (COVID-19) (opens in new window).
    Page should contain         Need more help?
    Page should contain         If you need more help you can submit a form. We will respond to your message within 3 working days. If your enquiry needs an immediate response, you can call 119.









