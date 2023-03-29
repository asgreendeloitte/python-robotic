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
Resource    ../../../Resources/EnquiriesConsole/GlobalButtons.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***

${contact}                                          (//*[contains(text(),'test')])[3]
${status}           (//a[@class= 'select'])[1]
${newpicklistvalue}                                 (//a[@title="New"])[@role='menuitemradio']

*** Test Cases ***

Not a Genuine Case Error messages
    [Tags]  TTCS20-5773-01-05

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep   3s
	Page Should Not Contain Element    //a[@data-label= 'Close Case']
	Click Edit
	Sleep   5s
    Click Drop Down By Name         Status
    Select Drop down option         Closed
    Scroll Element Into View        //label[contains(text (), 'Information Published')]
    Click Element                   //button[@aria-label= 'Not A Genuine Case, No']
    Select Drop down option         Yes
    Click Save
    Sleep   5s
    Page Should Contain    Please ensure that you have recorded the reason for this case being identified as ‘Not Genuine’ before closing the Case
    Click Cancel
    Sleep  3s
    Click Edit
    Sleep  3s
    Click Drop Down By Name         Status
    Select Drop down option         Closed
	Page Should Contain             was saved
	Page Should Contain             Closed