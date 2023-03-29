*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

#Logins
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot


Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/CaseView/webView.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RelatedTab.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CaseE2EoutboundsendingEmailonTracecase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   Close Browser

*** Variables ***

${outcome_edit}     (//span[@class='test-id__field-value slds-form-element__static slds-grow '])[1]
${URL}
${exp_URL}      0694K000006cvkPQAQ
#https://nhs.lightning.force.com/lightning/r/0694K000006cvkPQAQ/view

*** Test Cases ***

Web Chat - FAQ Link

    [Tags]  TTCS20-5667

        #Login as WebChat Quality Assurance User
        Login as WebChat Case Management User
        Sleep   3s
        Reset View (if applicable)
        Navigate to the Chat Transcript object
        Sleep   2s
        Select the List View titled EFC WebChat
        Sleep       5s
        Click Element       ${first-list-option}
        Sleep   5s
        Page should contain   The 119 Coronavirus Testing Contact Centre FAQs document can be accessed
        Sleep  3s
        Click Element    (//strong[contains(text(), 'here')])
        Sleep   2s
        Switch Window   new
        Get Location
        ${URL}=     Get Location
        Log to Console    ${URL}
        #validating if the URL contains the PROD actual filter view
        Should Contain Any   ${URL}    ${exp_URL}
