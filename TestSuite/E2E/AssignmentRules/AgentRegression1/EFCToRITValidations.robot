*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RITValidations.robot


# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***
${message}      The way to get started is to quit talking and begin doing.
${MP}           //*[@class='test-id__field-value slds-form-element__static slds-grow word-break-ie11']//*[text()='Closed']


*** Test Cases ***


Specialist to RIT User autoclose if Requires RIT response is unticked
    [Tags]  TTCS20-2663 TTCS20-2685 TTSC20-2704

        Login as Specialist Test Agent
        #Display Most Recent Cases From Specialist Complaints & Enquiries- Test Queue
        #Agent Creates Case
        Reset View (if applicable)
        Go To Cases Tab
        Sleep  3s
        Specialist Agent Creates Case RIT Validation
        Sleep  3s
        RIT Validations1
        #Page Should Contain   Closed
        ${ErrorMessageNotified}=  Get Text    ${MP}
        Log to Console    ${ErrorMessageNotified}
        Should Contain  ${ErrorMessageNotified}    Closed
    #Sleep   3s



#E&C user assign Cases to Test Specialist
#   [Tags]  TTCS20-1321 TTCS20-1057

#       Login as E&C Central Agent
#       Sleep      3s
#       Display Most Recent Cases From General Complaints & Enquiries- Test Queue
#       Agent Creates Case
#       Sleep  3s
#       Case Status Text Should Be   New
#       Display Field text Should Be    Category        Test - General
#       Sleep  4s
#       RIT Validations