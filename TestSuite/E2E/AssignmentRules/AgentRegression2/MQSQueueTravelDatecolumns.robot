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
Test Teardown   End Test1

*** Test Cases ***

MQS IA Team Travel Date and DateOf Arrival columns
    [Tags]  TTCS20-1521  TTCS20-1883  TTCS20-1997


    Login as MQS IA Agent
    Display Most Recent Cases From MQS IA Team Queue
    Page Should Contain  Travel Date to UK
    Page Should Contain   Date Of Arrival
    Page Should Contain    Date/Time Opened
    sleep   3s

MQS Exemptions Mailbox Travel Date and DateOf Arrival columns
    [Tags]  TTCS20-1521


     Login as MQS IA Agent
    Display Most Recent Cases From MQS Exemptions Mailbox Team Queue
    Page Should Contain  Travel Date to UK
    Page Should Contain   Date Of Arrival
    Page Should Contain    Date/Time Opened
    sleep   3s

MQS Enquiries Mailbox Travel Date and DateOf Arrival columns
    [Tags]  TTCS20-1521


    Login as MQS IA Agent
    Display Most Recent Cases From MQS General Enquiries Mailbox Team Queue
    Page Should Contain  Travel Date to UK
    Page Should Contain   Date Of Arrival
    Page Should Contain    Date/Time Opened
    sleep   3s
MQS IA Team - Exemptions (Case Type) Travel Date and DateOf Arrival columns
     [Tags]  TTCS20-1521


     Login as MQS IA Agent
     Display Most Recent Cases From MQS IA Team - Exemptions (Case Type) Team Queue
     Page Should Contain  Travel Date to UK
     Page Should Contain   Date Of Arrival
     Page Should Contain    Date/Time Opened
     sleep   3s
MQS MP Enquiries Mailbox Travel Date and DateOf Arrival columns
     [Tags]  TTCS20-1521


     Login as MQS IA Agent
     Display Most Recent Cases From MQS MP Enquiries Mailbox Team Queue
     Page Should Contain  Travel Date to UK
     Page Should Contain   Date Of Arrival
     Page Should Contain    Date/Time Opened
     Sleep   3s
