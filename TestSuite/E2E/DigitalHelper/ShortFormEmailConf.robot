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
${subject-text-complaint}    Sandbox: Confirmation of your complaint to NHS Test and Trace
${subject-text-Enquiry}      Sandbox: Confirmation of your enquiry to NHS Test and Trace
${subject-text-Feedback}     Sandbox: Confirmation of your feedback to NHS Test and Trace
${Body-text1}       Dear Test
${Body-text2}       If you need more support
${Body-text3}       Thank you
${Body-text4}       What you have provided to us

*** Test Cases ***
Complaint Contact Tracing Testing - Email Confirmation
         [Tags]      TTCS20-1456
    Complete Short Form User Flow       case-type=Complaint      name=Test        email=testtrace4@gmail.com        message=Automated regression testing
    sleep   2s
   # Multipart Email Verification   ${subject-text-complaint}  ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}

Complaint Symptoms & Testing - Email Confirmation
           [Tags]      TTCS20-1458
    Complete Short Form User Flow       case-type=Complaint      topic=Symptoms & Testing       name=Test        email=testtrace4@gmail.com        message=Automated regression testing
    sleep   2s
  #  Multipart Email Verification   ${subject-text-complaint}  ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}

Complaint Feedback Short Form - Email Confirmation
           [Tags]      TTCS20-1459
    Complete Short Form User Flow       case-type=Feedback      topic=Symptoms & Testing       name=Test        email=testtrace4@gmail.com        message=Automated regression testing
    sleep   2s
  #  Multipart Email Verification   ${subject-text-Feedback}  ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}

Enquiry Short Form - Email Confirmation
           [Tags]      TTCS20-1454
    Complete Short Form User Flow       flow-type=7     case-type=Enquiry       question=I have COVID-19 and want to know when to stay at home and what to do      name=Test        email=testtrace4@gmail.com        message=Automated regression testing
    sleep   2s
  #  Multipart Email Verification   ${subject-text-Enquiry}  ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}