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

*** Variable ***
${Public-enquires-contribution-queue}       //span[contains(text(), 'Public Enquiries Contribution Cases')]/../../a
${parliamentary-contribution-queue}        //span[contains(text(), 'Parliamentary Contribution Cases')]/../../a
${information-rights-contribution-queue}   //span[contains(text(), 'Information Rights Contribution Cases')]/../../a
${complaints-contribution-queue}       //span[contains(text(), 'Public Complaints Contribution Case')]/../../a
${list-views-menue}             //button[@title='Select a List View']

${case-number-element}      //h1//lightning-formatted-text
${PQP0-element}     //span[text()='PQ / PO number']/ancestor::div[2]/div[2]/span/slot/lightning-formatted-text
${Subject-element}  (//span[text()='Subject']/ancestor::div[2]/div[2]/span/slot/lightning-formatted-text)[1]
#${Parlamientary-question-element}    //span[text()='Parliamentary Question']/ancestor::div[2]/div[2]/span/slot/lightning-formatted-text
${Parlamientary-question-element}    //span[text()='Question']/ancestor::div[2]/div[2]/span/slot/lightning-formatted-text

${subject-text-box-IR}                      (//span[text()='Subject'])[3]/ancestor::div[1]/input
${subject-text-box-Parly}                   (//input[@class= ' input'])[4]
${pqpo-text-box}                            //span[text()='PQ / PO number']/ancestor::div[1]/input
#${parliamentary-question-text-box}          //span[text()='Parliamentary Question']/ancestor::div[1]/input
${parliamentary-question-text-box}          //span[text()='Question']/ancestor::div[1]/input
${related}                                  //*[@id="flexipage_tab3__item"]


*** Test Cases ***

Contribution Case - Transfer
    [Tags]  TTCS20-5336

    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep   2s
	Case Status Text Should Be   New
	Change Owner To   Public Complaints Reviewer
	Sleep  4s
	Case Status Text Should Be   Transferred
    #Wait Until Page Contains Element    ${success-message}
    #wait until page contains     Public Complaints Owner now owns record
	Click Related Tab
	Sleep  4s
	Page Should Not Contain    Related Cases
	page should contain  Transferred
	page should contain  New
	page should contain  Status
	page should contain  Case Record Type
	page should contain  PPAT Information Rights
	page should contain  PPAT Public Complaints


PPAT - Parly Case - Transfer
    [Tags]  TTCS20-5355-01

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
	Case Status Text Should Be   New
	Change Owner To   PPAT Parliamentary Review
	Sleep  4s
	Case Status Text Should Be   Transferred
	Case Owner Text Should Be    PPAT Parliamentary Review
	Page Should Contain Element    //div[@class='recordTypeName slds-grow slds-truncate']//span[contains(text(),'PPAT Parliamentary')]
	Page Should Contain    PPAT Parliamentary Review

    Click Edit
    Page Should Contain Element    //button[@aria-label='Case type, --None--']
    Page Should Contain Element    //button[@aria-label='Case Origin, Parliamentary Mailbox']
    Page Should Contain Element    //button[@aria-label='Status, Transferred']

PPAT - Parly Case - Transfer - Case history
    [Tags]  TTCS20-5355-02

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	Sleep  3s
	Change Owner To   PPAT Parliamentary Review
	Sleep  4s
	Click Related Tab
	Page Should Not Contain    Related Cases
	Page Should Contain Element    //lst-formatted-text[contains(text(), 'Case Owner')]


PPAT - Parly Case - Transfer from Parly to Other Team
    [Tags]  TTCS20-5355-03
    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Parliamentary agent creates a case
	Sleep  3s
	Change Owner To   Public Complaints Reviewer
	Sleep    3s
	Page Should Contain Element    //slot[contains(text(), 'Public Complaints Reviewer')]