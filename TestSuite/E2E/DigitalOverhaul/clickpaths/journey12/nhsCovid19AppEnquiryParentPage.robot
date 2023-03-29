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
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/nhsCovid19App.robot


Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***

Parent Page about NHS COVID-19 app
    [Tags]  TTCS20-4058

    Click the nhs covid-19 app link
    Page should contain     The NHS COVID-19 app

    Page should contain     Using and setting up the app
    Page should contain     What the app does and how it works
    Page should contain     Troubleshooting and technical information
    Page should contain     Data and privacy


    Click using and setting up the app tile
    page should contain     Using and setting up the app
    page should contain     Use the links to find information on using and setting up the app. If you need more help, you can make an enquiry.
    Click Start Again


    Click what the app does and how it works tile
    page should contain    What the app does and how it works
    page should contain    Use the links to find information on what the app does and how it works. If you need more help, you can make an enquiry.
    Click Start Again

    Click trouble shooting and technical information tile in NHS Covid19 app
    page should contain     Troubleshooting and technical information
    page should contain     Use the links to find information on Troubleshooting and technical information. If you need more help, you can make an enquiry.
    Click Start Again

    Click the data and privacy link
    Page should contain     Data and privacy
    Page should contain     Use the links to find information on data and privacy. If you need more help, you can make an enquiry.




