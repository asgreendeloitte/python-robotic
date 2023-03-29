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
${account-name-link}     (//force-lookup[@slot='outputField']//div[@class='slds-grid'])[1]
${account-name-link1}     (//span[contains(text(), 'sample')])[1]
${account-edit}          (//button[@name='Edit'])[2]
${account-save}          //*[@name='SaveEdit']
${Deny_list_img}         //*[@alt="Deny List"]
#//span[@id='window']
#(//span[contains(text(), 'Geetha')])[1]


*** Test Cases ***

PPAT Users Account validations
    [Tags]  TTCS20-4449

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
	Go To Cases Tab
	Sleep  3s
	PPAT Person Account Validation
	Sleep  6s
    Wait Until Page Contains     was saved
    Sleep  4s


PPAT Standard Users Account validations
    [Tags]  TTCS20-4449-01

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
	Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  6s
	click element  ${account-name-link}
    Sleep  6s
    click element  ${account-edit}
    Click Element  ${account-save}
    page should contain  Review the errors on this page.
    page should contain  Oops...you don't have the necessary privileges to edit this record. See your administrator for help.


PPAT Government Account Validation
    [Tags]  TTCS20-4449-02

    Go To Salesforce login
    Login as PPAT Enquiries Super User
    Reset View (if applicable)
	Go To Cases Tab
	Sleep  3s
	PPAT Government Account Validation
	Sleep  3s


PPAT Users Account Salutation validations
    [Tags]  TTCS20-5138

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
	Go To Cases Tab
	Sleep  3s
	PPAT Person Account Salutation Field picklist validation

PPAT Users Deny Account validations
    [Tags]  TTCS20-4721

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
	Go To Cases Tab
	Sleep  3s
	PPAT Person Account Deny List Validation
	Sleep  5s
	PAGE SHOULD CONTAIN ELEMENT    ${Deny_list_img}