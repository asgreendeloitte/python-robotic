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
${vaccinationstatus}  //lightning-formatted-text[contains(text(),'Fully vaccinated')]
${Test-type}        //lightning-formatted-text[contains(text(),'PCR test')]
*** Test Cases ***

Journey 12 - Complaint PTP - Someone else - Click path
    [Tags]  TTCS20-3527     TTCS20-4109  TTCS20-4030
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







