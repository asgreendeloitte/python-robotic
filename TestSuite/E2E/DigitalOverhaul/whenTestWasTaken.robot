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

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser


*** Test Cases ***
When was the test taken?
    [Tags]  TTCS20-2211
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Find a test result for covid-19 testing
    Click Submit form
    Select myself Radio Button
    Click Continue on the page

    globalElements.Select Radio Button By Value    PCR test
    Click Continue on the page

    globalElements.Select Radio Button By Value    Yes
    Click Continue on the page

    Page should contain     When was the test taken?
    Click Continue on the page
    Page Should contain     Enter date of test

    Input the day was the test taken    25  02  2019
    Click Continue on the page
    Page Should contain     Date of test must not be before 2020

    Input the day was the test taken    32  13  2021
    Click Continue on the page
    Page should contain     Date of test must be a real date

    Input the day was the test taken    25  05  2021
    Click Continue on the page
    page should contain     Do you know the test barcode?
