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
Search by Keyword - Search all topics
    [Tags]  TTCS20-2769-01     TTCS20-2109-10     TTCS20-4002     TTCS20-3644
    Click See all topics
    page should contain     See all topics
    Search by keyword       International
    Page Should Contain     results found
    Page Should Contain     International Travel

    Search by keyword       Scotland
    Page Should Contain     Guidance for Scotland, Wales and Northern Ireland
    Click Element       //a[contains(text(), 'Guidance for Scotland (opens in new window)')]
    Switch Window   title=Coronavirus (COVID-19) in Scotland | NHS inform
    Click Accept Cookies if applicable
    Page Should Contain     Coronavirus (COVID-19)
    Page Should Contain     Scotland
    Switch Window

    Search by keyword       Wales
    Page Should Contain     Guidance for Scotland, Wales and Northern Ireland
    Click Element       //a[contains(text(), 'Guidance for Wales (opens in new window)')]
    Switch Window   title=Coronavirus (COVID-19) | Topic | GOV.WALES
    Click Accept Cookies if applicable
    Page Should Contain     Coronavirus (COVID-19)
    Page Should Contain     Wales
    Switch Window

    Search by keyword       Northern Ireland
    Page Should Contain     Guidance for Scotland, Wales and Northern Ireland
    Click Element       //a[contains(text(), 'Guidance for Northern Ireland (opens in new window)')]
    Switch Window   title=Coronavirus (COVID-19) | nidirect
    Click Accept Cookies if applicable
    Page Should Contain     COVID-19
    Page Should Contain     Northern Ireland
    Switch Window

    Search by keyword       MENTAL HEALTH
    Page Should Contain     Stay at home

    Search by keyword       STAY AT HOME
    Page Should Contain     Stay at home

    Search by keyword       SUPPORT
    Page Should Contain     Stay at home
    Click Element           //a[contains(text(), 'General guidance for staying at home')]
    Page should contain     General guidance for staying at home

    Go to       https://uat-dho.cs80.force.com/search
    Search by keyword       CONTACTS
    Page Should Contain     Close contacts


    Go to       https://uat-dho.cs80.force.com/search
    Search by keyword       CLOSE CONTACTS
    Page Should Contain     Close contacts
    Click Element       //a[contains(text(), 'If you are a close contact of someone with COVID-19')]
    page should contain     If you are a close contact of someone who has COVID-19 and live in the same household
    page should contain     If you are a close contact of someone who has COVID-19 and do not live with them

    Go to       https://uat-dho.cs80.force.com/search
    Search by keyword       MODERNA
    Page Should Contain     COVID-19 vaccinations

    Search by keyword       PFIZER
    Page Should Contain     COVID-19 vaccinations

    Search by keyword       VACCINATIONS
    Page Should Contain     COVID-19 vaccinations
    Click Element           //a[contains(text(), 'Book a COVID-19 vaccination')]
    Page should contain     Book a COVID-19 vaccination
    Page should contain     Book or manage your vaccination appointment

    Go to       https://uat-dho.cs80.force.com/search
    Search by keyword       VACCINATIONS
    Click Element            //a[contains(text(), 'NHS COVID Pass')]
    Page should contain     NHS COVID Pass
    Page should contain     What is a COVID Pass and how to get one

    Go to       https://uat-dho.cs80.force.com/search
    Search by keyword       VACCINATIONS
    Click Element          //a[contains(text(), 'Vaccine guidance')]
    Page should contain     Vaccine guidance
    Page should contain     COVID-19 vaccine guidance

    Go to                   https://uat-dho.cs80.force.com/search
    Search by keyword       NEGATIVE
    Page Should Contain     Covid-19 testing

    Search by keyword       VOID
    Page Should Contain     Covid-19 testing

    Search by keyword       HOLIDAY
    Page Should Contain     Covid-19 testing

    Click Element           //a[contains(text(), 'Getting a test')]
    Page should contain     Getting a test
    Page should contain     I need help getting a test

    Go to       https://uat-dho.cs80.force.com/search
    Search by keyword       HOLIDAY

    Click Element          //a[contains(text(), 'Report a test result')]
    Page should contain     Report a test result
    Page should contain     Reporting your test result
    Page should contain     Understanding your test result

    Go to       https://uat-dho.cs80.force.com/search
    Search by keyword       HOLIDAY

    Click Element       //a[contains(text(), 'Travelling abroad during COVID-19')]
    Page should contain     Travelling abroad during COVID-19
    Page should contain    Travel from England
    Page should contain    Travel to England

    Go to       https://uat-dho.cs80.force.com/search
    Search by keyword       HOLIDAY

    Click Element       //a[contains(text(), 'Find a test result')]
    Page should contain     Find a test result
    Page should contain     Receiving your test result

    Go to       https://uat-dho.cs80.force.com/search
    Search by keyword       HOLIDAY

    Click Element       //a[contains(text(), 'Home test kits')]
    Page should contain     Home test kits

    Go to                     https://uat-dho.cs80.force.com/search

    Search by keyword       RED LIST
    Page Should Contain     International Travel

    Search by keyword       PRIVATE TEST
    Page Should Contain     International Travel

    Search by keyword       DAY 2 TEST
    Page Should Contain     International Travel
    Click Element          //a[contains(text(), 'Travelling abroad during COVID-19')]
    Page should contain     Travelling abroad during COVID-19
    Page should contain    Travel from England
    Page should contain    Travel to England

    Go to                   https://uat-dho.cs80.force.com/search

    Search by keyword       DAY 2 TEST
    Page Should Contain     International Travel
    Click Element         //a[contains(text(), 'Red list countries and territories')]
    Page should contain     Red list countries and territories
    Page should contain    Red list countries and territories

    Go to                   https://uat-dho.cs80.force.com/search

    Search by keyword       DAY 2 TEST
    Page Should Contain     International Travel
    Click Element       //a[contains(text(), 'Guidance for Scotland, Wales and Northern Ireland')]
    Page should contain     Guidance for Scotland, Wales and Northern Ireland
    Page should contain    Scotland
    Page should contain    Wales
    Page should contain    Northern Ireland

    Go to                 https://uat-dho.cs80.force.com/search
    Search by keyword       REPORT
    Page Should Contain     Workplace, organisation or care home guidance

    Go to                    https://uat-dho.cs80.force.com/search
    Search by keyword       SCHOOL
    Page Should Contain     Workplace, organisation or care home guidance

    Go to                   https://uat-dho.cs80.force.com/search
    Search by keyword       BUSINESS
    Page Should Contain     Workplace, organisation or care home guidance

    Click Element           //a[contains(text(), 'Testing in a care home')]
    Page should contain     Testing in a care home
    Page should contain     Testing for care homes

    Go to                  https://uat-dho.cs80.force.com/search

    Search by keyword       BUSINESS
    Page Should Contain     Workplace, organisation or care home guidance

    Click Element          //a[contains(text(), 'Guidelines and safety for organisations')]
    Page should contain    Guidelines and safety for organisations
    Page should contain    Safety in the workplace

    Go to                   https://uat-dho.cs80.force.com/search
    Search by keyword       app
    Page Should Contain     The NHS COVID-19 app

    Search by keyword       Bluetooth
    Page Should Contain     The NHS COVID-19 app

    Search by keyword       SYMPTOMS
    Page Should Contain     The NHS COVID-19 app

    Click Element       //a[contains(text(), 'Using and setting up the app')]
    Page should contain    Using and setting up the app

    Go to                   https://uat-dho.cs80.force.com/search
    Search by keyword       SYMPTOMS
    Page Should Contain     The NHS COVID-19 app

    Click Element       //a[contains(text(), 'What the app does and how it works')]
    Page should contain     What the app does and how it works

    Go to                   https://uat-dho.cs80.force.com/search
    Search by keyword       SYMPTOMS
    Page Should Contain     The NHS COVID-19 app

    Click Element       //a[contains(text(), 'Troubleshooting and technical information')]
    Page should contain    Troubleshooting and technical information

    Go to                   https://uat-dho.cs80.force.com/search
    Search by keyword       SYMPTOMS
    Page Should Contain     The NHS COVID-19 app

    Click Element       //a[contains(text(), 'Data and privacy')]
    Page should contain     Data and privacy
