*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/GlobalButtons.robot

Suite Setup     Open Browser, Go To Digital Helper and Accept Cookies
Suite Teardown  Close Browser

*** Test Cases ***
Verify Accessibility Statement Content
    [Tags]  CS20-360
    [Documentation]  This test checks the correct page headings are present, it does NOT check all page content
    Open Accessibility statement

    Page Should Contain     Accessibility Statement
    Page Should Contain     Technical information about the Test and Trace Digital service website’s accessibility
    Page Should Contain     How accessible the website is
    Page Should Contain     Reporting accessibility problems with this website
    Page Should Contain     Enforcement procedure
    Page Should Contain     Preparation of this accessibility statement

    Close Window
    Switch Window    main

Verify Cookies Policy Content
    [Documentation]  This test checks the correct page headings are present, it does NOT check all page content
    Open Cookies Policy

    Page Should Contain     Cookie Policy
    Page Should Contain     Necessary Cookies
    Page Should Contain     Cookie name
    Page Should Contain     Duration
    Page Should Contain     Cookie Type
    Page Should Contain     Description

    Close Window
    Switch Window    main


Verify Privacy Policy Content
    [Documentation]  This test checks the correct page headings are present, it does NOT check all page content
    Open Privacy Policy
    Switch Window    new
    Page Should Contain         Our policies
    Page Should Contain         Policy for
    Page Should Contain Link    https://www.gov.uk/government/publications/coronavirus-covid-19-testing-privacy-information
    Page Should Contain Link    https://contact-tracing.phe.gov.uk/help/privacy-notice
    Page Should Contain Link    https://www.nhs.uk/our-policies/

    Close Window
    Switch Window    main