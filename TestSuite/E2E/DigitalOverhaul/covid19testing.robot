*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  ImapLibrary2

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/homeAddress.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Flows/emailVerification.robot

Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***

${covid-19-testing}             //*[@id='covid-19-testing']
${testing-people}               //*[@id='testing-for-people-at-higher-risk-from-covid-19']
${higher-risk}                  //button[@id='testing-for-people-at-higher-risk-header']
${link-find}                    //a[contains (text(), "Find out who can get a free NHS COVID-19 test (opens in new window).")]
${getting-test}                 //*[@id='getting-a-test']
${covid-19-testing-link}        //a[contains(text(), "COVID-19 testing")]
${need-help}                    //span[contains(text(), "I need help getting a test")]

*** Test Cases ***
Covid 19 Testing
    [Tags]      TTCS20-5430    TTCS20-5420
    Go To Digital Overhaul
    Page should contain     Get help with coronavirus (COVID-19) enquiries and complaints

    Execute javascript  window.scrollTo(0,800)
    Sleep  3s
    page should contain    COVID-19 testing
    page should contain    Get help with a test, including who can get a free NHS test and reporting your results.
    click element    ${covid-19-testing}
    Sleep   3s
    page should contain    COVID-19 testing
    page should contain    Getting a test
    page should contain    Report a test result
    page should contain    Testing for people at higher risk from COVID-19
    page should contain    NHS tests for people at higher risk
    click element       ${getting-test}
    sleep  4s
    page should contain    Getting a test
    page should contain    Use the link below to find information on getting a test. If you need more help, you can make an enquiry.
    page should contain    I need help getting a test
    click element     ${need-help}
    page should contain link  Find out who can get a free NHS COVID-19 test (opens in new window).
    click element   ${link-find}
    Switch Window   new
    Page should contain     Who can get a free NHS COVID-19 rapid lateral flow test
    Switch Window   main
    click element   ${covid-19-testing-link}
    Sleep  3s
    click element       ${testing-people}
    Sleep  3s
    page should contain    Testing for people at higher risk from COVID-19
    page should contain    Testing for people at higher risk
    click element        ${higher-risk}
    Sleep  4s
    page should contain link    Find out who can get a free NHS COVID-19 test (opens in new window).
    Sleep  3s
    click element   ${link-find}
    Switch Window   new
    Page should contain     Who can get a free NHS COVID-19 rapid lateral flow test
