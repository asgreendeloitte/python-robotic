*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***
Enter YOUR day of birth
    [Tags]  TTCS20-3381
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Find a test result for covid-19 testing
    Click Submit form
    Sleep  2s
    Select myself Radio Button
    Click Continue on the page

    globalElements.Select Radio Button By Value    PCR test
    Click Continue on the page

    globalElements.Select Radio Button By Value    Yes
    Click Continue on the page

    Page should contain     When was the test taken?
    Input the day was the test taken    25  02  2021
    Click Continue on the page

    globalElements.Select Radio Button By Value     Yes-barcode
    Input the test barcode      ABC12345678
    Click Continue on the page

    Input the mobile phone number was used to book the test     +447700900982
    Click Continue on the page

    Input the day of your birth     43  15  1996
    Click Continue on the page
    Page should contain     Date of birth must be a real date

    Input the day of your birth     14  02  2025
    Click Continue on the page
    Page should contain     Date of birth must be in the past

    Input the day of your birth     14  02  1987
    Click Continue on the page

    Page should contain     Enter your home address
    Page should contain     If you do not have a home address in the UK, use the address where you are staying while in the UK.




