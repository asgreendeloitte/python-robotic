*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/RelatedTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/CaseDetailsTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/PPATAgentCreateCase.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/CaseDetailsTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/PPAT/RelatedTab.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/ReportsGeneration.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1

*** Test Cases ***

PPAT - PPAT co-created Reports
    [Tags]  TTCS20-4923-01

    Go To Salesforce login
    Login as PPAT Reporting Team Agent
    Reset View (if applicable)
    Go to   https://nhs--uat.sandbox.lightning.force.com/lightning/r/Folder/00l25000000lU3AAAU/view?queryScope=userFolders
    Page should contain         All public cases by case type
    Page should contain         PPAT Parly PQs
    Page should contain         Parly redrafts
    Page should contain         Open and outstanding Parly case
    Page should contain         DSAR volumes & SLA
    Page should contain         PPAT Parly PM/Peer Letters
    Page should contain         PPAT Parly PQ compliance by type
    Page should contain         Compliance by ExCo Group
    Page should contain         Parly cases by type
    Page should contain         Parly cases by type


PPAT - PPAT co-created Dashboards
    [Tags]  TTCS20-4923-02

    Go To Salesforce login
    Login as PPAT Reporting Team Agent
    Reset View (if applicable)
    Go to   https://nhs--uat.sandbox.lightning.force.com/lightning/r/Folder/00l25000000lU3CAAU/view?queryScope=userFolders
    Page should contain         Weekly Parliamentary reporting dashboard
    Page should contain         Parliamentary accountability: month on month KPI compliance
    Page should contain         Public accountability: Monthly Volumes and KPI compliance