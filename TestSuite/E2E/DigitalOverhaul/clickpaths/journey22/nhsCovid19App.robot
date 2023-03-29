*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/nhsCovid19App.robot


Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser

*** Test Cases ***

COVID-19 App - The NHS COVID-19 App tile route
    [Tags]      TTCS20-4076     TTCS20-2109-09  TTCS20-4084-03-04-05     TTCS20-5839-03

    Go To Digital Overhaul
    Click the nhs covid-19 app link

    page should contain   The NHS COVID-19 app will close down on 27 April 2023
    page should contain   All the app features will be working until that date.
    page should contain   Even though the app is closing down
    Page Should Contain   to protect yourself and others.
    page should contain   This includes reporting NHS lateral flow test results on GOV.UK. If you're eligible for COVID-19 treatment, you must report your result so the NHS can contact you about treatment.
    Page Should Contain   Read more about why the app is closing down on GOV.UK
    Page should contain     The NHS COVID-19 app
    Sleep  2s
    Click the data and privacy link
    Page should contain     Data and privacy
    Click the data and privacy expander

    Click the data and privacy information link
    Sleep   2s
    Switch Window   new
    Page should contain     NHS COVID-19 app: your data and privacy
    Switch Window   main

    Page should contain     Data and privacy
    Page should contain     The NHS App

    Click the nhs app information link
    Sleep   2s
    Switch Window   new
    Page should contain     NHS App and your NHS account
    Switch Window   main

    Click the contact the nhs app team link
    Sleep   2s
    Switch Window   new
    Page should contain     Contact the NHS App and account team

COVID-19 App - The NHS COVID-19 App tile route
    [Tags]      TTCS20-4076     TTCS20-2109-09  TTCS20-4084-03-04

    Go To Digital Overhaul
    Click the nhs covid-19 app link
    Page should contain     The NHS COVID-19 app
    Sleep   2s
    Click using and setting up the app tile
    page should contain     Using and setting up the app
    Click Submit form
    Page should contain     Who are you completing this form for?
    Select the NHS home logo

    Click the nhs covid-19 app link
    Page should contain     The NHS COVID-19 app
    Sleep   2s
    Click what the app does and how it works tile
    page should contain     What the app does and how it works
    Select the NHS home logo

    Click the nhs covid-19 app link
    Page should contain     The NHS COVID-19 app
    Sleep   2s
    Click trouble shooting and technical information tile in NHS Covid19 app
    page should contain     Troubleshooting and technical information

NHS COVID-19 App - Troubleshooting and technical information
    [Tags]      TTCS20-4075
    Go To Digital Overhaul
    click on the get help link
    Click the nhs covid-19 app link
    Page should contain     The NHS COVID-19 app
    Sleep   2s
    Click trouble shooting and technical information tile in NHS Covid19 app
    Page should contain     Troubleshooting and technical information
    Page should contain     Get help troubleshooting and technical information about the app (opens in new window).
    Page should contain     Troubleshooting and technical information
    Page should contain     The NHS App
    Page should contain     We cannot help with enquiries about the NHS App (opens in new window).
    Page should contain     View your health record
    Page should contain     Get your NHS COVID pass
    Page should contain     Order repeat prescriptions
    Page should contain     For help with the NHS App, you should contact the NHS App team (opens in new window).
    Page should contain     Need more help? Make an enquiry
    Page should contain     If you need more help you can contact NHS Test and Trace by making an enquiry. We will respond within 3 working days. If you would prefer to speak to someone directly, call 119.

    Click trouble shooting and technical information link
    Click on get help trouble shooting and techincal information link that opens in a new window
    Sleep   2s
    Switch Window   new
    Page should contain     NHS COVID-19 app: troubleshooting and technical information
    Switch Window   main

    Click the nhs app information link
    Sleep   2s
    Switch Window   new
    Page should contain     NHS App and your NHS account
    Switch Window   main

    Click the contact the nhs app team link
    Sleep   2s
    Switch Window   new
    Page should contain     Contact the NHS App and account team
    Switch Window   main

NHS COVID-19 App - Troubleshooting and technical information
    [Tags]      TTCS20-4074
    Go To Digital Overhaul
    click on the get help link
    Click the nhs covid-19 app link
    Page should contain     The NHS COVID-19 app
    Sleep   2s
    Click what the app does and how it works tile
    Page should contain     What the app does and how it works
    Page should contain     Find out what the app does (opens in new window).
    Page should contain     Find out how the app works (opens in new window).
    Page should contain     The NHS App
    Page should contain     We cannot help with enquiries about the NHS App (opens in new window).
    Page should contain     View your health record
    Page should contain     Get your NHS COVID pass
    Page should contain     Order repeat prescriptions
    Page should contain     For help with the NHS App, you should contact the NHS App team (opens in new window).
    Page should contain     Need more help? Make an enquiry
    Page should contain     If you need more help you can contact NHS Test and Trace by making an enquiry. We will respond within 3 working days. If you would prefer to speak to someone directly, call 119.

    Click on what the app does and how it works expander
    Click on find out what the app does that opens in a new window
    Sleep   2s
    Switch Window   new
    Page should contain     NHS COVID-19 app: what the app does
    Switch Window   main

    Sleep   2s
    Click on find out how the app works that opens in a new window
    Sleep   2s
    Switch Window   new
    Page should contain     NHS COVID-19 app: how the app works
    Switch Window   main

    Sleep   2s
    Click the contact the nhs app team link
    Sleep   2s
    Switch Window   new
    Page should contain     Contact the NHS App and account team
    Switch Window   main
