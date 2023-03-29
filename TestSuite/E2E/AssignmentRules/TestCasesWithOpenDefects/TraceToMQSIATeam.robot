
*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test

*** Test Cases ***
Trace Generalist Assigns Trace Case To MQS IA Team Queue
    [Tags]  TTCS20-1083
    Login as Generalist Trace Agent
    Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Agent Creates Case - Trace
    Case Status Text Should Be   New
    Click Edit

    Click Drop Down By Name     Category
    Select Dropdown Option      International Arrivals - MQS

    Click Drop Down By Name     Subcategory
    Select Dropdown Option      Hotels

    Click Drop Down By Name     Assign Trace Case
    Select Dropdown Option      MQS IA Team
    Click Save
    Wait Until Page Has Saved

    Case Owner Text Should Be       MQS IA Team

#Trace generalist can NOT assign to MQS IA Team if category is not selected
#    [Tags]  CS20-397   CS20-1491
#     Login as E&C Central Agent
#     Display Most Recent Cases From Generalist Enquiries – Trace Queue
#    Agent Creates Case - Trace
#    Case Status Text Should Be   New
#    Display Field text Should Be    Category       Contact Tracing
#    Click Edit
#
#   Click Drop Down By Name     Assign Trace Case
#   Select Dropdown Option      MQS IA Team
#
#    Click Save
#
#    Page Should Contain       Please select the appropriate category and subcategory before transferring the case.
#    Sleep  2s
#
#    Click Drop Down By Name     Category
#    Select Dropdown Option      International Arrivals - MQS
#
#    Click Drop Down By Name     Subcategory
#    Select Dropdown Option      Hotels
#
#    Click Save
#    Wait Until Page Has Saved
#    Case Owner Text Should Be       MQS IA Team
#
#MQS IA Team Assigns Trace Case To EFC Queue
    #[Tags]  CS20-600


    # Login as MQS IA Agent
  #  Display Most Recent Cases From MQS IA Team Queue
  #  Agent Creates Case - MQS IA Team
  #  sleep   3s
#    Case Owner Text Should Be       MQS IA Team
  #  Click Edit
  #  Click Drop Down By Name     Assign Trace Case
  #  Select Dropdown Option      EFC Central Trace Team
  # Click Save
  #  Wait Until Page Has Saved
  #  Case Owner Text Should Be       EFC Central Trace Queue

#MQS IA Team Assigns Trace Case To Generalist Trace Queue
#    [Tags]    CS20- 389
#
#
#     Login as MQS IA Agent
#    Display Most Recent Cases From MQS IA Team Queue
#    Agent Creates Case - MQS IA Team
#    sleep   3s
#    Click Editt Should Be       Generalist Enquiries – Trace
#    Click Drop Down By Name     Assign Trace Case
#    Select Dropdown Option      Generalist Trace Team
#    Click Save
#    Wait Until Page Has Saved
#    Case Owner Tex