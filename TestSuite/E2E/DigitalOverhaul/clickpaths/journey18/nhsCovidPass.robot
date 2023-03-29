*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  AxeLibrary

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/covid19Vaccination.robot

Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***
${get-result}            //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/test-results/how-you-get-your-test-result/"]
${reg-kit}               //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/register-a-test-kit/"]


*** Test Cases ***

Book a COVID-19 vaccination
    [Tags]      TTCS20-2111     TTCS20-2110

    Go To Digital Overhaul
    click on the get help link
    Click the Covid-19 vaccination
    Page should contain     COVID-  19 Vaccinations
    Click nhs covid pass
    Page should contain     NHS COVID Pass
    Click what is a covid-19 pass and how to get one
    Click read about what an nhs pass is, inlcuding who can get one and how to get one

    Switch Window   new
    Page should contain     NHS COVID Pass
    Switch Window   main

    Page should contain     NHS COVID Pass
    Page should contain     Contact NHS Test and Trace
    Click visit the covid-19 website on nhs.uk
    Switch Window   new
    Page should contain     COVID-19 vaccination services




