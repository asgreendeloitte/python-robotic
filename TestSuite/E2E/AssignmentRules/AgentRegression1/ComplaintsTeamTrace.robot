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

*** Variables ***
${new-case-btn}                    //a[@title='New']
${new-case-btn_Trace}          (//span[contains(text(),'Complaints and Enquiries(Trace)')])
#${account-name-lookup}             //input[@title='Search Accounts']
#${account-name-lookup-first-option}         (//ul[contains(@class, 'lookup__list')]/li)[1]
#${next-modal-btn}                  //button/span[contains(text(), 'Next')]
${supplier-complaint-menu}         //span[contains(text(), 'Supplier complaint is about')]/../../../div/div/div/div/div/a

*** Test Cases ***

Trace Agent assign the case to Complaints Trace Team if Case Type is complaint
  [Tags]  TTCS20-1143  TTCS20-1136

      Login as Generalist Trace Agent
      #Display Most Recent Cases From Generalist Enquiries – Trace Queue
      Go To Cases Tab
        Sleep  3s
      Reset View (if applicable)
      Agent Creates Case - Trace - Complaint1
      Sleep  4s
      Click Edit
      Click Drop Down By Name     Assign Trace Case
      Select Dropdown Option      Complaints Team - Test & Trace
      Click Save
      Wait Until Page Has Saved
      Case Owner Text Should Be       Complaints Team – Test & Trace


Trace Agent Can't assign the case to Complaints Trace Team if Case Type is notcomplaint
  [Tags]  TTCS20-1143

      Login as Generalist Trace Agent
      #Display Most Recent Cases From Generalist Enquiries – Trace Queue
      Reset View (if applicable)
      Go To Cases Tab
        Sleep  3s
      Agent Creates Case - Trace1
      Sleep  4s
      Click Edit
      Click Drop Down By Name     Assign Trace Case
      Select Dropdown Option      Complaints Team - Test & Trace
      Click Save
      Sleep  2s
      Check Error Message Content
      Sleep  2s
      Click Cancel

Complaints & MP Trace Team (Team Lead or Agent) - Capture the Supplier of the agent who the complaint is about
    [Tags]  TTCS20-4538-01   TTCS20-5235

     Go To Salesforce login
     Login as MP Trace team agent
     Display Most Recent Cases From MP Trace Queue
     Click Element                   ${new-case-btn}
     Click Element                   ${next-modal-btn}
     Sleep  3s
      Click Element                   ${account-name-lookup}
     Click Element                   ${account-name-lookup-first-option}
     sleep   2s
     Click Drop Down By Name         Case Origin
     Select Drop down option         Online-Email

     Click Drop Down By Name        Case type
     #Select Drop down option        Complaint
    # Scroll Element Into View    //*[@name="Call_Logger_ID__c"]
     Select Drop down option complaints
#     Click Element                   ${account-name-lookup}
#     Click Element                   ${account-name-lookup-first-option}
     sleep   2s
     Click Save
     sleep   3s
     Click Edit
     sleep   2s
     Click Drop Down By Name      Category
     Select Dropdown Option       Vaccinations
     Click Drop Down By Name      Category
     Select Dropdown Option       Anti-Viral
     Click Drop Down By Name      Supplier complaint is about
     Select Dropdown Option       Serco
     Click Drop Down By Name      Supplier complaint is about
     Select Dropdown Option       HGS
     Click Drop Down By Name      Supplier complaint is about
     Select Dropdown Option       Sitel
     Click Drop Down By Name      Supplier complaint is about
     Select Dropdown Option       Mitie
     Click Drop Down By Name      Supplier complaint is about
     Select Dropdown Option       G4S
     Click Drop Down By Name      Supplier complaint is about
     Select Dropdown Option       DHL
     Click Drop Down By Name      Supplier complaint is about
     Select Dropdown Option       Capita
     Click Drop Down By Name      Supplier complaint is about
     Select Dropdown Option       Medacs Healthcare
     sleep   2s

Not Complaints & MP Trace Team (Team Lead or Agent) - I CAN NOT see a field titled ‘Supplier complaint is about’
    [Tags]  TTCS20-4538-02

     Go To Salesforce login
     Login as Generalist Test Agent
     Reset View (if applicable)
     Go To Cases Tab
     Sleep  3s
     Agent Creates Case
     sleep   3s
     Click Edit
     sleep   2s
     ELEMENT SHOULD NOT BE VISIBLE  ${supplier-complaint-menu}