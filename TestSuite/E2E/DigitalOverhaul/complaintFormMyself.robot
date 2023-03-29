*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/complaint.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***

Make an COMPLAINT about COVID-19 as Myself
    [Tags]  TTCS20-2156-1 TTCS20-3609 TTCS20-3966   TTCS20-5929
    click on the make a complaint link
    Click on Make a complaint button
    Sleep  2s
    Make a complaint about the topic    International travel
    Click Continue on the page
    Click Continue on the page

    Page should contain     Select who you are completing this form for
    Select myself Radio Button
    Click Continue on the page

    Page should contain  Can you provide more detail about the complaint?
    Input text         ${complaint-details}        Test
    Click Continue on the page

    Page should contain     What are your contact details?
    Click Continue on the page
    Page should contain     Enter your first name
    Page should contain     Enter your last name

    Click GoBack
    Click GoBack
    Click GoBack

    Make a complaint about the topic    COVID-19 testing
    Click Continue on the page
    Click Continue on the page

    Page should contain  Can you provide more detail about the complaint?
    Input text         ${complaint-details}        Test
    Click Continue on the page

    Page should contain     What are your contact details?
    Click Continue on the page
    Page should contain     Enter your first name
    Page should contain     Enter your last name

    Click GoBack
    Click GoBack
    Click GoBack

    Make a complaint about the topic    Stay at home
    Click Continue on the page
    Click Continue on the page

    Page should contain  Can you provide more detail about the complaint?
    Input text         ${complaint-details}        Test
    Click Continue on the page

    Page should contain     What are your contact details?
    Click Continue on the page
    Page should contain     Enter your first name
    Page should contain     Enter your last name

    Click GoBack
    Click GoBack
    Click GoBack

    Make a complaint about the topic   Workplace, organisation, care home or school guidance
    Click Continue on the page
    Click Continue on the page

    Page should contain  Can you provide more detail about the complaint?
    Input text         ${complaint-details}        Test
    Click Continue on the page

    Page should contain     What are your contact details?
    Click Continue on the page
    Page should contain     Enter your first name
    Page should contain     Enter your last name

    Click GoBack
    Click GoBack
    Click GoBack

    Make a complaint about the topic   Other
    Click Continue on the page
    Click Continue on the page

    Page should contain  Can you provide more detail about the complaint?
    Input text         ${complaint-details}        Test
    Click Continue on the page

    Page should contain     What are your contact details?
    Click Continue on the page
    Page should contain     Enter your first name
    Page should contain     Enter your last name

    Click GoBack
    Click GoBack
    Click GoBack

    Make a complaint about the topic   The NHS COVID-19 app
    Click Continue on the page

    page should contain   The NHS COVID-19 app will close down on 27 April 2023
    page should contain   All the app features will be working until that date.
    page should contain   Even though the app is closing down, please follow the latest guidance to protect yourself and others.
    page should contain   This includes reporting NHS lateral flow test results on GOV.UK. If you're eligible for COVID-19 treatment, you must report your result so the NHS can contact you about treatment.
    Page Should Contain   Read more about why the app is closing down on GOV.UK