*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  ImapLibrary2

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/homeAddress.robot
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

Home Address of the person who took the test - postcode selection
    [Tags]      TTCS20-3403

    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Find a test result for covid-19 testing
    Click Submit form
    Sleep  2s
    Select someone else Radio Button
    Click Continue on the page

    Page should contain    Tell us about the person you're completing this form for
    Input their First Name      Alan
    Input their Last Name       Smithee
    Click Continue on the page

    Click friend as relation
    Click Continue on the page

    globalElements.Select Radio Button By Value    PCR test
    Click Continue on the page

    Page should contain     Was the test taken for international travel?
    Select Yes radio button
    Click Continue on the page

    Input the day was the test taken     30  03  2021
    Click Continue on the page

    Page should contain     Do you know the test barcode?
    globalElements.Select Radio Button By Value     Yes-barcode
    Input the test barcode      ABC12345678
    Click Continue on the page

    Input the mobile phone number was used to book the test     +447700900982
    Click Continue on the page

    page should contain     Do you know the date of birth of the person who took the test?
    Select Yes radio button
    Input the day of your birth     12  12  2000
    Click Continue on the page

    Page should contain     Do you know the home address of the person who took the test?
    Select Yes radio button
    Click Continue on the page

    Page should contain     Do you know the home address of the person who took the test?
    Click Continue on the page
    Page should contain     Enter postcode

    Input the postcode      Bastard
    Click Continue on the page
    Page should contain      Enter a real postcode, like S42 5TT

    Input the postcode      SW1W 0NY
    Click Continue on the page
    Click Continue on the page
    page should contain     Select an address

    Click GoBack
    Input the postcode      SW1W 0NU
    Click Continue on the page
    click element   xpath://p[contains(text(),'their address')]
    Sleep   2s
    Page should contain    If you do not have a home address in the UK, use the address where the person is staying while in the UK.
    Page should contain     This should be the same as the address provided when the test was taken.
    Page should contain     Street name
    Page should contain     Town or city
    Page should contain     Postcode
    Click GoBack
    Click GoBack

    ## Happy path

    Page should contain     Do you know the home address of the person who took the test?
    Input the postcode      SW1W 0NY
    Click Continue on the page

    Select address from the Drop down
    Click Continue on the page

    Page should contain     Are they fully vaccinated?

