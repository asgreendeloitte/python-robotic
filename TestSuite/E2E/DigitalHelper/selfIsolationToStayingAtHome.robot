*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  DateTime

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/Confirmation.robot

Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser, Go To Digital Helper and Accept Cookies
Test Teardown   Close Browser

#Test Template       Complete Staying at home Long Form User Flow

*** Variables ***
${name}      Moaning Myrtle
${email}     myrtle@test.com
${message}   this is a desc

#*** Test Cases ***
#E-SaH-Q1-PCR    Enquiry     I have COVID-19 and want to know when to stay at home and what to do
#E-SaH-Q2-PCR    Enquiry     I was in contact with someone who tested positive for coronavirus (COVID-19)
#E-SaH-Q3-PCR    Enquiry     I have a question about self-isolation payments
#E-SaH-Q4-PCR    Enquiry     My enquiry is not listed here

*** Test Cases ***
Navigate to select enquiry, feedback or complaint
    [Tags]     TTCS20-3453
    Go To Digital Helper
    Click Get Started
    Page should contain     Do you want to make an enquiry, give feedback or make a complaint?
    Select Case Type Radio Button     Enquiry
    Click Continue
    Page should contain     What is your enquiry about?
    Select Staying at home Radio Button
    Click Continue
    Page should contain    What is your enquiry about staying at home?

    Select Topic Radio Button     I need stay at home support for myself or someone I care for
    Click Continue
    Page should contain    I need stay at home support for myself or someone I care for

    Select Topic Radio Button          I need support because I do not feel safe at home
    Click Continue

    Page should contain   I need support because I do not feel safe at home
    Page should contain   Available support
    Page should contain   Domestic abuse: how to get help (opens in new window).
    Page should contain   Find out about Refuge 24 hour domestic abuse helpline (opens in new window).
    Page should contain   Find out about Women’s Aid live chat service (opens in new window).
    Page should contain   Find out about Men’s Advice domestic abuse helpline (opens in new window).

    Page should contain   Specialist support

    Page should contain   Find support for victims of honor-based abuse and forced marriage (opens in new window).

    Page should contain   Find out about online help and resources in several languages (opens in new window).
    Page should contain   Find out about getting support in keeping children safe (opens in new window).
    Page should contain   Find out about getting support for LGBT+ people (opens in new window).

    Verify Start again button
    Verify Submit a form button

    Click go back
    Sleep   3s
    Click go back

    Select Topic Radio Button      I was in contact with someone who tested positive for coronavirus (COVID-19)
    Click Continue
    Page should contain     I was in contact with someone who tested positive for coronavirus (COVID-19)
    Page should contain     I was in contact with someone who tested positive for coronavirus (COVID-19)
    Page should contain     Read the guidance for people with COVID-19 and their contacts (opens in new window).
    Page should contain     When to stay at home if you have COVID-19 (opens in new window).
    Page should contain     Find out about support in your local area (opens in new window).
    Verify Start again button
    Verify Submit a form button

    Click go back

    Select Topic Radio Button     I have COVID-19 and want to know when to stay at home and what to do
    Click Continue
    Page should contain    I have COVID-19 and want to know when to stay at home and what to do
    Page should contain     Read the guidance for people with COVID-19 and their contacts (opens in new window).
    Page should contain     When to stay at home if you have COVID-19 (opens in new window).
    Page should contain     Find out about support in your local area (opens in new window).

    Verify Start again button
    Verify Submit a form button

Check the feedback topics
    [Tags]     TTCS20-3453
    Go To Digital Helper
    Click Get Started
    Select Case Type Radio Button     Feedback
    Click Continue

    Page should contain     Symptoms and testing
    Page should contain     Staying at home
    Page should contain     My business, organisation or workplace
    Page should contain     International travel
    Verify Conmtinue button
