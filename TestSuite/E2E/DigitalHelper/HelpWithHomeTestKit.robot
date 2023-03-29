*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/Confirmation.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser, Go To Digital Helper and Accept Cookies
Test Teardown   Close Browser

Test Template       Generate Long Form (Test Case) In Digital Helper And Verify It's Created in Salesforce

Default Tags  TTCS20-3056

*** Variables ***
# Input details
${name}      Moaning Myrtle
${email}     myrtle@test.com
${message}   this is a desc
${test-barcode}   ABC12345678
${search}       //input[@placeholder='Search this list...']

*** Test Cases ***
E-ST-Q4-PCR     2   Enquiry     I need help with my home test kit

*** Keywords ***
Generate Long Form (Test Case) In Digital Helper And Verify It's Created in Salesforce
    [Arguments]  ${flow-type}   ${case-type}   ${question}=optional         ${test-type}=optional      ${sub-question}=optional
    ${message-date}=     Create Description With Date And Time   ${message}
    ${email-date}=     Create Email With Date    ${email}

    Complete Long Form User Flow for HelpWithHomeTestKit      flow-type=${flow-type}    case-type=${case-type}     question=${question}       sub-question=${test-type}    test-type=${test-type}      name=${name}    email=${email-date}    message=${message-date}
    Check Confirmation Page Help With Home Test Kit
