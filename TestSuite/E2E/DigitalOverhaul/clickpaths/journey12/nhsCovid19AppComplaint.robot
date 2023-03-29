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
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/nhsCovid19App.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***

Journey 12 - Complaint PTP - Myself - Click path
    [Tags]  TTCS20-4083     TTCS20-4082
    Go To   ${digital-overhaul-url}
    click on the make a complaint link

    Click on Make a complaint button
    Sleep  2s
    Page should contain  What is your complaint about?

    Make a complaint about the topic    The NHS COVID-19 app
    Click Continue on the page

    Page should contain     The NHS COVID-19 app
    page should contain   The NHS COVID-19 app will close down on 27 April 2023
    page should contain   All the app features will be working until that date.
    page should contain   Even though the app is closing down, please follow the latest guidance to protect yourself and others.
    page should contain   This includes reporting NHS lateral flow test results on GOV.UK. If you're eligible for COVID-19 treatment, you must report your result so the NHS can contact you about treatment.
    Page Should Contain   Read more about why the app is closing down on GOV.UK
    Page should contain     The NHS App
    Page should contain     We cannot help with enquiries about the NHS App (opens in new window).
    Page should contain     View your health record
    Page should contain     Get your NHS COVID pass
    Page should contain     Order repeat prescriptions
    Page should contain     For help with the NHS App, you should contact the NHS App team (opens in new window).
    Page should contain     Continue
    Page should contain     Go back

    Click the nhs app information hyperlink
    Sleep   2s
    Switch Window   new
    Page should contain     NHS App and your NHS account
    Switch Window   main

    Click the contact the nhs app team link
    Sleep   2s
    Switch Window   new
    Page should contain     Contact the NHS App and account team