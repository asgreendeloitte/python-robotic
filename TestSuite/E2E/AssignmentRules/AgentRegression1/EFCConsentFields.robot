*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot


# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1




*** Test Cases ***

EFC Central Team Rename Constituent Name' field to 'Name of affected person'-Test
    [Tags]  CS20-1472   CS20-1510   CS20-1470   CS20-1487

        Go To Salesforce login
        Login as E&C Central Agent
        #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        #Agent Creates Case
        Display Most Recent Cases From inbound tier2 - Test Queue
        Central Agent Creates Case
        Sleep   3s
        Click Edit
        Name of the Selected Person validation
#       Click Drop Down By Name     Test Provider Type
#       Select Dropdown Option      Private provider
        Scroll Drop Down Into View   Relationship to person contacting
        Click Drop Down By Name     Relationship to person contacting
        Select Dropdown Option      Friend
        Click Drop Down By Name     All Consent Obtained
        #Select Dropdown Option      Yes     index=2
        Click Element           (//lightning-base-combobox-item[@data-value='Yes'])[2]

        Click Save
        Check Error Message Content
        Sleep  2s


EFC Central Team for All consents fields obtained field validation-Test
    [Tags]   CS20-1510   CS20-1475   CS20-1478

        Go To Salesforce login
        Login as E&C Central Agent
        #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        #Agent Creates Case
        Display Most Recent Cases From inbound tier2 - Test Queue
        Central Agent Creates Case
        sleep   3s
        Click Edit
        Name of the Selected Person validation
        Person Account Selection
        Sleep   2s
#       Scroll Drop Down Into View   Relationship to person contacting
        Click Drop Down By Name     Relationship to person contacting
        Select Dropdown Option      Friend
        Click Drop Down By Name     All Consent Obtained

        #Select Dropdown Option      Yes    index=2
        Click Element           (//lightning-base-combobox-item[@data-value='Yes'])[2]
        Click Save
        Wait Until Page Has Saved
        Sleep  2s


EFC Central Team navigates to Help tab for Consent Required Information
    [Tags]  CS20-1471

        Go To Salesforce login
        Login as E&C Central Agent
        #Display Most Recent Cases From Generalist Enquiries – Trace Queue
        #Agent Creates Case - Trace
        Reset View (if applicable)
        Go To Cases Tab
        Sleep  3s
        Central Agent Creates Case - Trace
        sleep   3s
        Click Help
        Sleep  2s
        Page Should Contain    Consent Required Further Information


EFC Central Team navigates to Help tab for Consent Required Information-Test
    [Tags]  CS20-1471

        Go To Salesforce login
        Login as E&C Central Agent
       # Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        #Agent Creates Case
        Display Most Recent Cases From inbound tier2 - Test Queue
        Central Agent Creates Case
        Sleep   3s
        Click Help
        Sleep  2s
        Page Should Contain    Consent Required Further Information
#






