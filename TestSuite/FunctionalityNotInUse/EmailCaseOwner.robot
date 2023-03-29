*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  ImapLibrary2

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/EmailVerificatoin/VerifyEmails.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/CaseView/UserRoleGeneralist&Specialist.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***
${success-message}     //span[@class='toastMessage slds-text-heading--small forceActionsText']
${subject-text}     Sandbox: Case ready to review
${Body-text1}       Dear MP Trace Agent
${Body-text2}       Please be advised that case
${Body-text3}       Thank you
${Body-text4}       NHS Test & Trace Enquiries, Feedback and Complaints Service

*** Test Cases ***
An MP Trace Agent will be notified via an email about update to the case status
    [Tags]  TTCS20-2717
    Login as MP Test Trace agent
    #Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Reset View (if applicable)
    Go To Cases Tab
		Sleep  3s
    MP Trace agent creates a case
    MP Case Status Text Should Be   New
    Sleep  6s
    Click Edit
    Sleep  3s
    Click Drop Down By Name         Status
    Select Drop down option         Review
    Sleep  3s
    Click Save
    Sleep  3s
    Email Verification   ${subject-text}   ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}
    Sleep  3s

