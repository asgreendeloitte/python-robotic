*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot

Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***
${get-result}            //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/test-results/how-you-get-your-test-result/"]
${reg-kit}               //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/register-a-test-kit/"]

*** Test Cases ***

Covid19 Enquiry- Find a test result - Do you know the date of birth of the person who took the test
    [Tags]      TTCS20-3388
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Click covid-19 testing topic
    Find a test result for covid-19 testing

    Page should contain     Find a test result
    Click Submit form
    Sleep  2s

    Page should contain     Who are you completing this form for?
    Select someone else Radio Button
    Click Continue on the page

    Page should contain    Tell us about the person you're completing this form for
    Input their First Name      Alan
    Input their Last Name       Smithee
    Click Continue on the page

    Page should contain    What is your relationship to this person?
    Click relative as relation
    Click Continue on the page

    Page should contain    Which COVID-19 test did they take?
    globalElements.Select Radio Button By Value    PCR test
    Click Continue on the page

    Page should contain     Was the test taken for international travel?
    globalElements.Select Radio Button By Value    Yes
    Click Continue on the page

    Page should contain     When was the test taken?
    Input the day was the test taken    25  02  2021
    Click Continue on the page

    Page should contain     Do you know the test barcode?
    globalElements.Select Radio Button By Value     Yes-barcode
    Input the test barcode      ABC12345678
    Click Continue on the page

    Page should contain     What mobile phone number was used to book the test?
    Input the mobile phone number was used to book the test     +447700900982
    Click Continue on the page

    Page should contain     Do you know the date of birth of the person who took the test?
    globalElements.Select Radio Button By Value    Yes
    Input the day of your birth     12  12  2054
    Click Continue on the page
    Page should contain     Date of birth must be in the past

    Input the day of your birth     £$  £$  £$£%
    Click Continue on the page
    Page should contain     Date of birth must be a real date

    globalElements.Select Radio Button By Value    No
    Click Continue on the page
    Page should contain     Do you know the home address of the person who took the test?
    Click GoBack

    Page should contain     Do you know the date of birth of the person who took the test?
    globalElements.Select Radio Button By Value    Yes
    Input the day of your birth     12  12  2000
    Click Continue on the page
    Page should contain     Do you know the home address of the person who took the test?


