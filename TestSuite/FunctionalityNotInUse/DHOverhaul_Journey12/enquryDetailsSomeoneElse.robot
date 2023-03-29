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

Default Tags  TTCS20-2171  TTCS20-2171-1  TTCS20-2171-2   TTCS20-2171-3  TTCS20-2171-4 TTCS20-2171-5 TTCS20-2171-6

*** Test Cases ***
Happy path to tell us about the person who you are completing this form
    [Tags]  TTCS20-2171
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     1
    Click Submit form
    Sleep  2s
    Select someone else Radio Button
    Click Continue on the page
    Page should contain  Tell us about the person you're completing this form for

    Click Continue on the page
    Page Should contain     Enter their first name
    Page Should contain     Enter their last name

    Input their First Name    ~€@~€@/
    Input their Last Name    &/&%/
    Click Continue on the page
    Page Should contain     Their first name must only include letters a to z, numbers, spaces, hyphens, apostrophes and exclamation marks
    Page Should contain     Their last name must only include letters a to z, numbers, spaces, hyphens, apostrophes and exclamation marks

    Clear their First Name
    Clear their Last Name
    Input their First Name  adadasdasdnednweonasdkamsdlnwelfnasaldnalsndweondoansldnqwoidnalsndwiodnalsndqwoidnalsdnqwidnandoiwqioqndoinasndqwionqoidnoainsoinoqwindionasldnqwiondoainsdnqwinaslndqowidnasndasdasdnasdasdasdasdasdadasdasdasdadasdasdasdasdasdwedasdasdasdasdadasd1234567890
    Input their Last Name    adadasdasdnednweonasdkamsdlnwelfnasaldnalsndweondoansldnqwoidnalsndwiodnalsndqwoidnalsdnqwidnandoiwqioqndoinasndqwionqoidnoainsoinoqwindionasldnqwiondoainsdnqwinaslndqowidnasndasdasdnasdasdasdasdasdadasdasdasdadasdasdasdasdasdwedasdasdasdasdadasd1234567890
    Click Continue on the page
    Page Should contain     Their first name must be 255 characters or fewer
    Page Should contain     Their last name must be 255 characters or fewer
    Clear their First Name
    Clear their Last Name

    Input their First Name  Fuck
    Input their Last Name    Fucker
    Click Continue on the page
    Page Should contain     Their first name must not include profanities
    Page Should contain     Their last name must not include profanities
    Clear their First Name
    Clear their Last Name

    Input their First Name  Kevin
    Input their Last Name    Smith
    Click Continue on the page
    Page Should contain     What is your relationship to this person?

