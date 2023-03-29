*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/nhsCovid19App.robot


Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser

*** Test Cases ***

COVID-19 App - The NHS COVID-19 App tile route - Submit enquiry for myself
    [Tags]      TTCS20-4084-05      TTCS20-4073     TTCS20-4059

    Go To Digital Overhaul
    Click the nhs covid-19 app link
    Page should contain     The NHS COVID-19 app
    Sleep   2s
    Click using and setting up the app tile
    Page should contain     Using and setting up the app
    Click using and setting up the app expander
    Page should contain     Find out who can use the app (opens in new window).
    Page should contain     Find out how to use the app (opens in new window).
    Page should contain     Find out how to download and set up the app (opens in new window).

    Click on find out who can use the app works that opens in a new window
    Sleep   2s
    Switch Window   new
    Page should contain     NHS COVID-19 app: who can use the app
    Switch Window   main

    Click on how to use the app works that opens in a new window
    Sleep   2s
    Switch Window   new
    Page should contain     NHS COVID-19 app: how to use the app
    Switch Window   main

    Click on how to download and set up the app that opens in a new window
    Sleep   2s
    Switch Window   new
    Page should contain     NHS COVID-19 app: download and set up guide
    Switch Window   main

    Click Submit form

    Page should contain     Who are you completing this form for?
    Select myself Radio Button
    Click Continue on the page

    Page should contain     Can you provide more detail about the enquiry?
    Enter details in text area      testing
    Click Continue on the page

    Page should contain     What are your contact details?
    Input your First Name   Firstname
    Input your Last Name    Lastname
    Input your mobile phone number (Optional)   07766556677
    Click Continue on the page

    Page should contain     What is your email address?
    Enter email address     testtrace@gmail.com
    Confirm email address   testtrace@gmail.com
    Click Continue on the page

    Page should contain     Check your answers before submitting your enquiry
    Click Change button to change the email address
    Change email address    testtrace4@gmail.com
    Confirm changed email address    testtrace4@gmail.com
    Click Continue on the page

    Page should contain     Check your answers before submitting your enquiry
    Page should contain     Completing form for
    Page should contain     Enquiry details
    Page should contain     Name
    Page should contain     Email address
    Page should contain     Mobile phone number

    Submit enquiry form
    Page Should Contain         Form submitted
    Page Should Contain          Your case number is
    Wait Until Element Is Visible     ${Case-number-elem}
    ${Case-number}=     Get Text      ${Case-number-elem}
    Length Should Be            ${Case-number}     8
   # Perform multipart email verification   ${subject-text-Enquiry}  ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}
