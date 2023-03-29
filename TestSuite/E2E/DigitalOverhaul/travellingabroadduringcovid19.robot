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
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/intnlTravel.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Variables ***
${travel-from}   //span[contains(text(),'Travel from England')]
${travel-to}     //span[contains(text(),'Travel to England')]
${internation-travel}     //h1[@id='international-travel']

*** Test Cases ***
Travelling abroad during COVID-19 - travel from and travel to links
    [Tags]  TTCS20-2178    TTCS20-5729-03-05
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     2
    Travelling abroad during COVID-19 for covid-19 testing
    Page should contain     Travelling abroad during COVID-19
    Page should contain     Use the links below to find information on travelling abroad during COVID-19. If you need more help, you can make an enquiry.
    page should contain   Travel from England
    page should contain   Travel to England
    Page Should Contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.
    Page Should Contain Element    //span[@id='helpButtonSpan']
    click element   ${travel-from}
    page should contain link  Check the guidance on travelling abroad from England during coronavirus (COVID-19) (opens in new window).
    page should contain link  Find out more about foreign travel advice, including the latest information on entry requirements and travel warnings (opens in new window).
    click link    https://www.gov.uk/guidance/travel-abroad-from-england-during-coronavirus-covid-19#plan-for-your-travel

    Switch Window   new
    page should contain  Guidance
    page should contain   Travel abroad from England during coronavirus (COVID-19)
    page should contain   Check what you need to do to follow COVID-19 rules for other countries when you travel abroad from England.
    close window
    Switch Window   main

    Sleep   2s
    click link  https://www.gov.uk/foreign-travel-advice
    Switch Window   new
    page should contain  Foreign travel advice
    page should contain  Get advice about travelling abroad, including the latest information on coronavirus, safety and security, entry requirements and travel warnings
    close window
    switch window   main

    click element   ${travel-to}
    page should contain link   Check the guidance for travel to England from another country (opens in new window).
    click link   //a[@href="https://www.gov.uk/guidance/red-amber-and-green-list-rules-for-entering-england?step-by-step-nav=8c0c7b83-5e0b-4bed-9121-1c394e2f96f3"]

    switch window   new
    page should contain   Guidance
    page should contain   Travel to England from another country during coronavirus (COVID-19)