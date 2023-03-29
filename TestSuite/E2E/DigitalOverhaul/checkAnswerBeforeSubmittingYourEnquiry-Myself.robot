*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/complaint.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/intnlTravel.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***
Make an Enquiry for myself - International Travel
    [Tags]  TTCS20-3659
    click on the get help link
    Get help and make an enquiry about the topic     3
    Page should contain     International travel
    Select travelling abroad during COVID-19
    Page should contain     Travelling abroad during COVID-19
    Click Submit form
    Select myself Radio Button
    Click Continue on the page
    page should contain     Have you arrived in the UK from abroad?
    Select Yes radio button
    Input the day was the test taken     30  03  2021
    Click Continue on the page
    Page should contain     Are you fully vaccinated?
    Select Yes radio button
    Click Continue on the page
    Enter details in text area  test
    Click Continue on the page
    Input your First Name   Firstname
    Input your Last Name    Lastname
    Input your mobile phone number (Optional)   07766556677
    Click Continue on the page
    Page should contain     What is your email address?
    Enter email address     testtrace4@gmail.com
    Confirm email address   testtrace4@gmail.com
    Click Continue on the page
    Check Change button to change the vaccination status

    ${Arrived_from_abroad_status_1}=     Get Text      //div[@id="arrived-from-abroad"]/dd

    Click Change button to change the vaccination status
    Select No radio button
    Click Continue on the page
    Click Continue on the page
    Click Continue on the page
    Confirm email address   testtrace4@gmail.com
    Click Continue on the page

    ${Arrived_from_abroad_status_2}=     Get Text      //div[@id="arrived-from-abroad"]/dd
    Run Keyword If    "${Arrived_from_abroad_status_1}" != "${Arrived_from_abroad_status_2}"    Log    True

    page should contain     Completing form for
    page should contain     Myself

    page should contain     Arrived from abroad
    page should contain     Yes

    page should contain     Arrival date
    page should contain     30/03/2021

    page should contain     Vaccinated
    page should contain     No

    page should contain     Enquiry details
    page should contain     test

    page should contain     Name
    page should contain     Firstname Lastname

    page should contain     Email address
    page should contain     testtrace4@gmail.com

    page should contain     Mobile phone number
    page should contain     07766556677

    Submit enquiry form