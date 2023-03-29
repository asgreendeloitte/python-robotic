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
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/CaseDetailsTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/PPATAgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***

${contact}           (//*[contains(text(),'test')])[3]
${status}           (//*[contains(text(),'Status')])[10]

*** Test Cases ***

Public Complaints - Origin Demographic
    [Tags]  TTCS20-4376-02

    Go To Salesforce login
    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
	PPAT QA agent creates a case Public Complaints type
	Sleep  3s

    Click Edit
    Click Drop Down By Name         Origin Demographics
    Select Drop down option         Citizen
    Click Drop Down By Name         Origin Demographics
    Select Drop down option         DHSC
    Click Drop Down By Name         Origin Demographics
    Select Drop down option         Local Authority
    Click Drop Down By Name         Origin Demographics
    Select Drop down option         MP
    Click Drop Down By Name         Origin Demographics
    Select Drop down option         Chief Executive Office
    Click Save