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
Checking mail address section
    [Tags]  TTCS20-3327
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     1
    Click Submit form
    Sleep  2s
    Select myself Radio Button
    Click Continue on the page
    Enter details in text area  test
    Click Continue on the page
    Input your First Name   Test
    Input your Last Name    Test
    Input your mobile phone number (Optional)   077556644553
    Click Continue on the page
    Click Continue on the page

    Page should contain     What is your email address?

    Enter email address     adadasdalksdlaksjdlkajdlaksjdlkasjdkljqwiodjoaisjdoijoqiwjdoiqj12892947198274asld@gmail.com
    Confirm email address   adadasdalksdlaksjdlkajdlaksjdlkasjdkljqwiodjoaisjdoijoqiwjdoiqj12892947198274asld@gmail.com
    Click Continue on the page
    Page should contain     Your email address but be 80 characters or fewer
    Delete email address
    Delete confirm email address

    Enter email address     	test.gmail.com
    Confirm email address   	test.gmail.com
    Click Continue on the page
    Page should contain      Enter an email address in the correct format, like name@example.com
    Delete email address
    Delete confirm email address

    Enter email address     fuck@gmail.com
    Confirm email address   fuck@gmail.com
    Click Continue on the page
    Page should contain     Your email address must not include profanities
    Delete email address
    Delete confirm email address

    Enter email address     test4
    Confirm email address   test4
    Click Continue on the page
    Page should contain     Enter an email address in the correct format, like name@example.com

    Delete email address
    Delete confirm email address

    Enter email address     testtrace4@gmail.com
    Confirm email address   testtrace4@gmail.com
    Click Continue on the page
    Page should contain     Check your answers before submitting your enquiry






