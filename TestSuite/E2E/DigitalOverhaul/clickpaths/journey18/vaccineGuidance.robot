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
    [Tags]      TTCS20-2112     TTCS20-2110

    Go To Digital Overhaul
    click on the get help link
    Click the Covid-19 vaccination
    Page should contain     COVID-  19 Vaccinations

    Click vaccination guidance
    Page should contain     Vaccine guidance

    Click Covid-19 vaccine guidance expander
    Click read about vaccine guidance and find out what happens when you have your vaccine
    Switch Window   new
    Page should contain     About COVID-19 vaccination
    Switch Window   main
    Click read about vaccine programme and download documents about the programme
    Switch Window   new
    Page should contain     COVID-19 vaccination programme
    Switch Window   main
    Page should contain     Vaccine guidance
    Page should contain     Contact NHS Test and Trace
    Click visit the covid-19 website on nhs.uk
    Switch Window   new
    Page should contain     COVID-19 vaccination services




