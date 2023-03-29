*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  AxeLibrary

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/complaint.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Variables ***
${get-result}            //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/test-results/how-you-get-your-test-result/"]
${reg-kit}               //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/register-a-test-kit/"]
${subject-text-Enquiry}      Sandbox: Confirmation of your enquiry to NHS Test and Trace
${Body-text1}       Case Number
${Body-text2}       Dear Test
${Body-text3}       Thank you
${Body-text4}       What you have provided to us
${Test-type}        //lightning-formatted-text[contains(text(),'PCR test')]
${Test-taken}       (//*[@class='slds-form-element__control'])[30]
${vaccinationstatus}  //lightning-formatted-text[contains(text(),'Fully vaccinated')]

*** Test Cases ***

Journey 12 - Complaint PTP - Myself - Click path
    [Tags]  TTCS20-3518   TTCS20-4029   TTCS20-4027
    Go To   ${digital-overhaul-url}
    click on the make a complaint link
    Click on Make a complaint button
    Sleep  2s
    Page should contain  What is your complaint about?

    Make a complaint about the topic   A Private Test Provider
    Click Continue on the page
    Page should contain     Private COVID-19 test providers
    Page should contain     We cannot help you with a test from a private test provider.
    Page should contain     A private test is one you buy from a pharmacy or retailer, in person or online.
    Page should contain     What you can do:
    Page should contain     contact your test provider
    Page should contain     contact your local trading standards office - Find your local Trading Standards office (opens in new window)

    Click Start Again
    Page should contain     Get help with coronavirus (COVID-19) enquiries and complaints




