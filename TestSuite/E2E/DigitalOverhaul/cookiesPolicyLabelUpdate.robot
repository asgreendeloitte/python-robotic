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

*** Variables ***
${deny-nhs-cookies-btn}            //button[@id='nhsuk-cookie-banner__link_accept']

*** Test Cases ***
Checkiing the differents labels for the cookies policy - I'm OK with analytics cookies
    [Tags]  TTCS20-4476
    Go To Digital Overhaul
    Page Should Contain     I'm OK with analytics cookies
    Page Should Contain     Do not use analytics cookies
    Click element       ${accept-nhs-cookies-btn}
    Page should contain     You can change your cookie settings at any time using our cookies page.

Checkiing the differents labels for the cookies policy - Do not use analytics cookies
    [Tags]  TTCS20-4476
    Go To Digital Overhaul
    Page Should Contain     I'm OK with analytics cookies
    Page Should Contain     Do not use analytics cookies
    Click element       ${deny-nhs-cookies-btn}
    Page should contain     You can change your cookie settings at any time using our cookies page.















