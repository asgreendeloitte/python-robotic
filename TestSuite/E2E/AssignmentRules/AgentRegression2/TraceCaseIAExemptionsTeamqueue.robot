*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***
#Trace Case - IA Exemptions Team queue - Category not IA
#  [Tags]  TTCS20-1124  TTCS20- 1429
#
#       Login as E&C Central Agent
#       Sleep      3s
#       #Display Most Recent Cases From Generalist Enquiries – Trace Queue
#       #Agent Creates Case - Trace
#       Reset View (if applicable)
#       Go To Cases Tab
#		Sleep  3s
#       Central Agent Creates Case - Trace
#       Sleep  5s
##      Open Most Recent Case From E&C Central Trace Queue
#       Click Edit
#       Click Drop Down By Name     Category
#       Select Dropdown Option      Test - General
#       Sleep  2s
#       Click Drop Down By Name    Subcategory
#       Select Dropdown Option     Test - General - Other
#       Click Drop Down By Name     Case type
#       Select Dropdown Option      Feedback
#       Click Drop Down By Name     Assign Trace Case
#       Select Dropdown Option      IA Exemptions Team
#       Click Drop Down By Name     Third Party Contacting?
#       Select Dropdown Option       Yes
#       Click Drop Down By Name     Relationship to person contacting
#       Select Dropdown Option      Friend
#       Sleep  2s
#       Click Save
#       Check Error Message Content
#       Sleep   2s
#       Click Cancel
#

Trace Case - IA Exemptions Team queue - Positive scenario
  [Tags]    TTCS20-1535  TTCS20-1124  TTCS20- 1429

       Login as E&C Central Agent
       Sleep      3s
       #Display Most Recent Cases From Generalist Enquiries – Trace Queue
       Sleep  4s
       Reset View (if applicable)
       Go To Cases Tab
		Sleep  3s
       #Agent Creates Case - Trace
       Central Agent Creates Case - Trace
       Sleep  5s
       Click Edit
       Click Drop Down By Name     Category
       Select Dropdown Option      International arrivals
       Click Drop Down By Name     Subcategory
       Select Dropdown Option      International Arrivals - Exemptions
       Click Drop Down By Name     Case type
       Select Dropdown Option      International Arrival Exemption Request
       Click Drop Down By Name     Assign Trace Case
       Select Dropdown Option      IA Exemptions Team
       Click Drop Down By Name     Third Party Contacting?
       Select Dropdown Option       Yes
       Click Drop Down By Name     Relationship to person contacting
       Select Dropdown Option      Friend
       Click Save
       Wait Until Page Has Saved
       Case Owner Text Should Be      IA Exemptions Team