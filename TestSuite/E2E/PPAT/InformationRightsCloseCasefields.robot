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
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RelatedTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/CaseDetailsTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/PPATAgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/CaseDetailsTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/RelatedTab.robot
Resource    ../../../Resources/EnquiriesConsole/GlobalButtons.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***
${exemptionapld1}                       (//*[@class='slds-dueling-list__options slds-is-disabled'])[1]
${exemptionapld2}                       (//*[@class='slds-dueling-list__options slds-is-disabled'])[2]


*** Test Cases ***

Information Rights Case Close Mandatory field error message
    [Tags]  TTCS20-5936
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
    Case Status Text Should Be   New
	Click Edit
    Click Drop Down By Name    Status
    Select Dropdown Option     Closed
    Page Should Contain Element    ${exemptionapld1}
    Page Should Contain Element    ${exemptionapld2}
    Sleep   4s
    Click Drop Down By Name    Case type
    Select Dropdown Option     Data Subject Access Requests
    Sleep   4s
    Page Should not Contain Element    ${exemptionapld1}
    Page Should not Contain Element    ${exemptionapld2}
    Sleep   4s
    Check Content for PPAT IR CloseCase Data subject Rights
    Sleep   4s
    Click Drop Down By Name    Case type
    Select Dropdown Option     --None--
    Sleep   4s
    Page Should Contain Element    ${exemptionapld1}
    Page Should Contain Element    ${exemptionapld2}
    Sleep   4s
    Click Drop Down By Name    Case type
    Select Dropdown Option     Environmental Information Regulations
    Sleep   4s
    Page Should not Contain Element    ${exemptionapld1}
    Page Should not Contain Element    ${exemptionapld2}
    Sleep   4s
    Click Drop Down By Name    Case type
    Select Dropdown Option     --None--
    Sleep   4s
    Page Should Contain Element    ${exemptionapld1}
    Page Should Contain Element    ${exemptionapld2}
    Sleep   4s
    Click Drop Down By Name    Case type
    Select Dropdown Option     Freedom of Information
    Sleep   4s
    Page Should not Contain Element    ${exemptionapld1}
    Page Should not Contain Element    ${exemptionapld2}
    Sleep   4s
    Click Drop Down By Name    Case type
    Select Dropdown Option     --None--
    Sleep   4s
    Page Should Contain Element    ${exemptionapld1}
    Page Should Contain Element    ${exemptionapld2}
    Sleep   4s
    Click Drop Down By Name    Case type
    Select Dropdown Option     Information Commissioners Office
    Sleep   4s
    Check Content for PPAT IR CloseCase Information rights
    Sleep   4s
    Page Should not Contain Element    ${exemptionapld1}
    Page Should not Contain Element    ${exemptionapld2}
    Sleep   4s
    Click Drop Down By Name    Case type
    Select Dropdown Option     --None--
    Sleep   4s
    Page Should Contain Element    ${exemptionapld1}
    Page Should Contain Element    ${exemptionapld2}
    Sleep   4s
    Click Drop Down By Name    Case type
    Select Dropdown Option     Internal Review
    Sleep   4s
    Check Content for PPAT IR CloseCase Information rights
    Sleep   4s
    Page Should not Contain Element    ${exemptionapld1}
    Page Should not Contain Element    ${exemptionapld2}
    Sleep   4s

    Click Save
    Sleep  5s
    Check Error Message Content for PPAT IR CloseCase






Information Rights Case Close Mandatory field error message for Accesstohealth
    [Tags]  TTCS20-5936-1
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
    Case Status Text Should Be   New
	Click Edit
    Click Drop Down By Name         Case type
    Select Drop down option         Access to Health Records
    Click Drop Down By Name         ExCo Group
    Select Drop down option         People
    Click Drop Down By Name         Category
    Click Element                   //lightning-base-combobox-item[@data-value= 'Commercial']
    Click Drop Down By Name         Subcategory
    Click Element                   //lightning-base-combobox-item[@data-value= 'Contracts']
    Click Drop Down By Name         Status
    Select Drop down option         Closed
    Input Text                      //input[@name= 'SuppliedEmail']    test@gmail.com
#    Click Drop Down By Name         Outcome
#    Select Drop down option         Not applicable
#    Click Drop Down By Name         Disclosure Position
#    Select Drop down option         Information Released
#    Click Element                   //button[@aria-label= 'Information Published, --None--']
#    Select Drop down option         Yes
    Click Save
    Sleep  5s
    Check Error Message Content for PPAT IR CloseCase1
    Click Element                  (//*[@data-key='close'])[4]
    Sleep  8s
    Click Drop Down By Name         Case type
    Select Drop down option         Data Subject Access Requests
    Sleep  8s
    Click Drop Down By Name         Outcome
    Select Drop down option         Not applicable
    Sleep  8s
#    Click Drop Down By Name         Disclosure Position
#    Select Drop down option         Information Released
    Click Save
    Sleep  5s
    Check Error Message Content for PPAT IR CloseCase1



Information Rights Case Close Mandatory field error message for Accesstohealth
    [Tags]  TTCS20-5936-2
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
    Case Status Text Should Be   New
	Click Edit
    Click Drop Down By Name         Case type
    Select Drop down option         Data Subject Access Requests
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
    Select Drop down option         Not applicable
#    Click Drop Down By Name         Disclosure Position
#    Select Drop down option         Information Released
#    Click Element                   //button[@aria-label= 'Information Published, --None--']
#    Select Drop down option         Yes
    Click Save
    Sleep  5s
    Check Error Message Content for PPAT IR CloseCase1




Information Rights Case Close Mandatory for DSR
    [Tags]  TTCS20-5936-3
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
    Case Status Text Should Be   New
	Click Edit
    Click Drop Down By Name         Case type
    Select Drop down option         Data Subject Access Requests
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
    Select Drop down option         Not applicable
    Click Drop Down By Name         Disclosure Position
    Select Drop down option         Information Released
    Click Element                   //button[@aria-label= 'Information Published, --None--']
    Select Drop down option         Yes
    Sleep  5s
    Click Element       //*[contains(text(),'S21 Information already accessible')]
    Click Element      (//*[@title='Move selection to Chosen'])[2]
    Click Save




