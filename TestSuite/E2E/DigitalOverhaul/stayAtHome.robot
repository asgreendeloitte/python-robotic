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


*** Test Cases ***
Stay at home
    [Tags]      TTCS20-3791    TTCS20-5666-01      TTCS20-5729-02
    Go To Digital Overhaul
    click on the get help link
    Click stay at home topic

    Page should contain     General guidance for staying at home
    Page should contain     How and when to stay at home and avoid contact with others because you have coronavirus (COVID-19) symptoms or have tested positive.

    Page should contain     Stay at home support
    Page should contain     Support may be available if you are following the stay at home guidance

    Click General guidance for staying at home
    Page should contain     General guidance for staying at home
    Page should contain     Use the links below to find information on general guidance for staying at home. If you need more help, you can make an enquiry.

    Expand When to stay at home
    Page should contain     Read the guidance for people with symptoms of a respiratory infection including COVID-19 (opens in new window).
    Page should contain     When to stay at home if you have COVID-19 (opens in new window).

    Expand When to get a COVID-19 test
    Page should contain     Find out who can get a free NHS COVID-19 test (opens in new window)
    
    Page Should Contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.
    Page Should Contain Element    //span[@id='helpButtonSpan']

    Click Start Again

    Click Stay at home support
    Page should contain     Stay at home support
    Page should contain     Use the links below to find information on stay at home support. If you need more help, you can make an enquiry.

    Expand General stay at home support
    page should contain     Find your local council (opens in new window).

    Expand Mental health and wellbeing support
    Page should contain     For urgent medical assistance please call NHS 111, or for a medical emergency dial 999.
    Page should contain     If you are unable to call, please refer to the online NHS 111 service (opens in new window).
    Page should contain     Find out where to get urgent help for mental health (opens in new window).

    Expand Support at home
    Page should contain     Available support
    Page should contain     Find help for domestic violence and abuse (opens in new window).

    Page Should Contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.
    Page Should Contain Element    //span[@id='helpButtonSpan']

