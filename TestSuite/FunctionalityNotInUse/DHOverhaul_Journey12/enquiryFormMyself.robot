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

Enquiry on self-isolation Supprt - User shown an error when no radio button of who we are is selected when
    [Tags]  TTCS20-3321
    Contniue without selecting who you are while submitting an enquiry form  1
    Check for error message
    Page Should Contain        Select who you are completing this form for

Enquiry confirmation - Form submitted (myself)
    [Tags]  TTCS20-2796_01 [Tags]  TTCS20-3321_02
    Submit an enquiry form as myself for self isolation support     1
    Page Should Contain         Form submitted

Enquiry form for myself - check the contents of the page that tells me my enquiry has been submitted
    [Tags]  TTCS20-2796_02
    Submit an enquiry form as myself for self isolation support     1
    Check Confirmation Page Contents
    Tap back to home button
    Sleep   2s
    Page Should Contain     Get help with coronavirus (COVID-19) enquiries and complaints


Enquiry Form myself - What are your contact details?
    [Tags]  TTCS20-2794
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic    1
    Click Submit form
    Sleep  2s
    Select myself Radio Button
    Click Continue on the page
    Enter details in text area  test
    Click Continue on the page
    Page should contain     What are your contact details?

    Click Continue on the page
    Page should contain     Enter your first name
    Page should contain     Enter your last name

    Input your First Name   adadasdasdnednweonasdkamsdlnwelfnasaldnalsndweondoansldnqwoidnalsndwiodnalsndqwoidnalsdnqwidnandoiwqioqndoinasndqwionqoidnoainsoinoqwindionasldnqwiondoainsdnqwinaslndqowidnasndasdasdnasdasdasdasdasdadasdasdasdadasdasdasdasdasdwedasdasdasdasdadasd1234567890
    Input your Last Name    adadasdasdnednweonasdkamsdlnwelfnasaldnalsndweondoansldnqwoidnalsndwiodnalsndqwoidnalsdnqwidnandoiwqioqndoinasndqwionqoidnoainsoinoqwindionasldnqwiondoainsdnqwinaslndqowidnasndasdasdnasdasdasdasdasdadasdasdasdadasdasdasdasdasdwedasdasdasdasdadasd1234567890
    Input your mobile phone number (Optional)   012345678910111213141516171819202122232425262728293031323334353637383940
    Click Continue on the page
    Page should contain     Your first name must be 255 characters or fewer
    Page should contain     Your last name must be 255 characters or fewer
    Page should contain     Enter a mobile phone number in the correct format, like 07771 900 900

    Input your First Name   @£$%$%Q$%£$
    Input your Last Name    ££$£$Q£$£$$£$£
    Input your mobile phone number (Optional)   0+!*&@*£&@*£
    Click Continue on the page
    Page should contain     Your first name must only include letters a to z, numbers, spaces, hyphens, apostrophes and exclamation marks
    Page should contain     Your last name must only include letters a to z, numbers, spaces, hyphens, apostrophes and exclamation marks
    Page should contain     Enter a mobile phone number in the correct format, like 07771 900 900

    Input your First Name   FUCKE1234567
    Input your Last Name    FUCKE1234567
    Input your mobile phone number (Optional)   FUCKE1234567
    Click Continue on the page
    Page should contain     Your first name must not include profanities
    Page should contain     Your last name must not include profanities
    Page should contain     Enter a mobile phone number in the correct format, like 07771 900 900

    Input your First Name   Test
    Input your Last Name    Last
    Input your mobile phone number (Optional)   077556644553

    Click Continue on the page
    Page should contain     What is your email address?

Enquiry Form myself - Can you provide more detail about the enquiry?
    [Tags]  TTCS20-2792
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic    1
    Click Submit form
    Sleep  2s
    Select myself Radio Button
    Click Continue on the page
    Page should contain     Can you provide more detail about the enquiry?
    Click Continue on the page
    Page should contain     Enter the reason for your enquiry

    Enter details in text area  £$%^$^&$&^$&^%$%&^
    Click Continue on the page
    Page should contain     Your enquiry must only include letters a to z, numbers, spaces, hyphens, apostrophes and exclamation marks

    Enter details in text area  FUCK123456789
    Click Continue on the page
    Page should contain     Your enquiry must not include profanities

    Enter details in text area  test
    Click Continue on the page
    Page should contain     What are your contact details?