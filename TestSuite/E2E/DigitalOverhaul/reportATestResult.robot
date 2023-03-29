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
${title}            //h1[contains(text(),'Get help with coronavirus (COVID-19) enquiries and complaints')]
${title1}           //h1[contains(@class,'nhsuk-heading-xl nhsuk-u-margin-bottom-4')]
${GoBackLink}       //a[@class='nhsuk-back-link__link']

*** Test Cases ***
Rapid lateral flow test - Report a test result
    [Tags]      TTCS20-2206-01
    Click covid-19 testing topic
    Click report a test result
    Click reporting your test result
    Click Element   //a[contains(text(), 'Find out how to report your rapid lateral flow test result (opens in new window).')]
    capture page screenshot
    Switch Window   Test results for COVID-19 and how to report them - NHS
    Page Should Contain     Test results for COVID-19 and how to report them


Rapid lateral flow test - Understand a test result
    [Tags]      TTCS20-2206-02
    Open Browser, Go To Digital Overhaul And Accept Cookies
    Click covid-19 testing topic
    Click report a test result
    Click understanding your test result
    Click Element   //a[contains(text(), 'Find out what your test result means (opens in new window).')]
    capture page screenshot
    Switch Window   Test results for COVID-19 and how to report them - NHS
    Page Should Contain     What your COVID-19 test results means


Need more help? Make an enquiry
    [Tags]      TTCS20-2206-03
    Open Browser, Go To Digital Overhaul And Accept Cookies
    Click covid-19 testing topic
    Click report a test result
    Page Should Contain     Need more help? Make an enquiry
    Click Start Again
    Page Should Contain     COVID-19 testing