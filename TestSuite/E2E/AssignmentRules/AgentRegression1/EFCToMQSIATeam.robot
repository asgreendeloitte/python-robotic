*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Test Setup       Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.

*** Test Cases ***
EFC Central Team Assigns Trace Case To IA Surge Team Queue with Subcategory NOT selected
    [Tags]  TTCS20-1126    TTCS20-1148

        Go To Salesforce login
        Login as E&C Central Agent
        #Display Most Recent Cases From Generalist Enquiries – Trace Queue
        Display Most Recent Cases From inbound tier2 – Trace Queue

        Central Agent Creates Case - Trace
        Click Edit
        Click Drop Down By Name     Category
        Select Dropdown Option      International arrivals
        Click Drop Down By Name     Assign Trace Case
        Select Drop down option      UKHSA MQS Inbound
        Click Save
        Check Error Message Content
        Sleep   2s
        Click Cancel


EFC Central Team Assigns Trace Case To IA Surge Team Queue
    [Tags]  TTCS20-1126    TTCS20-1403

        Go To Salesforce login
        Login as E&C Central Agent
        #Display Most Recent Cases From Generalist Enquiries – Trace Queue
        Display Most Recent Cases From inbound tier2 – Trace Queue
        #Agent Creates Case - Trace
        Central Agent Creates Case - Trace
        Sleep   3s
#       Page Should Contain       EFC Central Trace Queue       #Note:This has been changed to queue name now need to confirm with Gary----
        Click Edit
        Click Drop Down By Name     Category
        Select Dropdown Option      International arrivals
        Click Drop Down By Name     Subcategory
        Select Dropdown Option      International Arrivals - Other
        Click Drop Down By Name     Assign Trace Case
        Select Drop down option      UKHSA MQS Inbound
        Click Save
        Wait Until Page Has Saved
        Case Owner Text Should Be       UKHSA MQS Inbound


#Note : This needs to be verified with Pratik

#IA Surge Team Assigns Trace Case To EFC Central Team Queue
#    [Tags]  TTCS20-1146

#       Open Browser and Go To Salesforce Login
#       Login as IA Surge Agent
#       Display Most Recent Cases From IA Surge Team Queue
#       Agent Creates Case - IA Surge Team
#       Sleep   3s
#       Page Should Contain     ${MESSAGE-DATE}
#       Case Owner Text Should Be       IA Surge Team -Note:Need to be confirmed with Gary for case owner change
#       Click Edit
#       Click Drop Down By Name     Assign Trace Case
#       Select Dropdown Option      EFC Central Trace Team
#       Sleep   2s
#       Click Save
#       Wait Until Page Has Saved
#       Case Owner Text Should Be       EFC Central Trace Queue