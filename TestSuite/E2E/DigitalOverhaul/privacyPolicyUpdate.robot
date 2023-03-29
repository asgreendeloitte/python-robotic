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
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/gettingATest.robot


Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Variables ***
${deny-nhs-cookies-btn}            //button[@id='nhsuk-cookie-banner__link_accept']

*** Test Cases ***
Checkiing the differents labels for the cookies policy
    [Tags]  TTCS20-4476
    Go To Digital Overhaul
    Open Privacy Policy
    Page Should Contain     Privacy policy
    Page Should Contain     Enquiries and Complaints, NHS Test and Trace
    Page Should Contain     Summary of policy
    SCROLL ELEMENT INTO VIEW    //h2[@id="how-we-collect"]
    Page Should Contain     Who is the Data Controller?
    Page Should Contain     What data we collect
    Page Should Contain     How we collect your information
    Page Should Contain     The purposes we use your information for
    Page Should Contain     Sharing your information
    Page Should Contain     With data processors
    Page Should Contain     How we protect your information
    Page Should Contain     Where we store your information
    Page Should Contain     How long we keep your information
    Page Should Contain     Our legal basis to use your information
    Page Should Contain     Your rights over your information
    Page Should Contain     Our duty of confidentiality
    Page Should Contain     Automated decision making or profiling
    Page Should Contain     How to find out more or raise a concern
    Page Should Contain     Changes to this policy
    Page Should Contain     This privacy policy was last updated May 2022.







