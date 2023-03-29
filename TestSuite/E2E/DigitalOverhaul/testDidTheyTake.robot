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

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser


*** Test Cases ***
Reviewing the diffents ways to take a COVID-19 test
    [Tags]  TTCS20-3378
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Find a test result for covid-19 testing
    Click Submit form
    Sleep  2s
    Select someone else Radio Button
    Click Continue on the page

    Page should contain    Tell us about the person you're completing this form for
    Input their First Name      Alan
    Input their Last Name       Smithee
    Click Continue on the page

    Page should contain    What is your relationship to this person?
    Click relative as relation
    Click Continue on the page

    Page should contain    Which COVID-19 test did they take?
    Page Should Contain Radio Button    id:pcr-test
    Page Should Contain Radio Button    id:rapid-lateral-flow-test
    Page Should Contain Radio Button    id:antibody-covid-19-blood-test
    Page Should Contain Radio Button    id:not-sure
    capture page screenshot

    globalElements.Select Radio Button By Value    PCR test
    Click Continue on the page

    Page should contain     Was the test taken for international travel?
    Page should contain     These are COVID-19 tests you may need to take before, during or after a trip abroad.
    Page Should Contain Radio Button    id:yes
    Page Should Contain Radio Button    id:no
    capture page screenshot
    globalElements.Click GoBack

    globalElements.Select Radio Button By Value    Rapid lateral flow test
    Click Continue on the page

    Page should contain     Was the test taken for international travel?
    Page should contain     These are COVID-19 tests you may need to take before, during or after a trip abroad.
    Page Should Contain Radio Button    id:yes
    Page Should Contain Radio Button    id:no
    capture page screenshot
    globalElements.Click GoBack

    globalElements.Select Radio Button By Value   Antibody COVID-19 blood test
    Click Continue on the page

    Page should contain     Was the test taken for international travel?
    Page should contain     These are COVID-19 tests you may need to take before, during or after a trip abroad.
    Page Should Contain Radio Button    id:yes
    Page Should Contain Radio Button    id:no
    capture page screenshot
    globalElements.Click GoBack

    globalElements.Select Radio Button By Value   Not sure
    Click Continue on the page
    page should contain     Can you provide more detail about the enquiry?
    page should contain     Do not give personal financial information, like your National Insurance number or credit card details. Do not include characters like £ : ; or %
    page should contain     Enquiry details
    capture page screenshot