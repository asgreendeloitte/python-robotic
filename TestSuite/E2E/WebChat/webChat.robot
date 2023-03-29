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
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/stayAtHome.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/webView.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***

${new}                      //a[@title='New']
${webchat-quick-text-folder}             //lightning-formatted-url[@data-navigation='enable']//a[@title='WebChat Quick Texts']/parent::*
${new-report}               //a[@title='New Report']
${input-report}             //input[@placeholder='Search Report Types...']
${all-report}               //a[@aria-label='All Report Type Category']


*** Test Cases ***

WebChat - Placement on Stay at home screens
    [Tags]      TTCS20-4843-01

    Go To Digital Overhaul
    click on the get help link
    Click stay at home topic

    Page should contain     General guidance for staying at home
    Page should contain     How and when to stay at home and avoid contact with others because you have coronavirus (COVID-19) symptoms or have tested positive.

    Page should contain     Stay at home support
    Page should contain     Support may be available if you are following the stay at home guidance

    Click Stay at home support
    Page should contain     Stay at home support

    Page should contain element     ${web-chat}


WebChat - WebChat placement on COVID-19 testing screens - find a test result
    [Tags]      TTCS20-4843-02

    Go To Digital Overhaul
    click on the get help link
    Click covid-19 testing topic
    Find a test result for covid-19 testing

    Page should contain element     ${web-chat}

WebChat - WebChat placement on COVID-19 testing screens - get a test result
    [Tags]      TTCS20-4843-02
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Getting a test for covid-19 testing
    Page should contain     Getting a test

    Page should contain element     ${web-chat}

WebChat - WebChat placement on COVID-19 testing screens - report a test result
    [Tags]      TTCS20-4843-02
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Reporting a test result for covid-19 testing
    Page should contain     Report a test result

    Page should contain element     ${web-chat}

WebChat - WebChat placement on COVID-19 testing screens - report a test result
    [Tags]      TTCS20-4843-02
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     2
    Travelling abroad during COVID-19 for covid-19 testing
    Page should contain     Travelling abroad during COVID-19

    Page should contain element     ${web-chat}

WebChat - WebChat placement on COVID-19 testing screens - Home test kits
    [Tags]      TTCS20-4843-02
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Home test kits for covid-19 testing
    Page should contain     Home test kits

    Page should contain element     ${web-chat}

WebChat - Grant Content Manager edit access of quick text
    [Tags]      TTCS20-5198

    Go To Salesforce Login
    Login as WebChat Content Manager User
    Reset View (if applicable)
    click element  ${app_launcher}
    Content Manager navigates to All Folders folder Quick Text object
    Content Manager creates a new Quick Texts record
    Content Manager edits Quick Text record
    click element  ${app_launcher}
    Content Manager navigates to All Folders folder Quick Text object
    click element  ${webchat-quick-text-folder}
    Sleep  2s
    Page Should Contain    Automation Quick Text Edit record

Webchat QA reporting - Chat Sessions
    [Tags]      TTCS20-5104-02

    Go To Salesforce Login
    Login as WebChat Quality Assurance User
    Reset View (if applicable)
    click element  ${app_launcher}
    User navigates to Chat Sessions object
    User validates todays Chat Session listview
    User validates Last 7 days chat sessions listview
    User validates all chat sessions listview

Webchat - New Cases and Chat Transcript report type
    [Tags]      TTCS20-5184  TTCS20-5104-01

    Go To Salesforce Login
    Login as WebChat Quality Assurance User
    Reset View (if applicable)
    click element  ${app_launcher}
    User navigates to Report object
    click element  ${new-report}
    Sleep    3s
    Select Frame    //iframe[@title="Report Builder"]
    Click Element    ${all-report}
    Input Text    ${input-report}    Chat
    Page should contain     Chat Sessions
    Page should contain     Cases and Chat Transcripts