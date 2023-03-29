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
${account-name-link}     (//span[contains(text(), 'Geetha')])[1]
${account-name-link1}     (//span[contains(text(), 'automation')])[1]
${account-edit}          (//button[@name='Edit'])[2]
${account-save}          //*[@name='SaveEdit']
${new-contact}          (//*[contains(text(), 'New Contact')])
${PPAT-contact}         (//*[@class='slds-radio--faux topdown-radio--faux'])[3]
${contact-salutation}   //*[@id="combobox-button-388"]/span
${lastname}             //*[@name='lastName']
#//span[@id='window']
#(//span[contains(text(), 'Geetha')])[1]


*** Test Cases ***

PPAT Contact Validation
    [Tags]  TTCS20-4668

    Go To Salesforce login
    Login as PPAT Enquiries Super User
    Reset View (if applicable)
	Go To Cases Tab
	Sleep  3s
	PPAT Government Account Validation
	Sleep  3s
	click element  ${account-name-link1}
    Sleep  3s
	#click element  ${account-edit}
    #Click Element  ${account-save}
    click element   ${new-contact}
    input text   ${lastname}    auto-last
    Sleep   2s
    Click Element  ${account-save}

PPAT Contact search validation
     [Tags]  TTCS20-5806

     Go To Salesforce login
    Login as PPAT Information rights team member
    Reset View (if applicable)
    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   jane
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[contains(text(),'Contacts')]
    Page Should Contain       Name
    Page Should Contain       Email
    Page Should Contain       Phone
    Page Should Contain       Mobile
    Page Should Contain       Birthdate
    Page Should Contain       Account Name
