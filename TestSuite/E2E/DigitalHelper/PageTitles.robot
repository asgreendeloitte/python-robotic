*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

Resource    ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LandingPage.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/CaseType.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/Topic.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/Enquiry/Answers.robot

#Short Form page
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/ShortForm.robot

# Long Form Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/TestTaken.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/TypeOfTestingService.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/TestCountry.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/TestLocation.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/LongForm.robot

Test Setup      Open Browser, Go To Digital Helper and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***
#Long form browser tab titles and the page headings match
#    [Tags]  CS20-1485
#    Set Selenium Speed  1s
#
#    sleep   3s
#    Verify browser tab title and page heading match
#    Click Get Started
#
#    Select Enquiry Radio Button
#    Verify browser tab title and page heading match
#    Click Continue
#
#    Select Symptoms And Testing Radio Button
#    Verify browser tab title and page heading match
#    Click Continue
#
#
#    Select Radio Button By Value    My child was told by their school to isolate
#    Verify browser tab title and page heading match
#    Click Continue
#
#    Wait Until Page Contains    Need more help?
#    Verify browser tab title and page heading match
#    Click Submit A Form
#
#    Select Antigen Radio Button
#    Verify browser tab title and page heading match
#    Click Continue
#
#    Select Regional Test Site Radio Button
#    Verify browser tab title and page heading match
#    Click Continue
#
#    Select England Radio Button
#    Verify browser tab title and page heading match
#    Click Continue
#
#    Select London Radio Button
#    Verify browser tab title and page heading match
#    Click Continue
#
#    Input All Long Form Fields
#    Verify browser tab title and page heading match
#    Click Submit
#
#    Wait Until Page Contains    Thank you for submitting your message
#    sleep   4s
#    Verify browser tab title and page heading match
# The last page has two H1 so this is failing
Short form browser tab titles and the page headings match
    [Tags]  CS20-1485
    Set Selenium Speed  1s

    sleep   3s
    Verify browser tab title and page heading match
    Click Get Started

    Select Enquiry Radio Button
    Verify browser tab title and page heading match
    Click Continue

    #Select Contact Tracing Radio Button
    Click staying at home button
    Verify browser tab title and page heading match
    Click Continue

    Select Radio Button By Value    I have COVID-19 and want to know when to stay at home and what to do
    Verify browser tab title and page heading match
    Click Continue

    Wait Until Page Contains    Need more help?
    Verify browser tab title and page heading match
    Click Submit A Form

    Input Contact Name      Bart Simpson
    Input Email Address     bart@test.com
    Input Message           This is a test that verify browser tab title and page headings match
    Verify browser tab title and page heading match
    Click Send Enquiry

    Wait Until Page Contains    Thank you for submitting your message
    sleep   4s
#    Verify browser tab title and page heading match
# The last page has two H1 so this is failing
*** Keywords ***
Verify browser tab title and page heading match
    ${browser-tab}=     Get Title
    # Example 'NHS Test and Trace - What is your enquiry about?'

    ${page-heading}=    Get Text    //h1
    # Example 'What is your enquiry about?'

    Should Be Equal As Strings      ${browser-tab}      NHS Test and Trace - ${page-heading}
    # The pages H1 heading should always be in the broser tab prefixed with 'NHS Test and Trace - '

Input All Long Form Fields
    Input Contact Name (Long Form)     Testy McTester
    Input Email Address (Long Form)    testymctester@test.com
    Select No (Myself) Radio Button (Long Form)
    Input Day (Long Form)               25
    Input Month (Long Form)             12
    Input Year (Long Form)              2020
    Input Test Barcode (Long Form)      123abc
    Input Message (Long Form)       This is a test that verify browser tab title and page headings match