#########: This report name in the  below test case is no more in use. So this test cane be rused for another rport



*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/ReportsGeneration.robot
# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1



*** Test Cases ***
Test Specialist Case Record Type Report
  [Tags]  TTCS20-1323
  Login as Specialist Test Agent
  Sleep      3s
  Reset View (if applicable)
  Specialist Case Record Type Report Validation
#
#
Trace Specialist Case Record Type Report
      [Tags]  TTCS20-1322
      Login as Specialist Trace Agent
      Sleep      3s
      Reset View (if applicable)
      Specialist Case Record Type Report Validation