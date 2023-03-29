*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

#Logins
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot


Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CaseE2EoutboundsendingEmailonTracecase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***

${first-list-option}        (//a[@data-refid='recordId'])[1]
#${checkbox-1}               (//*[@class='slds-checkbox--faux'])[2]
${checkbox-1}               ((//tr[1]//td[@role="gridcell"])[2]//span)[1]
${checkbox-2}               ((//tr[2]//td[@role="gridcell"])[2]//span)[1]
${checkbox-3}               ((//tr[3]//td[@role="gridcell"])[2]//span)[1]
${checkbox-4}               ((//tr[4]//td[@role="gridcell"])[2]//span)[1]
${change-owner}             //div[@title='Change Owner']


*** Test Cases ***

Team Lead Agent update case owner
    [Tags]  TTCS20-3761

        Login as Team Leader Agent
        #Open Most Recent Case From Inbound 119 Tier 2 - Trace Queue
        Display Most Recent Cases From Inbound 119 Tier 2 - Trace Queue
        sleep  6s
        Click Element   ${checkbox-1}
        Click Element   ${checkbox-2}
        Click Element   ${checkbox-3}
        Click Element   ${checkbox-4}
        sleep  4s
        #Click Element   ${change-owner}
        #sleep  4s
        Change Owner To multiple cases   Complaints Team – Test & Trace

Contact Centre Manager can edit the Case Owner field and also can assign the case to a Queue
    [Tags]  TTCS20-3761-01

    Login as Contact Centre Manager Agent
    Display Most Recent Cases From Inbound 119 Tier 2 - Trace Queue
    click element   ${first-list-option}
    sleep  4s
    Change Owner To   Complaints Team – Test & Trace
    #Wait Until Page Contains   Complaints Team – Test & Trace now owns the record for
    sleep  5s
    Case Owner Text Should Be  Complaints Team – Test & Trace