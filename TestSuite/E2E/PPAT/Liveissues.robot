*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RelatedTab.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/PPATAgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/CaseDetailsTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/ListViews.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/PPATAgentCreateCase.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variable ***

${down-arrow}           (//*[contains(@class,'slds-button slds-button--icon-x-small slds-button--icon-border-filled')])[1]
${delete}               //a[@title='Delete']
${delete-btn}           (//span[contains(text(),'Delete')])
#//span[@id='window']
#(//span[contains(text(), 'Geetha')])[1]


*** Test Cases ***



PPAT Live issue Validation
    [Tags]  TTCS20-5140

    Go To Salesforce login
    Login as PPAT Enquiries Super User
    Reset View (if applicable)
	Open liveissues tab
	 Page Should Contain  Live Issue Name
     Page Should Contain   Live Issue Summary
     Page Should Contain   Status
     page should contain   Start Date
     page should contain   End Date
     page should contain   Created By
     page should contain   Created Date
	Sleep  3s
	click element   ${down-arrow}
	Sleep   4s
	page should contain element   ${delete}
	click element   ${delete}
	Sleep  3s
	click element   ${delete-btn}
	Wait Until Page Contains   was deleted
	Sleep  3s
	PPAT Agent creates a liveissue case
	Sleep  6s


PPAT - Agent - Live issue selection
    [Tags]  TTCS20-5140-02

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Parliamentary agent creates a case
	Sleep  5s
    Click Edit
    PPAT Live Issue Search Text
    Click Save