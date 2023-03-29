*** Settings ***
Library  SeleniumLibrary    implicit_wait=10

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

Test Template       Generate International Travel Long Form (Test Case) In Digital Helper And Verify It's Created in Salesforce

Default Tags   CS20-1218    CS20-1219   CS20-1220   data-creation

*** Variables ***
# Input details
${name}      Alastor Moody
${email}     moody@test.com
${message}   Better wizards than you have lost buttocks, you know.

*** Test Cases ***
E-IA-Q1-R-CTM     2     Enquiry     Testing when travelling                 Red list country       Corporate Travel Management (CTM)
#E-IA-Q1-A-CTM     2     Enquiry     Testing when travelling                 Non-red list country      Corporate Travel Management (CTM)
#
#E-IA-Q1-R-PP     2      Enquiry     Testing when travelling                 Red list country        A test from a private test provider
#E-IA-Q1-A-PP     2      Enquiry     Testing when travelling                 Non-red list country      A test from a private test provider
#
#E-IA-Q1-R-DK     2      Enquiry     Testing when travelling                 Red list country        I don’t know which test I took
#E-IA-Q1-A-DK     2      Enquiry     Testing when travelling                 Non-red list country      I don’t know which test I took
#
####
#
#E-IA-Q2-R-CTM     2     Enquiry     Quarantine and self-isolation rules                 Red list country        Corporate Travel Management (CTM)
#E-IA-Q2-A-CTM     2     Enquiry     Quarantine and self-isolation rules                 Non-red list country      Corporate Travel Management (CTM)
#
##
#E-IA-Q2-R-PP     2      Enquiry     Quarantine and stay at home guidance                  Red list country        A test from a private test provider
E-IA-Q2-A-PP     2      Enquiry     Quarantine and stay at home guidance                 Non-red list country      A test from a private test provider
#
##
#E-IA-Q2-R-DK     2      Enquiry     Quarantine and self-isolation rules                 Red list country        I don’t know which test I took
#E-IA-Q2-A-DK     2      Enquiry     Quarantine and self-isolation rules                 Non-red list country      I don’t know which test I took

##

#E-IA-Q3-R-CTM     2     Enquiry     listed countries                 Red list country        Corporate Travel Management (CTM)
#E-IA-Q3-A-CTM     2     Enquiry     listed countries                Non-red list country      Corporate Travel Management (CTM)
#
#E-IA-Q3-R-PP     2      Enquiry     listed countries                 Red list country        A test from a private test provider
#E-IA-Q3-A-PP     2      Enquiry     listed countries                 Non-red list country      A test from a private test provider
#
E-IA-Q3-R-DK     2      Enquiry     Red list countries and territories             Red list country        I don’t know which test I took
#E-IA-Q3-A-DK     2      Enquiry     listed countries                 Non-red list country      I don’t know which test I took
#
####
#
#E-IA-Q4-R-CTM     2     Enquiry     Job, medical and other exemptions                 Red list country        Corporate Travel Management (CTM)
#E-IA-Q4-A-CTM     2     Enquiry     Job, medical and other exemptions                 Non-red list country      Corporate Travel Management (CTM)
#
E-IA-Q4-R-PP     2      Enquiry     Job, medical and other exemptions                 Red list country        A test from a private test provider
#E-IA-Q4-A-PP     2      Enquiry     Job, medical and other exemptions                 Non-red list country      A test from a private test provider
#
#E-IA-Q4-R-DK     2      Enquiry     Job, medical and other exemptions                 Red list country        I don’t know which test I took
#E-IA-Q4-A-DK     2      Enquiry     Job, medical and other exemptions                 Non-red list country      I don’t know which test I took
#
###
#
#E-IA-Q5-R-CTM     2     Enquiry     Scotland, Wales and Northern Ireland                 Red list country        Corporate Travel Management (CTM)
#E-IA-Q5-A-CTM     2     Enquiry     Scotland, Wales and Northern Ireland                 Non-red list country      Corporate Travel Management (CTM)
#
#E-IA-Q5-R-PP     2      Enquiry     Scotland, Wales and Northern Ireland                 Red list country        A test from a private test provider
#E-IA-Q5-A-PP     2      Enquiry     Scotland, Wales and Northern Ireland                 Non-red list country      A test from a private test provider
#
#E-IA-Q5-R-DK     2      Enquiry     Scotland, Wales and Northern Ireland                 Red list country        I don’t know which test I took
E-IA-Q5-A-DK     2      Enquiry     Scotland, Wales and Northern Ireland                 Non-red list country      I don’t know which test I took
#
###
#
#E-IA-Q6-R-CTM     1     Enquiry     My enquiry is not listed                 Red list country        Corporate Travel Management (CTM)
E-IA-Q6-A-CTM     1     Enquiry     My enquiry is not listed                 Non-red list country      Corporate Travel Management (CTM)
#
#E-IA-Q6-R-PP     1      Enquiry     My enquiry is not listed                 Red list country        A test from a private test provider
#E-IA-Q6-A-PP     1      Enquiry     My enquiry is not listed                 Non-red list country      A test from a private test provider
#
#E-IA-Q6-R-DK     1      Enquiry     My enquiry is not listed                 Red list country        I don’t know which test I took
#E-IA-Q6-A-DK     1      Enquiry     My enquiry is not listed                 Non-red list country      I don’t know which test I took


*** Keywords ***
Generate International Travel Long Form (Test Case) In Digital Helper And Verify It's Created in Salesforce
    [Arguments]   ${flow-type}   ${case-type}   ${question}     ${traffic-light}    ${test-type}
    ${message-date}=     Create Description With Date And Time   ${message}
    ${email-date}=     Create Email With Date    ${email}

    Complete International Travel Long Form User Flow     ${flow-type}    ${case-type}     ${question}   traffic-light=${traffic-light}   test-type=${test-type}   name=${name}    email=${email-date}    message=${message-date}
#    Check Confirmation Page Content
    Wait Until Element Is Visible     ${case-number-element}
    Sleep  7s
    ${case-number}=     Get Text      ${case-number-element}


#   Check Salesfoce
    Go To Salesforce login
    Login as E&C Central Agent
#    Display Most Recent Cases From General Complaints & Enquiries- Test Queue
#    sleep   5s
#    Click Element   ${search}
#    Input Text      ${search}     ${case-number}
#    sleep   7s
#    PRESS KEYS  None   ENTER
#    sleep   2s
#    Click Element   ${first-list-option}
#    sleep   3s

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
    Page Should Contain     ${name} , Test, ${case-type}, Online-Web

#   Description
    Page Should Contain     ${message-date}

#   Web Email
    Page Should Contain     ${email-date}
