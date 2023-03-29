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

Default Tags  CS20-162  CS20-163    CS20-421  CS20-95  CS20-1712  CS20-221  data-creation TTCS20-2685  TTCS20-3041  TTCS20-3045

*** Variables ***
# Input details
${name}      Moaning Myrtle
${email}     myrtle@test.com
${message}   this is a desc
${test-barcode}   ABC12345678
${search}       //input[@placeholder='Search this list...']

*** Test Cases ***
E-ST-Q1-PCR     2   Enquiry     I might have symptoms of coronavirus     PCR test
#E-ST-Q1-RFT     2   Enquiry     I might have symptoms of coronavirus     Rapid lateral flow test
#E-ST-Q1-ANT     2   Enquiry     I might have symptoms of coronavirus     Antibody COVID-19 blood test
#
#E-ST-Q3-PCR     2   Enquiry     I need to report a test result     PCR test
#E-ST-Q3-RFT     2   Enquiry     I need to report a test result     Rapid lateral flow test
#E-ST-Q3-ANT     2   Enquiry     I need to report a test result     Antibody COVID-19 blood test
#
E-ST-Q4-PCR     2   Enquiry     I need help with my home test kit     PCR test
#E-ST-Q4-RFT     2   Enquiry     I need help with my home test kit     Rapid lateral flow test
#E-ST-Q4-ANT     2   Enquiry     I need help with my home test kit     Antibody COVID-19 blood test

#E-ST-Q5-PCR     1   Enquiry     I need help with a coronavirus test I've taken     PCR test
E-ST-Q5-RFT     1   Enquiry     I need help with a coronavirus test I've taken     Rapid lateral flow test
#E-ST-Q5-ANT     1   Enquiry     I need help with a coronavirus test I've taken     Antibody COVID-19 blood test
#
#E-ST-Q6-PCR     2   Enquiry     I need help understanding the results of my test     PCR test
#E-ST-Q6-RFT     2   Enquiry     I need help understanding the results of my test     Rapid lateral flow test
#E-ST-Q6-ANT     2   Enquiry     I need help understanding the results of my test     Antibody COVID-19 blood test
#
#E-ST-Q7-PCR     2   Enquiry     I have not received my test result     PCR test
E-ST-Q7-RFT     2   Enquiry     I have not received my test result     Rapid lateral flow test
#E-ST-Q7-ANT     2   Enquiry     I have not received my test result     Antibody COVID-19 blood test
#
#E-ST-Q10-PCR     1  Enquiry     My enquiry is not listed                PCR test
E-ST-Q10-RFT     1  Enquiry     My enquiry is not listed                Rapid lateral flow test
#E-ST-Q10-ANT     1  Enquiry     My enquiry is not listed                Antibody COVID-19 blood test

*** Keywords ***
Generate Long Form (Test Case) In Digital Helper And Verify It's Created in Salesforce
    [Arguments]  ${flow-type}   ${case-type}   ${question}=optional         ${test-type}=optional      ${sub-question}=optional
    ${message-date}=     Create Description With Date And Time   ${message}
    ${email-date}=     Create Email With Date    ${email}

    Complete Long Form User Flow      flow-type=${flow-type}    case-type=${case-type}     question=${question}       sub-question=${test-type}    test-type=${test-type}      name=${name}    email=${email-date}    message=${message-date}
    Check Confirmation Page Content
    Wait Until Element Is Visible     ${case-number-element}
    Sleep  7s
    ${case-number}=     Get Text      ${case-number-element}
    sleep  5s


#   Check Salesfoce
    Go To Salesforce login
    Login as E&C Central Agent
#    Display Most Recent Cases From Digital Helper and Email Cases - Test Queue
#    sleep   2s
#    Click Element   ${search}
#    Input Text      ${search}     ${case-number}
#    sleep   7s
#    PRESS KEYS  None   ENTER
#    sleep   2s
#    Click Element   ${first-list-option}
#

    Log to Console  ${case-number}
    Sleep   5s
    Open cases tab and select list view
#    Open most recent case   ${case-type}    ${topic}
    Sleep   3s

    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']

#   Account Name
    Page Should Contain     ${name}

#   Case Origin
    Page Should Contain     Online-Web

#   Subject
    Page Should Contain     Moaning Myrtle , Test, ${case-type}, Online-Web

#   Description
    Page Should Contain     ${message-date}

#   Web Email
    Page Should Contain     ${email-date}

#   Test Barcode
    Page Should Contain     ${test-barcode}