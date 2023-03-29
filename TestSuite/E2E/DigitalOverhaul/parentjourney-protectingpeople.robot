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
${higher-risk}                  //*[@class='nhsuk-details__summary-text']
${link-find}                    //a[contains (text(), "Find out who can get a free NHS COVID-19 test (opens in new window).")]
${getting-test}                 //*[@id='getting-a-test']
${covid-19-testing-link}        //a[contains(text(), "COVID-19 testing")]
${need-help}                    //span[contains(text(), "I need help getting a test")]
${protecting-people}            //*[@id='protecting-people-at-higher-risk-from-covid-19']
${advice-people}                //*[@id='advice-for-people-at-higher-risk-from-covid-19']
${advice-people-link}           //span[contains(text(),"Advice for people at higher risk")]
${protecting-people-link}       //a[contains(text(),"Protecting people at higher risk")]
${testing-for-people}           //*[@id='testing-for-people-at-higher-risk-from-covid-19']
${testing-for-people-link}      //span[contains(text(),"Testing for people at higher risk")]
${vaccines-for-people}          //*[@id='vaccines-for-people-at-higher-risk-from-covid-19']
${vaccines-for-people-link}     //span[contains(text(),"Vaccines for people at higher risk")]
${treatments-for-people}        //*[@id='treatments-for-people-at-highest-risk-from-covid-19']
${treatments-for-people-link}   //span[contains(text(),"Treatments for people at highest risk")]




*** Test Cases ***
Protecting People Journey
    [Tags]      TTCS20-5413    TTCS20-5729-01
    Go To Digital Overhaul
    Page should contain     Get help with coronavirus (COVID-19) enquiries and complaints

    Execute javascript  window.scrollTo(0,800)
    Sleep  3s

    page should contain    Advice for people at higher risk from COVID-19. For example, getting a test or antiviral treatments.
    page should contain    Protecting people at higher risk from COVID-19
    click element    ${protecting-people}
    Sleep  3s
    page should contain    Protecting people at higher risk
    page should contain    Advice for people at higher risk from COVID-19
    page should contain    Advice for people whose immune system means they are at higher risk
    page should contain    Testing for people at higher risk from COVID-19
    page should contain    Testing for people at higher risk
    page should contain    Vaccines for people at higher risk from COVID-19
    page should contain    Vaccine guidance for people whose immune system means they are at higher risk
    page should contain    Treatments for people at highest risk from COVID-19
    page should contain    Treatments for people at highest risk
    click element    ${advice-people}
    Sleep  3s
    page should contain   Advice for people at higher risk from COVID-19
    page should contain   Use the link below to find information. If you need more help, you can make an enquiry.
    page should contain   Advice for people at higher risk
    Page Should Contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.
    Page Should Contain Element    //span[@id='helpButtonSpan']
    click element    ${advice-people-link}
    Sleep  3s
    page should contain link   Read the advice for people whose immune system means they are at higher risk (opens in new window).
    Sleep  3s
    click element   ${protecting-people-link}
    Sleep  3s
    click element    ${testing-for-people}
    page should contain   Testing for people at higher risk from COVID-19
    page should contain   Use the link below to find information. If you need more help, you can make an enquiry.
    click element   ${testing-for-people-link}
    page should contain link   Find out who can get a free NHS COVID-19 test (opens in new window).
    Page Should Contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.
    Page Should Contain Element    //span[@id='helpButtonSpan']
    Sleep  3s
    click element   ${protecting-people-link}
    Sleep  3s
    click element   ${vaccines-for-people}
    Sleep  3s
    page should contain   Vaccines for people at higher risk from COVID-19
    page should contain   Use the link below to find information.
    click element   ${vaccines-for-people-link}
    page should contain link   How to get an additional primary dose of the COVID-19 vaccine (opens in new window).
    Sleep  3s
    click element   ${protecting-people-link}
    Sleep  3s
    click element   ${treatments-for-people}
    Sleep  3s
    page should contain    Treatments for people at highest risk from COVID-19
    page should contain    Use the links below to find information. If you need more help, you can make an enquiry.
    Page Should Contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.
    Page Should Contain Element    //span[@id='helpButtonSpan']
    click element   ${treatments-for-people-link}
    Sleep  3s
    page should contain link   Treatments for COVID-19 (opens in new window).
    page should contain link   Highest-risk patients eligible for new COVID-19 treatments (opens in a new window)






