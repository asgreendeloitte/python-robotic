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
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/CaseDetailsTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/RelatedTab.robot
Resource    ../../../Resources/EnquiriesConsole/GlobalButtons.robot

Test Setup      Open Browser and Go To Salesforce Login
#Test Teardown   End Test1

*** Test Cases ***

Origing demographics - Information Rights
    [Tags]  TTCS20-5829
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
    Click Element                   ${new-case-btn}
    Sleep  3s
    Click Element                   ${informations-rights}
    Sleep  3s
    Click Element                   ${next-modal-btn}
    Sleep  3s
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Origin Demographics
    Sleep  3s
    Populate Fields From IR origin demographic Picklist   Origin Demographics
    Sleep  3s
    Click Drop Down By Name         Origin Demographics
    #Select Drop down option         MP's office
    #Select Drop down option1         MP's office
    Click Element   (//*[@data-value="MP's office"])[1]

