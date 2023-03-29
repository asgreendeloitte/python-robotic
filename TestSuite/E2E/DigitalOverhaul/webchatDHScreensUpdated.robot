*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  ImapLibrary2

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/homeAddress.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Flows/emailVerification.robot
Resource    ../../../Resources/DigitalOverhaul/Pages/enquiry.robot

Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser


*** Test Cases ***
Stay at home
    [Tags]      TTCS20-5593
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
    Page should contain     Need more help? Make an enquiry
    Page should contain     If you need more help you can contact NHS Test and Trace by making an enquiry. We will respond within 3 working days. If you would prefer to speak to someone directly, call 119.
    Page should contain     You can also use webchat from 9.30am to 5pm, Monday to Friday, and 9.30am to 1pm, Saturday and Sunday. Webchat may become unavailable at short notice due to high demand. If this happens, you can make an enquiry by submitting a form or call 119.
    Page should contain     Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.

    Click Start Again

    Click Stay at home support
    Page should contain     Stay at home support
    Page should contain     Use the links below to find information on stay at home support. If you need more help, you can make an enquiry.
    Page should contain     Need more help? Make an enquiry
    Page should contain     If you need more help you can contact NHS Test and Trace by making an enquiry. We will respond within 3 working days. If you would prefer to speak to someone directly, call 119.
    Page should contain     You can also use webchat from 9.30am to 5pm, Monday to Friday, and 9.30am to 1pm, Saturday and Sunday. Webchat may become unavailable at short notice due to high demand. If this happens, you can make an enquiry by submitting a form or call 119.
    Page should contain     Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.

COVID-19 Testing Journey
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2

    Getting a test for covid-19 testing
    Page Should Contain    Getting a test
    Page Should Contain    Use the link below to find information on getting a test. If you need more help, you can make an enquiry.
    Page should contain    Need more help? Make an enquiry
    Page should contain    If you need more help you can contact NHS Test and Trace by making an enquiry. We will respond within 3 working days. If you would prefer to speak to someone directly, call 119.
    Page should contain    You can also use webchat from 9.30am to 5pm, Monday to Friday, and 9.30am to 1pm, Saturday and Sunday. Webchat may become unavailable at short notice due to high demand. If this happens, you can make an enquiry by submitting a form or call 119.
    Page should contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.

    Click Start Again

    Click report a test result
    Page Should Contain    Report a test result
    Page Should Contain    Use the links below to find information on reporting a test result. If you need more help, you can make an enquiry.
    Page should contain    Need more help? Make an enquiry
    Page should contain    If you need more help you can contact NHS Test and Trace by making an enquiry. We will respond within 3 working days. If you would prefer to speak to someone directly, call 119.
    Page should contain    You can also use webchat from 9.30am to 5pm, Monday to Friday, and 9.30am to 1pm, Saturday and Sunday. Webchat may become unavailable at short notice due to high demand. If this happens, you can make an enquiry by submitting a form or call 119.
    Page should contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.

    Click Start Again

    Find a test result for covid-19 testing
    Page Should Contain    Find a test result
    Page Should Contain    Use the link below to find information on finding a test result. If you need more help, you can make an enquiry.
    Page should contain    Need more help? Make an enquiry
    Page should contain    If you need more help you can contact NHS Test and Trace by making an enquiry. We will respond within 3 working days. If you would prefer to speak to someone directly, call 119.
    Page should contain    You can also use webchat from 9.30am to 5pm, Monday to Friday, and 9.30am to 1pm, Saturday and Sunday. Webchat may become unavailable at short notice due to high demand. If this happens, you can make an enquiry by submitting a form or call 119.
    Page should contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.

    Click Start Again

    Home test kits for covid-19 testing
    Page should contain    Home test kits
    Page Should Contain    Use the links below to find information on home test kits. If you need more help, you can make an enquiry.
    Page should contain    Need more help? Make an enquiry
    Page should contain    If you need more help you can contact NHS Test and Trace by making an enquiry. We will respond within 3 working days. If you would prefer to speak to someone directly, call 119.
    Page should contain    You can also use webchat from 9.30am to 5pm, Monday to Friday, and 9.30am to 1pm, Saturday and Sunday. Webchat may become unavailable at short notice due to high demand. If this happens, you can make an enquiry by submitting a form or call 119.
    Page should contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.


International travel
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2

    Travelling abroad during COVID-19 for covid-19 testing
    Page should contain     Travelling abroad during COVID-19
    Page should contain     Use the links below to find information on travelling abroad during COVID-19. If you need more help, you can make an enquiry.
    Page should contain     Need more help? Make an enquiry
    Page should contain     If you need more help you can contact NHS Test and Trace by making an enquiry. We will respond within 3 working days. If you would prefer to speak to someone directly, call 119.
    Page should contain     You can also use webchat from 9.30am to 5pm, Monday to Friday, and 9.30am to 1pm, Saturday and Sunday. Webchat may become unavailable at short notice due to high demand. If this happens, you can make an enquiry by submitting a form or call 119.
    Page should contain     Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.
