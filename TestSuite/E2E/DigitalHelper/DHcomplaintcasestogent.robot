*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/Confirmation.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

Test Setup      Open Browser, Go To Digital Helper and Accept Cookies
Test Teardown   Close Browser

Test Template       Generate Short Form (Trace Case) In Digital Helper And Verify It's Created in Salesforce

Default Tags    TTCS20-3785

*** Variables ***
${name}     Draco Malfoy
${email}    malfoy@test.com
${message}  Training Environment data creation for test case.
${case1}
${global-search}    //button[@aria-label="Search"]
${accept}       (//button[contains(@name,'MassAccept')])[1]
${edit}      (//button[@name='Edit'])[1]

*** Test Cases ***
#Feedback
#F-ST        0   Feedback    Symptoms & Testing
#F-SaH        0   Feedback    Stay at home support

#
###Complaints
C-ST        0   Complaint   Symptoms & Testing
#C-CT        0   Complaint   Contact tracing
#C-SI        0   Complaint   Stay at home support
#C-BU        0   Complaint   My business / organisation
#C-IA        0   Complaint   International travel
#
####Enquirys
### Symptoms & Testing
#E-ST-Q1     5   Enquiry     Symptoms & Testing             I might have symptoms of coronavirus         No test was taken
#E-ST-Q2     4   Enquiry     Symptoms & Testing             I need help booking a test                   Myself
#E-ST-Q2     4   Enquiry     Symptoms & Testing             I need help booking a test                   Someone else
#E-ST-Q3     5   Enquiry     Symptoms & Testing             I need to report a test result               No test was taken
#E-ST-Q4     5   Enquiry     Symptoms & Testing             I need help with my home test kit            No test was taken
#E-ST-Q5     3   Enquiry     Symptoms & Testing             coronavirus test I've taken                  No test was taken
#E-ST-Q6     5   Enquiry     Symptoms & Testing             understanding the results of my test         No test was taken
#E-ST-Q7     5   Enquiry     Symptoms & Testing             I have not received my test result           No test was taken
#E-ST-Q8     4   Enquiry     Symptoms & Testing             enquiry about testing when travelling        No, I have not taken a test
#E-ST-Q9     2   Enquiry     Symptoms & Testing             My child was told by their school to isolate
#E-ST-Q10    3  Enquiry    Symptoms & Testing               My enquiry is not listed                     No test was taken


#### Staying at home




*** Keywords ***
Generate Short Form (Trace Case) In Digital Helper And Verify It's Created in Salesforce
    [Arguments]  ${flow-type}   ${case-type}   ${topic}   ${question}=optional     ${sub-question}=optional     ${sub-question-2}=optional
    ${message-date}=     Create Description With Date And Time   ${message}
    ${email-date}=     Create Email With Date    ${email}
    Log     In the test
    Log     ${question}
    Complete Short Form User Flow   flow-type=${flow-type}    case-type=${case-type}  topic=${topic}  question=${question}    sub-question=${sub-question}  sub-question-2=${sub-question-2}  name=${name}    email=${email-date}    message=${message-date}
    #Get Case Number
    Wait Until Element Is Visible     ${case-number-element}
    Sleep  10s
    ${case-number}=     Get Text      ${case-number-element}
    sleep  5s
   # ${case1} = ${case-number}

#   Check Salesfore
    Go To Salesforce login
    Login as MP Trace team agent
    Log to Console  ${case-number}
    Sleep   5s
    #Open cases tab and select list view
   # Display Most Recent Cases From inbound tier2 – Trace Queue
   Open Most Recent Case From Complaints Team - Trace Queue
#    Open most recent case   ${case-type}    ${topic}
    Sleep   6s

#    Click Element   ${global-search}
#    sleep   3s
#    Click Element   (//input[@type='search'])[last()]
#    Input Text      (//input[@type='search'])[last()]   ${case-number}
#    sleep   3s
#    PRESS KEYS  None   ENTER
#    sleep  5s
#    Click Element   //a[text()='${case-number}']


    #    Display Most Recent Cases From Digital Helper and Email Cases - Test Queue
#    sleep  2s

#    Click Element At Coordinates   ${search}     0   0
#    Click Element   ${search}
#    Input Text      ${search}     ${case-number}
#    #Input Text      ${search}     ${case1}
#    sleep   7s
#    PRESS KEYS  None   ENTER
#    sleep   2s
#    Click Element   ${first-list-option}

#    Account Name
    Page Should Contain     ${name}

#   Case Origin
    Page Should Contain     Online-Web

#   Description
    Page Should Contain     ${message-date}
#
#    # Web Email
    Page Should Contain     ${email-date}

    page should contain element   ${accept}
    page should contain element   ${edit}
    sleep  3s
    click element  ${accept}

    #Page should contain   You have accepted Cases from the queue and are now their owner
    sleep  3s
    page should not contain element   ${accept}
    click element  ${edit}
    sleep  3s
    Click Save
    Wait Until Page Has Saved




Open most recent case
    [Arguments]  ${case-type}   ${topic}
    Run Keyword If    '${topic}'=='Symptoms & Testing'
    ...     Open most recent Test case    ${case-type}
    ...     ELSE       Open most recent Trace case   ${case-type}


Open most recent Test case
    [Arguments]     ${case-type}
    Run Keyword If    '${case-type}'=='Complaint'   Display Most Recent Cases From Complaints Team – Test Queue CN
    Run Keyword If    '${case-type}'!='Complaint'   Display Most Recent Cases From Digital Helper and Email Cases - Test Queue CN
#                                                    Open Most Recent Case From Specialist Enquiries - Test Queue

Open most recent Trace case
    [Arguments]     ${case-type}
    Run Keyword If    '${case-type}'=='Complaint'   Display Most Recent Cases From Complaints Team - Trace Queue CN
    Run Keyword If    '${case-type}'!='Complaint'   Display Most Recent Cases From Specialist Enquiries – Trace Queue CN