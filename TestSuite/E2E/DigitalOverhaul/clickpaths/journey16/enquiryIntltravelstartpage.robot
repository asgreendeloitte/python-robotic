*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  AxeLibrary

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/intnlTravel.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Variables ***
${travel-from}   //span[contains(text(),'Travel from England')]
${travel-to}     //span[contains(text(),'Travel to England')]


*** Test Cases ***
Journey 16 - International Travel - Enquiry - startpage - Click path
    [Tags]  TTCS20-3512
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Click international travel topic

    page should contain   Travelling abroad during COVID-19
    page should contain   Red list countries and territories
    page should contain   Guidance for Scotland, Wales and Northern Ireland

    Select travelling abroad during COVID-19
    page should contain   Travelling abroad during COVID-19
    page should contain   Travel from England
    page should contain   Travel to England
    page should contain  Need more help? Make an enquiry
    click element   ${travel-from}

    page should contain link  Check the guidance on travelling abroad from England during coronavirus (COVID-19) (opens in new window).
    page should contain link  Find out more about foreign travel advice, including the latest information on entry requirements and travel warnings (opens in new window).
    click element   ${travel-to}

    page should contain link   Check the guidance for travel to England from another country (opens in new window).
    Click Submit form

    page should contain  Who are you completing this form for?
    Select myself Radio Button
    Click Continue on the page

    page should contain  Have you arrived in the UK from abroad?
    Click GoBack
    Click GoBack

    click link  International travel
    Select red list countries and territories

    Page should contain   Red list countries and territories
    Select red list countries and territories expander

    page should contain link  Read about the latest red list countries and territories (opens in new window).
    page should contain  Need more help? Make an enquiry
    Click Submit form

    page should contain  Who are you completing this form for?