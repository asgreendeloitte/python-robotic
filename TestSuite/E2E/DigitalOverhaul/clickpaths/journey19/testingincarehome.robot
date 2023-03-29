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
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/intnlTravel.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Variables ***
${testing-for-care-home}   //span[contains(text(),'Testing for care homes')]
${travel-to}     //span[contains(text(),'Travel to England')]
${work-place}    //h1[@id='workplace,-organisation-or-care-home-guidance']

*** Test Cases ***
Testing in care home validations
    [Tags]  TTCS20-2170  TTCS20-2168-1   TTCS20-3665
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     4
    page should contain   Workplace, organisation or care home guidance
    Testing in a carehome

    Page should contain     Testing in a care home
    Page should contain     Use the links below to find information on testing in care homes. If you need more help, you can make an enquiry.
    click element   ${testing-for-care-home}

    page should contain link  Get coronavirus tests for a care home (opens in new window).
#    page should contain link  Read the guidance for staff, patients and residents in health and social care settings (opens in new window)
    click link    https://www.gov.uk/apply-coronavirus-test-care-home
    Switch Window   new
    page should contain  Get coronavirus tests for a care home
    page should contain   Get coronavirus (COVID-19) testing kits to test the residents and staff of your care home.
    page should contain   The staff and residents do not need to have coronavirus symptoms for you to get the tests.
    page should contain   Who can make the application
    close window
    Switch Window   main
#    click link  https://www.gov.uk/government/publications/covid-19-management-of-exposed-healthcare-workers-and-patients-in-hospital-settings/covid-19-management-of-exposed-healthcare-workers-and-patients-in-hospital-settings
#    Switch Window   new
#    page should contain  [Withdrawn] COVID-19: management of staff and exposed patients or residents in health and social care settings
#    page should contain  This guidance was withdrawn on 4 April 2022
#    close window
#    switch window  main
    Click Start Again

    page should contain   Workplace, organisation or care home guidance
    Testing in a carehome
    Click Submit form

    page should contain  Who are you completing this form for?
    Select myself Radio Button
    Click Continue on the page
    page should contain  Can you provide more detail about the enquiry?
     page should contain  Do not give personal financial information, like your National Insurance number or credit card details. Do not include characters like £ : ; or %
     page should contain  Enquiry details


