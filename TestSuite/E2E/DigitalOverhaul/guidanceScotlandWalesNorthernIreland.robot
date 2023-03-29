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
Scotland - Citizen visits COVID-19 related info about workplace, organisation, care home or school guidance
    [Tags]  TTCS20-2159-01
    Click Guidance Scotland Wales Northern Ireland
    Click Guidance Scotland
    Click Accept Cookies if applicable
    Page Should Contain     Coronavirus (COVID-19)
    Page Should Contain     Scotland
    capture page screenshot

Wales - Citizen visits COVID-19 related info about workplace, organisation, care home or school guidance
    [Tags]  TTCS20-2159-02
    Click Guidance Scotland Wales Northern Ireland
    Click Guidance Wales
    Click Accept Cookies if applicable
    Page Should Contain     Coronavirus (COVID-19)
    Page Should Contain     Wales
    capture page screenshot

Northern Ireland - Citizen visits COVID-19 related info about workplace, organisation, care home or school guidance
    [Tags]  TTCS20-2159-03
    Click Guidance Scotland Wales Northern Ireland
    Click Guidance Northern Ireland
    Click Accept Cookies if applicable
    Page Should Contain     COVID-19
    Page Should Contain     Northern Ireland
    capture page screenshot