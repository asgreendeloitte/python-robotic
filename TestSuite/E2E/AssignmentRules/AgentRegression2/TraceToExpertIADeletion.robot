*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***
# Add a tests to verify the vlaidation for date of arrival and desc
Trace Generalist Assigns Trace Case To IA Data Deletion with missing fields
    [Tags]   TTCS20-1039  TTCS20-1361
    Login as Generalist Trace Agent
    #Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
    #Agent Creates Case - Trace
    Agent Creates Case - Trace1
    #Central Agent Creates Case - Trace
    Case Status Text Should Be   New
    Click Edit
    Click Drop Down By Name     Category
    Select Dropdown Option      International arrivals
    Click Drop Down By Name     Assign Trace Case
    Select Dropdown Option      IA Data Deletion Team
    Click Save
    Check Error Message Content
    Sleep   2s
    Click Cancel


Trace Specialist Assigns Trace Case To IA Data Deletion with missing fields
    [Tags]  TTCS20-1252
    Login as Specialist Trace Agent
    #Display Most Recent Cases From Specialist Enquiries – Trace Queue
    Reset View (if applicable)
    Go To Cases Tab
	Sleep  3s
    Agent Creates Case - Trace1
    #Central Agent Creates Case - Trace
    sleep  4s
    Case Status Text Should Be   New
    Click Edit
    Click Drop Down By Name     Category
    Select Dropdown Option      International arrivals
    Click Drop Down By Name     Assign Trace Case
    Select Dropdown Option      UKHSA MQS Inbound
    Click Save
    Check Error Message Content
    Sleep   2s
    Click Cancel


Trace Generalist Assigns Trace Case To IA Data Deletion
    [Tags]  TTCS20-1322
    Login as Generalist Trace Agent
    #Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Reset View (if applicable)
    Go To Cases Tab
		Sleep  3s
    Agent Creates Case - Trace1
    #Central Agent Creates Case - Trace
    Case Status Text Should Be   New
    Sleep  2s
    Click Edit
    Click Drop Down By Name     Category
    Select Dropdown Option      International arrivals
    Click Drop Down By Name     Subcategory
    Select Dropdown Option      Data Deletion
    Click Drop Down By Name     Assign Trace Case
    Select Dropdown Option      UKHSA MQS Inbound
    Input Date Field By Name    Date Of Arrival               20/05/2021
#    Input Text Area By Name    Description        Test Desc
    Click Save
    Wait Until Page Has Saved
    Case Owner Text Should Be       UKHSA MQS Inbound


Trace Specialist Assigns Trace Case To IA Data Deletion
    [Tags]  TTCS20-1200
    Login as Specialist Trace Agent
    #Display Most Recent Cases From Specialist Enquiries – Trace Queue
    Reset View (if applicable)
    Go To Cases Tab
		Sleep  3s
    Agent Creates Case - Trace1
    #Central Agent Creates Case - Trace
    Case Status Text Should Be   New
    Sleep  2s
    Click Edit
    Click Drop Down By Name     Category
    Select Dropdown Option      International arrivals
    Click Drop Down By Name     Subcategory
    Select Dropdown Option      Data Deletion
    Click Drop Down By Name     Assign Trace Case
    Select Dropdown Option      UKHSA MQS Inbound
    Input Date Field By Name    Date Of Arrival               20/05/2021
#    Input Text Area By Name    Description        Test Desc
    Click Save
    Wait Until Page Has Saved
    Case Owner Text Should Be       UKHSA MQS Inbound


Trace Generalist Assigns Trace Case To IA Data Deletion-Date of arrival checkbox tick
    [Tags]  TTCS20-1039
    Login as Generalist Trace Agent
    #Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Reset View (if applicable)
    Go To Cases Tab
		Sleep  3s
    Agent Creates Case - Trace1
    #Central Agent Creates Case - Trace
    Case Status Text Should Be   New
    Sleep  2s
    Click Edit
    Click Drop Down By Name     Category
    Select Dropdown Option      International arrivals
    Click Drop Down By Name     Subcategory
    Select Dropdown Option      Data Deletion
    Page Should Contain    Date Of Arrival Not Applicable
    Select Checkbox By Name1   Date Of Arrival Not Applicable
    Click Drop Down By Name     Assign Trace Case
    Select Dropdown Option      UKHSA MQS Inbound
#    Input Text Area By Name    Description        Test Desc
    Click Save
    Wait Until Page Has Saved
    Case Owner Text Should Be       UKHSA MQS Inbound


Trace Specialist Assigns Trace Case To IA Data Deletion-Date of arrival checkbox tick
    [Tags]  TTCS20-1246
    Login as Specialist Trace Agent
    #Display Most Recent Cases From Specialist Enquiries – Trace Queue
    Reset View (if applicable)
    Go To Cases Tab
		Sleep  3s
    Agent Creates Case - Trace1
    #Central Agent Creates Case - Trace
    Case Status Text Should Be   New
    Sleep  2s
    Click Edit
    Click Drop Down By Name     Category
    Select Dropdown Option      International arrivals
    Click Drop Down By Name     Subcategory
    Select Dropdown Option      Data Deletion
    Click Drop Down By Name     Case type
    Select Dropdown Option      Feedback
    Select Checkbox By Name1   Date Of Arrival Not Applicable
    Click Drop Down By Name     Assign Trace Case
    Select Dropdown Option      IA Data Deletion Team
#    Input Text Area By Name    Description        Test Desc
    Click Save
    Wait Until Page Has Saved
    Case Owner Text Should Be       UKHSA Expert 119 Team