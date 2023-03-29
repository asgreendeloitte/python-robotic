*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  ImapLibrary2
Library  AxeLibrary

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/homeAddress.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/stayAtHome.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Flows/emailVerification.robot

Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***
${get-result}            //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/test-results/how-you-get-your-test-result/"]
${reg-kit}               //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/register-a-test-kit/"]
${subject-text-Enquiry}      Sandbox: Confirmation of your enquiry to NHS Test and Trace
${Body-text1}       Case Number
${Body-text2}       Dear Test
${Body-text3}       Thank you
${Body-text4}       What you have provided to us

*** Test Cases ***

Enquiry - Stay at home - General Guidance - Stay at home support - links
    [Tags]      TTCS20-3806-01      TTCS20-3798     TTCS20-3797

    click on the get help link
    Click stay at home topic

    Page should contain     Stay at home
    Sleep  2s
    Click General guidance for staying at home
    Page should contain     General guidance for staying at home

    Click the when to stay at home link
    Click on Read the guidance for people with symptoms of respiratory infections including COVID-19 link
    Sleep   2s
    Switch Window   new
    Page should contain     People with symptoms of a respiratory infection including COVID-19
    Switch Window   main

    Click on the When to stay at home if you have COVID-19 link
    Switch Window   new
    Page should contain     COVID-19 symptoms and what to do
    Switch Window   main

    Click Start Again
    Page should contain     Stay at home

    Click Stay at home support
    Page should contain     Stay at home support

    Click the General stay at home support link
    Click on find your local council link
    Switch Window   new
    Page should contain     Find your local council
    Switch Window   main

    Click on mental health and wellbeing support
    Use the online NHS 111 services

    Click on Where to get urgent help for mental health link
    Switch Window   new
    Page should contain    Where to get urgent help for mental health
    Switch Window   main

    Click support at home expander
    Click on Find help for domestic violence and abuse
    Switch Window   new
    Page should contain    Domestic violence and abuse
    Switch Window   main

    Page should contain     Need more help? Make an enquiry
    Click Start Again
    Page should contain     Stay at home

    Click Stay at home support
    Page should contain     Stay at home support
    Click Submit form
    Page should contain     Who are you completing this form for?