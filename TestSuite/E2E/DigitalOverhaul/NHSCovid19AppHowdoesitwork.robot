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
${testing-for-care-home}            //span[contains(text(),'Testing for care homes')]
${travel-to}                        //span[contains(text(),'Travel to England')]
${work-place}                       //h1[@id='workplace,-organisation-or-care-home-guidance']
${app-works}                        //*[@id="what-the-app-does-and-how-it-works"]
${about-your-nhs-accout}            (//a[@class='nhsuk-breadcrumb__link'])[2]
${what-the-app-does}                 //button[@id='what-the-app-does-and-how-it-works-header']
${app-does-link}                     //a[@href="https://www.gov.uk/government/publications/nhs-covid-19-app-user-guide/nhs-covid-19-app-what-the-app-does"]
${app-does-link2}                    //a[@href="https://www.gov.uk/government/publications/nhs-covid-19-app-user-guide/nhs-covid-19-app-how-the-app-works"]
${nhs-app-new-link}                  //a[contains(text(),'NHS App (opens in new window).')]
*** Test Cases ***
Testing NHS Covid-19 app Links and navigation
    [Tags]  TTCS20-4074   TTCS20-5839-01
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     5
    page should contain   The NHS COVID-19 app
    page should contain  Using and setting up the app
    page should contain   What the app does and how it works
    page should contain   Troubleshooting and technical information
    page should contain   Data and privacy
    click element    ${app-works}
    page should contain   The NHS COVID-19 app will close down on 27 April 2023
    page should contain   All the app features will be working until that date.
    page should contain   Even though the app is closing down, please follow the latest guidance to protect yourself and others.
    page should contain   This includes reporting NHS lateral flow test results on GOV.UK. If you're eligible for COVID-19 treatment, you must report your result so the NHS can contact you about treatment.
    Page Should Contain   Read more about why the app is closing down on GOV.UK
    page should contain   What the app does and how it works
    page should contain   Use the links to find information on what the app does and how it works. If you need more help, you can make an enquiry.
    page should contain   The app is available to anyone living in England and Wales. This means people in Wales can also get help with the app here.
    page should contain   We can help you with enquiries about the NHS COVID-19 app. The app includes a number of features to protect you, including contact tracing and a symptoms checker.
    click element    ${what-the-app-does}
    page should contain link   Find out what the app does (opens in new window).
    page should contain link   Find out how the app works (opens in new window).
    page should contain link   NHS App (opens in new window).
    page should contain link   contact the NHS App team (opens in new window).
    sleep  4s
    #click link  www.gov.uk/government/publications/nhs-covid-19-app-user-guide/nhs-covid-19-app-what-the-app-does
    click element  ${app-does-link}
    Switch Window   new
    page should contain      NHS COVID-19 app: what the app does
    close window
    Switch Window   main
    #click link   https://www.gov.uk/government/publications/nhs-covid-19-app-user-guide/nhs-covid-19-app-how-the-app-works
    click element  ${app-does-link2}
    Switch Window   new
    page should contain     NHS COVID-19 app: how the app works
    close window
    Switch Window   main
    #click link  https://www.nhs.uk/nhs-app/
    click element  ${nhs-app-new-link}
    Switch Window   new
    page should contain   NHS App and your NHS account
    page should contain link  About your NHS account
    page should contain link  NHS account help and support
    page should contain link  NHS account legal and cookies
    click link  https://www.nhs.uk/nhs-app/about-the-nhs-app/
    page should contain  About your NHS account
    page should contain link  Find out more about who can have an NHS account
    click element   ${about-your-nhs-accout}
    click link   https://www.nhs.uk/nhs-app/nhs-app-help-and-support/
    page should contain  NHS account help and support
    page should contain  Everything you need to know about your NHS account and the NHS App, to help you access NHS services online.
    page should contain link  Get help for mental health now
    page should contain link  Get urgent medical help now
    page should contain link  Getting started
    page should contain link  Account and settings
    click element   ${about-your-nhs-accout}
    click link   https://www.nhs.uk/nhs-app/nhs-app-legal-and-cookies/
    page should contain   NHS account legal and cookies
    page should contain   View our privacy policy, terms of use and other key documents.
    page should contain link  NHS account cookies policy
    page should contain link  NHS account accessibility statement
    page should contain link  NHS account terms of use
    page should contain link  NHS account privacy policy
    page should contain link  NHS App open source licences
    click element   ${about-your-nhs-accout}
    close window
    Switch Window   main
    page should contain   What the app does and how it works







