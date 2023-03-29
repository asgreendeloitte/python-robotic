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

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser


*** Test Cases ***
Checkiing the differents topics for COVID-19
    [Tags]  TTCS20-3402     TTCS20-2109-01
    Go To Digital Overhaul
    click on the get help link
    page should contain     Get help with coronavirus (COVID-19) enquiries and complaints
    Get help and make an enquiry about the topic     2
    Getting a test for covid-19 testing
    Page should contain     Getting a test
    Page should contain     Use the link below to find information on getting a test. If you need more help, you can make an enquiry.
    Click Start Again

    Report a test result for covid-19 testing
    Page should contain     Report a test result
    Page should contain     Use the links below to find information on reporting a test result. If you need more help, you can make an enquiry.
    Click Start Again

    Find a test result for covid-19 testing
    Page should contain     Find a test result
    Page should contain     Use the link below to find information on finding a test result. If you need more help, you can make an enquiry.
    Click Start Again

    Home test kits for covid-19 testing
    Page should contain     Home test kits
    Page should contain     Use the links below to find information on home test kits. If you need more help, you can make an enquiry
    Click Start Again

    Travelling abroad during COVID-19 for covid-19 testing
    Page should contain     Travelling abroad during COVID-19
    Page should contain     Use the links below to find information on travelling abroad during COVID-19. If you need more help, you can make an enquiry.



