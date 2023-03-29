#*** Settings ***
#Library  SeleniumLibrary    implicit_wait=10
#
## Setup & Global
#Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
#Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
#
#
## DigitalHelper Pages
#Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
#Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/Confirmation.robot
#
## Agent pages
#Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
#Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
#
#Test Setup      Open Browser, Go To Digital Helper and Accept Cookies
#Test Teardown   End Test
Test Teardown   Close Browser
#
#Test Template       IA Hotel Search Validation
#
#Default Tags   CS20-1717
#
#*** Variables ***
## Input details
#${name}      Alastor Moody
#${email}     moody@test.com
#${message}   Better wizards than you have lost buttocks, you know.
#
#
#
#*** Test Cases ***
##ID               Case type   Question                                Country
#
##Enquirys
#
#E-IA-Q6-R-CTM     Enquiry     My enquiry is not listed                 Red listed country        Corporate Travel Management (CTM)
#
#*** Keywords ***
# IA Hotel Search Validation
#    [Arguments]  ${case-type}   ${question}     ${traffic-light}    ${test-type}
#    ${message-date}=     Create Description With Date And Time   ${message}
#    ${email-date}=     Create Email With Date    ${email}
#
#    Complete International Travel Long Form User Flow-Hotel Search    ${case-type}     ${question}   ${traffic-light}   ${test-type}   name=${name}    email=${email-date}    message=${message-date}
#    Check Confirmation Page Content
#
##Check Salesfoce
##    Go To Salesforce login
###    Login as E&C Central Agent
###    Open Most Recent Case From E&C Central Test Queue
##    Login as agent and open most recent case    ${case-type}
##    sleep   3s
##
##    # Case Record Type
##    Page Should Contain     Complaints and Enquiries(Test)
##
##    # Account Name
##    Page Should Contain     ${name}
##
##    # Status
##    Page Should Contain     New
##
##    # Case Origin
##    Page Should Contain     Online-Web
##
##    # Priority
##    Page Should Contain     Medium
##
##    # Category
##    Page Should Contain     General
##
##    # Case Theme
##    Page Should Contain     Symptoms and testing
##
##    # Subject
##    Page Should Contain     Moaning Myrtle , Test, ${case-type}, Online-Web
##
##    # Description
##    Page Should Contain     ${message-date}
##
##    # Web Email
##    Page Should Contain     ${email-date}
##
##    # Antigen/Antibody Test
##    Page Should Contain     I took a mouth and nose swab test to see if I have coronavirus now ('Antigen' COVID 19 Swab Test)
##
##    # Testing Channel
##    Page Should Contain     Regional Test Site
##
##    # Devolved Authority
##    Page Should Contain     England
##
##    # Testing Sites
##    Page Should Contain     London
##
##    # Test barcode number/CTAS number
##    Page Should Contain     ${BarCodeLongForm}
#
#
#Login as agent and open most recent case
#    [Arguments]  ${case-type}
#    # Login as Specialist Trace Agent if the case is an Enquiry
#    Run Keyword If    '${case-type}'=='Enquiry'    Login as Generalist Test Agent
#    Run Keyword If    '${case-type}'=='Enquiry'    Open Most Recent Case From General Complaints & Enquiries- Test Queue
#
##    # Login as Central Agent if the case is NOT Enquiry (i.e. feedback or complaint)
##    Run Keyword If    '${case-type}'!='Enquiry'    Login as E&C Central Agent
##    Run Keyword If    '${case-type}'!='Enquiry'    Open Most Recent Case From E&C Central Test Queue
