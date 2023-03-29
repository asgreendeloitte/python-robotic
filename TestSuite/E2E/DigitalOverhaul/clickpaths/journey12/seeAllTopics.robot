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
COVID-19 App - See all topics route
    [Tags]  TTCS20-4084-01-02
    Click See all topics
    Page should contain     See all topics

    Select using and setting up the app
    page should contain     Using and setting up the app
    Click on NHS home button

    page should contain     Get help with coronavirus (COVID-19) enquiries and complaints
    Click See all topics
    Select what the app does and how it works
    page should contain     What the app does and how it works
    Click on NHS home button

    page should contain     Get help with coronavirus (COVID-19) enquiries and complaints
    Click See all topics
    Select troubleshooting and technical information
    page should contain     Troubleshooting and technical information
    Click on NHS home button

    page should contain     Get help with coronavirus (COVID-19) enquiries and complaints
    Click See all topics
    Select data and privacy
    page should contain     Data and privacy




