*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  ImapLibrary2

# Setup
Resource    ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/EmailVerificatoin/VerifyEmails.robot

# DigitalHelper Flows
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

Suite Setup     Open Browser, Go To Digital Helper and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***
${subject-text}     Sandbox: Confirmation of your enquiry to NHS Test and Trace
${Body-text1}       Dear Test
${Body-text2}       If you need more support
${Body-text3}       Thank you
${Body-text4}       What you have provided to us

*** Test Cases ***
Enquiry Long Form - Email Confirmation
         [Tags]      TTCS20-1455
    Complete Long Form User Flow   flow-type=4        case-type=Enquiry      question=Symptoms & Testing       sub-question=I need to report a test result       test-type=PCR test       name=Test        email=testtrace4@gmail.com        message=Automated regression testing
    sleep   2s
    #Multipart Email Verification      ${subject-text}   ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}