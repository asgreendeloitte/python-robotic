*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  DateTime

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/UserRoleGeneralist&Specialist.robot
# Teardown
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Variables ***

${DisplayAsSplitView}            xpath://div[@title='Display as Split View']
${TableView}                      xpath://li[@title='Table']

*** Test Cases ***

User Role - Generalist
        [Tags]  TTCS20-2006

        Login as Tier 1 Test & Trace Agent
        Sleep      3s
        Display Most Recent Cases From General Complaints & Enquiries- Test Queue
        Open Most Recent Case From General Complaints & Enquiries- Test Queue
        Sleep   2s
        Click Close Case Tab
        Sleep   2s
        Click Details Tab
        Sleep   2s
        Change Owner To Generalist User   Manju Tier 2 Test & Trace              ####please update the user name variable based on environment
        Wait Until Case Owner Has Saved
        Execute javascript  window.scrollTo(0,900)
        Agent access Knowlege Articles
        Close tabs JS
#        Click Element   ${DisplayAsSplitView}
#        Click Element   ${TableView}
        Sleep   3s
        Display Most Recent Cases From Generalist Enquiries – Trace Queue
        Open Most Recent Case From Generalist Enquiries – Trace Queue
        Sleep   2s
        Click Details Tab
        Sleep   2s
        Change Owner To Generalist User   Manju Tier 1 Test & Trace                ####please update the user name variable based on environment
        Wait Until Case Owner Has Saved
        Click Close Case Tab
        Sleep   2s
        Click Help
        Sleep   2s




#User Role - Specialist
        #[Tags]  TTCS20-2007

      #  Login as Tier 2 Test & Trace Agent
       # Sleep      3s

       # Display Most Recent Cases From Generalist Enquiries – Trace Queue
       # Open Most Recent Case From General Complaints & Enquiries- Test Queue
       # Sleep   2s
      #  Click Close Case Tab
     #   Sleep   2s
      #  Click Details Tab
      #  Sleep   2s
     #   Change Owner To Specialist User   Manju Tier 2 Test & Trace                    ####please update the user name variable based on environment
      #  Wait Until Case Owner Has Saved
      #  Agent access Knowlege Articles
     #   Close tabs JS
     #   Sleep   2s
     #   Display Most Recent Cases From Specialist Enquiries – Trace Queue
     #   Open Most Recent Case From Specialist Enquiries – Trace Queue
      #  Sleep   2s
      #  Click Details Tab
      #  Sleep   2s
     #   Change Owner To Specialist User   Manju Tier 2 Test & Trace                    ####please update the user name variable based on environment
     #   Wait Until Case Owner Has Saved
     #   Click Close Case Tab
      #  Sleep   2s
     #   Click Help
     #   Sleep   2s
