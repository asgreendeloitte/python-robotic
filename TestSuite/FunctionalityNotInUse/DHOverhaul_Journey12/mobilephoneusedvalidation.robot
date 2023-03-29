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
${completingform}     //*[@class='nhsuk-error-message']
${err_msg1}     Select who you are completing this form for
${err_msg3}     Select yes if the test was taken for international travel


*** Test Cases ***
Covid-19 Testing was the test taken for International Travel - error message validation
    [Tags]  TTCS20-2203
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     2
    Getting a test for covid-19 testing
    Page should contain     Getting a test
    Page should contain     Use the link below to find information on getting a test. If you need more help, you can make an enquiry.
    Click Submit form
    Page should contain     Who are you completing this form for?
    Select myself Radio Button
    Click Continue on the page
    globalElements.Select Radio Button By Value    PCR test
    Click Continue on the page
    globalElements.Select Radio Button By Value    No
    Click Continue on the page
    page should contain   Do you know the test barcode?
    globalElements.Select Radio Button By Value    No
    Click Continue on the page
    page should contain   What mobile phone number was used to book the test?
    Click Continue on the page
    page should contain  Enter mobile phone number
    Input the mobile phone number was used to book the test     +4477jfdjfbd33
    Click Continue on the page
    page should contain  Enter a mobile phone number in the correct format
    Input the mobile phone number was used to book the test     ...&*"£
    Click Continue on the page
        page should contain  Enter a mobile phone number in the correct format
     Input the mobile phone number was used to book the test     +4477jfdjfbd33
    Click Continue on the page
    page should contain  Enter a mobile phone number in the correct format
    Input the mobile phone number was used to book the test     447
    Click Continue on the page
    page should contain  Enter a mobile phone number in the correct format
    Input the mobile phone number was used to book the test     how are you today
    Click Continue on the page
    page should contain  Enter a mobile phone number in the correct format
    Input the mobile phone number was used to book the test     +447700900982+447700900982+447700900982111
    Click Continue on the page
    page should contain  Enter a mobile phone number in the correct format
    Input the mobile phone number was used to book the test     +447700900982
    Click Continue on the page
    page should contain   Are you fully vaccinated?
    Click GoBack
    Input the mobile phone number was used to book the test     4477
    Click Continue on the page
    page should contain   Are you fully vaccinated?
    Click GoBack
    click on I dont know mobile number
    page should contain   Are you fully vaccinated?



