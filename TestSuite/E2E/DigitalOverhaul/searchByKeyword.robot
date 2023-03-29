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
Search by Keyword - Results returned
    [Tags]  TTCS20-2769-01      TTCS20-2109-10
    Click See all topics
    page should contain     See all topics
    Search by keyword       Vaccine
    Page Should Contain     results found
    Page Should Contain     COVID-19 vaccinations
    Capture Page Screenshot

Search by Keyword - Complaints
    [Tags]  TTCS20-2769-02
    Click See all topics
    Search by keyword       Complaints
    Page Should Contain     Make a complaint about a COVID-19 service
    Page Should Contain     You can make a formal complaint if you have had an unsatisfactory experience with a COVID-19 service. For example, delays in a service, wrong advice given, or staff attitude.
    Page Should Contain     Complaints are responded to within 20 working days.
    Capture Page Screenshot

Search by Keyword - No results
    [Tags]  TTCS20-2769-03
    Click See all topics
    Search by keyword       Jurassic Park
    Page Should Contain     0 results found
    Capture Page Screenshot

Search by Keyword - Complaints
    [Tags]  TTCS20-5410
    Click See all topics
    Search by keyword       antiviral
    page should contain link   Advice for people at higher risk from COVID-19
    page should contain link   Testing for people at higher risk from COVID-19
    page should contain link   Vaccines for people at higher risk from COVID-19
    page should contain link   Treatments for people at highest risk from COVID-19
    Capture Page Screenshot