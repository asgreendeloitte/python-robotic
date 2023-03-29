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
Test Teardown   End Test
Test Teardown   Close Browser

Test Template       Generate International Travel Long Form (Test Case) In Digital Helper And Verify It's Created in Salesforce

Default Tags   CS20-1218    CS20-1219   CS20-1220   data-creation

*** Variables ***
# Input details
${name}      Alastor Moody
${email}     moody@test.com
${message}   Better wizards than you have lost buttocks, you know.

*** Test Cases ***
#ID               Case type   Question                                Country

#Enquirys
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
#E-IA-Q2-R-PP     2      Enquiry     Quarantine and stay at home guidance                Red list country        A test from a private test provider
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
E-IA-Q3-R-DK     2      Enquiry     Red list countries and territories                Red list country        I don’t know which test I took
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
    Check Confirmation Page Content

#Check Salesfoce
#    Go To Salesforce login
##    Login as E&C Central Agent
##    Open Most Recent Case From E&C Central Test Queue
#    Login as agent and open most recent case    ${case-type}
#    sleep   3s
#
#    # Case Record Type
#    Page Should Contain     Complaints and Enquiries(Test)
#
#    # Account Name
#    Page Should Contain     ${name}
#
#    # Status
#    Page Should Contain     New
#
#    # Case Origin
#    Page Should Contain     Online-Web
#
#    # Priority
#    Page Should Contain     Medium
#
#    # Case Theme
#    Page Should Contain     Symptoms and testing
#
#    # Subject
#    Page Should Contain     Moaning Myrtle , Test, ${case-type}, Online-Web
#
#    # Description
#    Page Should Contain     ${message-date}
#
#    # Web Email
#    Page Should Contain     ${email-date}
#
#    # Antigen/Antibody Test
#    Page Should Contain     I took a mouth and nose swab test to see if I have coronavirus now ('Antigen' COVID 19 Swab Test)
#
#    # Test barcode number/CTAS number
#    Page Should Contain     ${BarCodeLongForm}


Login as agent and open most recent case
    [Arguments]  ${case-type}
    # Login as Specialist Trace Agent if the case is an Enquiry
    Run Keyword If    '${case-type}'=='Enquiry'    Login as Generalist Test Agent
    Run Keyword If    '${case-type}'=='Enquiry'    Open Most Recent Case From General Complaints & Enquiries- Test Queue

    # Login as Central Agent if the case is NOT Enquiry (i.e. feedback or complaint)
    Run Keyword If    '${case-type}'!='Enquiry'    Login as E&C Central Agent
    Run Keyword If    '${case-type}'!='Enquiry'    Open Most Recent Case From E&C Central Test Queue
