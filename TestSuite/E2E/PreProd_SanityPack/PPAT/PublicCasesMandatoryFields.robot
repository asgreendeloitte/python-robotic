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
Resource    ../../../Resources/EnquiriesConsole/CaseView/RelatedTab.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***

${app_launcher}         //*[@class='slds-icon-waffle']

*** Test Cases ***

Public Complaints - Mandatory Fields
    [Tags]  TTCS20-5773-01-03-06

    Login as PPAT Public Complaints team member
    Reset View (if applicable)
    Go To Cases Tab
    Sleep  3s
	PPAT QA agent creates a case Public Complaints type
	Sleep   5s
	Page Should Contain Element    //p[@title= 'Case type']
	Page Should Contain Element    //p[@title= 'Status']
	Page Should Contain Element    //p[@title= 'Account Name']
	Page Should Contain Element    //p[@title= 'Account Email']
	Page Should Contain Element    //p[@title= 'Subject']
	Click Edit
	Sleep   5s
    Click Drop Down By Name         Status
    Select Drop down option         Closed
    Click Save
    Sleep   5s
    Page Should Contain             Please update the mandatory fields on the case before saving. The mandatory fields are Case Type, Account Name, Account Email, Web Email, ExCo Group, Category & Subcategory
    Page Should Contain             Please update the Outcome field on the case before saving
    Click Cancel
    Sleep  3s
    Click Edit
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Appeal
    Click Drop Down By Name         ExCo Group
    Select Drop down option         People
    Click Drop Down By Name         Category
    Click Element                   //lightning-base-combobox-item[@data-value= 'Commercial']
    Click Drop Down By Name         Subcategory
    Click Element                   //lightning-base-combobox-item[@data-value= 'Contracts']
    Click Drop Down By Name         Status
    Select Drop down option         Closed
    Input Text                      //input[@name= 'SuppliedEmail']    test@gmail.com
    Click Drop Down By Name         Outcome
    Select Drop down option         Upheld
    Click Save
    Sleep    10s
    Click Related Tab