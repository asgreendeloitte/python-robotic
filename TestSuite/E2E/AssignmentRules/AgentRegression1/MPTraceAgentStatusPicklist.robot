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

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.
${MP}           //*[@class='test-id__field-value slds-form-element__static slds-grow word-break-ie11']//*[text()='MP']
${showmore-arrow}     //*[@class='slds-button slds-button_icon-border-filled']
${accept-btn}               //span[text()='Accept']
${case-num}             (//*[@slot='outputField'])[5]
${contribution}                 (//*[contains(text(), 'Contribution')])[1]

*** Test Cases ***

MP Trace Agent adds new MP case status from picklist values
    [Tags]  TTCS20-488 TTCS20-483   TTCS20-1147   TTCS20-1133   TTCS20-1545   TTCS20-3049

    Go To Salesforce login
    Login as E&C Central Agent
    Display Most Recent Cases From MP Trace Queue
    #Agent Creates Case - MP Complaints
    Agent Creates Case - MP Complaints without Demographics selected
    Sleep   5s
     #${ErrorMessageNotified}=  Get Text    ${MP}
     #Log to Console    ${ErrorMessageNotified}
    #Should Contain  ${ErrorMessageNotified}    MP
    #Sleep   3s
    Click Edit
    Click Drop Down By Name     MP Case Status
    Select Dropdown Option      Further investigation required
    Click Save
    Wait Until Page Has Saved
    Sleep  3s
    Click Edit
    Click Drop Down By Name     Category
    Sleep  3s
    Populate Fields From category Picklist in MPCase  Category
    Wait Until Page Has Saved
    Sleep  3s
    #Display Field text Should Be    Category        MP Trace
    Display Field text Should Be   MP Case Status         Further investigation required
    Page Should Contain    Milestones
    Sleep  3s


Sub Category validations
    [Tags]  TTCS20-4531

    Go To Salesforce login
    Login as MP Trace team agent
    Display Most Recent Cases From MP Trace Queue
    Agent Creates Case - MP Complaints
    Sleep   5s
    Click Edit
    Click Drop Down By Name    Case type
    Select Dropdown Option     Ombudsman
    Click Drop Down By Name    Category
    Select Dropdown Option     International Arrivals - MQS
    Click Drop Down By Name    Subcategory
    Select Dropdown Option     Chargeback - Agent
    Click Drop Down By Name    Subcategory
    Select Dropdown Option     Chargeback - Citizen



