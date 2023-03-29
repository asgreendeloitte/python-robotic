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

Enquiry for myself - Are you fully veccinated?
    [Tags]  TTCS20-3376
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
    Input the day was the test taken    25  02  2021
    Click Continue on the page

    globalElements.Select Radio Button By Value     Yes-barcode
    Input the test barcode      ABC12345678
    Click Continue on the page

    Input the mobile phone number was used to book the test     +447700900982
    Click Continue on the page
    Input the day of your birth     25  08  1996
    Click Continue on the page

    Page should contain     Enter your home address
    Input the postcode    EH11 2TR
    Click Continue on the page
    Sleep   2s
    Select address from the Drop down
    Click Continue on the page

    Page should contain     Are you fully vaccinated?
    Click Continue on the page

    Page should contain     Select yes if you are fully vaccinated
    Select Yes radio button
    Click Continue on the page
    Page should contain     Can you provide more detail about the enquiry?

    Click GoBack

    Select No radio button
    Click Continue on the page
    Page should contain     Can you provide more detail about the enquiry?

Enquiry as Someone - Are they fully veccinated?
    [Tags]  TTCS20-2636
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2

    Find a test result for covid-19 testing
    Click Submit form

    Select someone else Radio Button
    Click Continue on the page

    Input their First Name    Test
    Input their Last Name    last
    Click Continue on the page

    What is your relationship to this person    2
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

    globalElements.Select Radio Button By Value    Yes
    Input the day of your birth     25  08  1996
    Click Continue on the page

    Page should contain     Do you know the home address of the person who took the test?
    globalElements.Select Radio Button By Value    Yes
    Click Continue on the page

    Page should contain     Do you know the home address of the person who took the test?
    Input the postcode    EH11 2TR
    Click Continue on the page
    Sleep   2s
    Select address from the Drop down
    Click Continue on the page

    Page should contain     Are they fully vaccinated?
    Click Continue on the page

    Page should contain     Select yes if you are fully vaccinated
    Select Yes radio button
    Click Continue on the page
    Page should contain     Can you provide more detail about the enquiry?

    Click GoBack

    Select No radio button
    Click Continue on the page
    Page should contain     Can you provide more detail about the enquiry?