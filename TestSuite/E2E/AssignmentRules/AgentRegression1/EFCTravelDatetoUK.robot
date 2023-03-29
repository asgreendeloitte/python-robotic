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

*** Test Cases ***
E&C Travel Date to UK validation
  [Tags]  TTCS20-1827

      Login as E&C Central Agent
      Sleep      3s
      #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
      #Agent Creates Case
      Display Most Recent Cases From inbound tier2 - Test Queue
      Central Agent Creates Case
      Sleep  3s
      Page Should Contain  Travel Date to UK
      Click Edit
      Click Drop Down By Name     Case Theme
      Select Dropdown Option      Symptoms and testing
      Click Drop Down By Name     Case Topic
      Select Dropdown Option      I am concerned I might have symptoms of coronavirus (COVID-19)
      Input Date Field By Name    Travel Date to UK    09/08/2021
      Click Save
      Wait Until Page Has Saved
