
*** Settings ***

Library  SeleniumLibrary    implicit_wait=15

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
Test Teardown   End Test
Test Teardown   Close Browser

Test Template      Generate Private Test Provider Complaint flow In Digital Helper



Default Tags

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
Generate Private Test Provider Complaint flow In Digital Helper
    [Arguments]  ${flow-type}   ${case-type}   ${question}=optional         ${test-type}=optional      ${sub-question}=optional
    ${message-date}=     Create Description With Date And Time   ${message}
    ${email-date}=     Create Email With Date    ${email}

    Complete Test form for PTM      flow-type=${flow-type}    case-type=${case-type}    name=${name}    email=${email-date}    message=${message-date}
    Check Confirmation Page Content
    Go To Salesforce login
    Login as E&C Central Agent
    Execute Javascript    window.location.reload(true);
    Sleep   6s
    Open Most Recent Case From Complaints Team – Test Queue
#    Login as agent and open most recent case    ${case-type}
    Page Should Contain     Complaints and Enquiries(Test)
#     Case Theme

    Display Field text Should Be    Case Theme    Private test provider

    Display Field text Should Be    Case type     Complaint
#    Test Provider Type
      Display Field text Should Be   Test Provider Type     Private provider

#      Private Test Package
    Display Field text Should Be   Private Test package     Day 2
#    Description
#    Page Should Contain     this is a desc - This was created by automation testing at 2021-09-22 10-10-49

#    # Booking Reference
    Page Should Contain     ABCDE1234567
     Display Field text Should Be   Test Provider Not Listed     Randox



Login as agent and open most recent case

      [Tags]   TTCS20-2035
    [Arguments]  ${case-type}

    Run Keyword If    '${case-type}'=='Complaint'     Login as E&C Central Agent
    Run Keyword If    '${case-type}'=='Complaint'    Open Most Recent Case From Complaints Team – Test Queue
