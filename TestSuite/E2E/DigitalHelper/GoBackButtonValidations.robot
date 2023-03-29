*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup
Resource    ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LandingPage.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/GlobalButtons.robot
Resource    ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/LongForm.robot

Suite Setup     Open Browser, Go To Digital Helper and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***
${title}            //h1[contains(text(),'Get help with coronavirus (COVID-19) enquiries and complaints')]
${title1}           //h1[contains(@class,'nhsuk-heading-xl nhsuk-u-margin-bottom-4')]
${GoBackLink}       //a[@class='nhsuk-back-link__link']

*** Test Cases ***
Validate 'Go Back' Link
    [Tags]      CS20-970
    Go To Digital Helper
    Go Back Link Validation

Validate 'Go Back' value selected
    [Tags]  TTCS20-2139
    Go To Digital Helper
    Go Back selection validation

*** Keywords ***
Go Back Link Validation
    ${titleofDHLandingPage}=  Get Text    ${title}
    Log to Console    ${titleofDHLandingPage}
    Click Get Started
    Sleep  3s
    ${NextDHLandingPage}=  Get Text    ${title1}
    Log to Console    ${NextDHLandingPage}
    Sleep  3s
    set focus to element  ${GoBackLink}
    Click GoBack Link
    Sleep  3s
    ${titleofDHLandingPage1}=  Get Text    ${title}
    Log to Console    ${titleofDHLandingPage1}
    should be equal as strings    ${titleofDHLandingPage}  Get help with coronavirus (COVID-19) enquiries and complaints

Go Back selection validation
        Sleep  2s
        Click Get Started
        Click Enquiry Button
        Click Continue
        #Click Contact Tracing button
        Click staying at home button
        Click GoBack Link
        Radio Button Should Be Set To  radio-input-  Enquiry
