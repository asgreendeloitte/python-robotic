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

${subject-text-box-IR}                      //input[@name="Subject"]
${subject-text-box-Parly}                   //input[@name="Subject"]
${pqpo-text-box}                            //input[@name='PPAT_PQPO_number__c']
#${parliamentary-question-text-box}          //span[text()='Parliamentary Question']/ancestor::div[1]/input
${parliamentary-question-text-box}          //input[@name="PPAT_Parliamentary_Question__c"]
${related}                                  //*[@id="flexipage_tab3__item"]


*** Test Cases ***

Contribution Cases - Parliamentary Parent
    [Tags]  TTCS20-4208-1-3
    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT Parliamentary agent creates a case
    PPAT Parly Agent creates a contribution case

	Click Edit
	Input text      ${subject-text-box-Parly}    Automation testing
	Input text      ${pqpo-text-box}    12345
	Input text      ${parliamentary-question-text-box}    Automation testing
	Sleep   3s
	Click Save
	Sleep   6s
	${case-number}=     Get Text      ${case-number-element}
	${PQP0-number}=     Get Text      ${PQP0-element}
	${Subject}=     Get Text      ${Subject-element}
	${Parlamientary-question}=     Get Text      ${Parlamientary-question-element}

	Open contribution case created
	Sleep   3s

    Page should contain     Case Record Type
	Page should contain     PPAT Contribution

	Page should contain     Subject
	Page should contain     ${Subject}

	Page should contain     Status
	Page should contain     New

    Page Should Contain     Category
    Page Should Contain     COVID-19

    Page Should Contain     Team
    Page Should Contain     COVID-19 Virology

    Page should contain     PQ / PO number
	Page should contain     ${PQP0-number}

	Page should contain     Parliamentary Question
	Page should contain     ${Parlamientary-question}

Contribution Cases - Informations Rights Parent
    [Tags]  TTCS20-4208-2-3
    Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
	PPAT QA agent creates a case Information Rights type
	PPAT Information Rights Agent creates a contribution case
	Click Edit
	Input text      ${subject-text-box-IR}    Automation testing
	Sleep   3s
	Click Save
	${case-number}=     Get Text      ${case-number-element}
	${Subject}=     Get Text      ${Subject-element}

	Open contribution case created
	Sleep   3s

    Page should contain     Case Record Type
	Page should contain     PPAT Contribution

	Page should contain     Subject
	Page should contain     ${Subject}

	Page should contain     Status
	Page should contain     New

    Page Should Contain     Category
    Page Should Contain     COVID-19

    Page Should Contain     Subcategory
    Page Should Contain     COVID-19 Virology


Contribution Case Layout - Highlights Bar & Case Details Tab
    [Tags]  TTCS20-4208-4-6
    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
    PPAT Agent creates a contribution case

	Sleep  3s
	Page should contain     Case Record Type
	Page should contain     Parent Case
	Page should contain     Case Owner
	Page should contain     Category
	page should contain     Subcategory
	page should contain     PQ / PO number

	Information is present within the section      Case Information          Case Record Type
	Information is present within the section      Case Information          Case Number
	Information is present within the section      Case Information          Parent Case
	Information is present within the section      Case Information          Public Case ID
	Information is present within the section      Case Information          Case Owner
	Information is present within the section      Case Information          Case Origin

	Information is present within the section      Case Information          PQ / PO number
	Information is present within the section      Case Information          Contact Name
	Information is present within the section      Case Information          Category
	Information is present within the section      Case Information          Subcategory
	Information is present within the section      Case Information          Status
	Information is present within the section      Case Information          Team

	Information is present within the section      Case Information          Account Name
	Information is present within the section      Case Information          ExCo Group
	Information is present within the section      Case Information          Date/Time Opened
	Information is present within the section      Case Information          Internal Deadline
	Information is present within the section      Case Information          Question
	Information is present within the section      Case Information          Internal Deadline
	Information is present within the section      Case Information          Priority
	Information is present within the section      Case Information          Web Email
	Information is present within the section      Case Information          Description



	Page should contain                             Post
	Page should contain                             Email
	Page should contain                             Comment

Contribution Case - Related Tab
    [Tags]  TTCS20-4208-5

    Go To Salesforce login
    Login as PPAT Parliamentary rights team member
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
    PPAT Agent creates a contribution case
	Sleep   2s
	#Click Related Tab
	click element   ${related}
	Sleep  2s
	Page should contain     Related Cases
	Page should contain     Case Team
	Page should contain     Case History
	Page should contain     Files
#
