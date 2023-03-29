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

Test Template      Generate Private Test Provider Complaint In Digital Helper



Default Tags    CS20-2845   TTCS20-2900   TTCS20-2870   TTCS20-2963   TTCS20-2967

*** Variables ***
# Input details
${name}      Moaning Myrtle
${email}     myrtle@test.com
${message}   this is a desc

*** Test Cases ***
E-ST-Q1-PCR     2   Complaint
#E-ST-Q1-RFT     2   Enquiry     I might have symptoms of coronavirus     Rapid lateral flow test
#E-ST-Q1-ANT     2   Enquiry     I might have symptoms of coronavirus     Antibody COVID-19 blood test
#

*** Keywords ***
Generate Private Test Provider Complaint In Digital Helper
    [Arguments]  ${flow-type}   ${case-type}   ${question}=optional         ${test-type}=optional      ${sub-question}=optional
    ${message-date}=     Create Description With Date And Time   ${message}
    ${email-date}=     Create Email With Date    ${email}

    Complete Test form for PTM search      flow-type=${flow-type}    case-type=${case-type}     name=${name}    email=${email-date}    message=${message-date}
    Wait Until Element Is Visible     ${case-number-element}
    sleep  6s
    ${case-number}=     Get Text      ${case-number-element}
    Check Confirmation Page Private Test Provider


    Go To Salesforce login
    Login as E&C Central Agent
    Sleep   6s
#    Display Most Recent Cases From Complaints Team/Test
#    Click Element   ${search}
#    Input Text      ${search}     ${case-number}
#    sleep   3s
#    PRESS KEYS  None   ENTER
#    sleep   2s
#    Click Element   ${first-list-option}


    Open cases tab and select list view
    sleep   4s
    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']
#    Login as agent and open most recent case    ${case-type}
      sleep  3s
    Page Should Contain     Complaints and Enquiries(Test)
#     Case Theme

    Display Field text Should be1    Case Theme    Private test provider

    Display Field text Should Be    Status    Closed

    Display Field text Should Be    Case type     Complaint
#    Test Provider Type
      Display Field text Should Be   Test Provider Type     Private provider

#      Private Test Package
    Display Field text Should Be   Private Test package     Day 2

    Display Field text Should Be   Country     England


#    # Booking Reference
    Page Should Contain     ABCDE1234567
