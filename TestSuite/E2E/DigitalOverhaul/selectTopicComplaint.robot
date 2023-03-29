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
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/complaint.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***

Select a complaint about international travel
    [Tags]  TTCS20-3651-01
    Go To Digital Overhaul
    click on the make a complaint link
    Click on Make a complaint button
    Make a complaint about the topic    International travel
    Click Continue on the page
    page should contain     Who are you completing this form for?

Select a complaint about covid-19 testing
    [Tags]  TTCS20-3651-02
    Go To Digital Overhaul
    click on the make a complaint link
    Click on Make a complaint button
    Make a complaint about the topic    COVID-19 testing
    Click Continue on the page
    page should contain     Who are you completing this form for?

Select a complaint about workplace, organisation, care home or school guidance
    [Tags]  TTCS20-3651-04
    Go To Digital Overhaul
    click on the make a complaint link
    Click on Make a complaint button
    Make a complaint about the topic    Workplace, organisation, care home or school guidance
    Click Continue on the page
    page should contain     Who are you completing this form for?

Select a complaint about other
    [Tags]  TTCS20-3651-05
    Go To Digital Overhaul
    click on the make a complaint link
    Click on Make a complaint button
    Make a complaint about the topic    Other
    Click Continue on the page
    page should contain     Who are you completing this form for?

No select any topic in complaint
    [Tags]  TTCS20-3651-06
    Go To Digital Overhaul
    click on the make a complaint link
    Click on Make a complaint button
    Click Continue on the page
    page should contain     Select what your complaint is about
