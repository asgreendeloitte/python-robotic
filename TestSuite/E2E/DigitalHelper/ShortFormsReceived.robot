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

Test Setup      Open Browser, Go To Digital Helper and Accept Cookies
Test Teardown   Close Browser

Test Template       Generate Short Form (Trace Case) In Digital Helper And Verify It's Created in Salesforce

Default Tags  CS20-172  CS20-164    CS20-421  CS20-118  CS20-220    data-creation   TTCS20-3453

*** Variables ***
${name}     Draco Malfoy
${email}    malfoy@test.com
${message}  Training Environment data creation for test case.
${case1}
${global-search}    //button[@aria-label="Search"]

*** Test Cases ***
#Feedback
F-ST        0   Feedback    Symptoms & Testing
F-SaH        0   Feedback    Stay at home support
#F-CT        0   Feedback    Contact tracing
#F-BU        0   Feedback    My business / organisation
#F-IA        0   Feedback    International travel
#
###Complaints
#C-ST        0   Complaint   Symptoms & Testing
#C-CT        0   Complaint   Contact tracing
#C-SI        0   Complaint   Stay at home support
C-BU        0   Complaint   My business / organisation
C-IA        0   Complaint   International travel
#
####Enquirys
### Symptoms & Testing
E-ST-Q1     5   Enquiry     Symptoms & Testing             I might have symptoms of coronavirus         No test was taken
#E-ST-Q2     4   Enquiry     Symptoms & Testing             I need help booking a test                   Myself
#E-ST-Q2     4   Enquiry     Symptoms & Testing             I need help booking a test                   Someone else
#E-ST-Q3     5   Enquiry     Symptoms & Testing             I need to report a test result               No test was taken
#E-ST-Q4     5   Enquiry     Symptoms & Testing             I need help with my home test kit            No test was taken
#E-ST-Q5     3   Enquiry     Symptoms & Testing             coronavirus test I've taken                  No test was taken
E-ST-Q6     5   Enquiry     Symptoms & Testing             understanding the results of my test         No test was taken
E-ST-Q7     5   Enquiry     Symptoms & Testing             I have not received my test result           No test was taken
#E-ST-Q8     4   Enquiry     Symptoms & Testing             enquiry about testing when travelling        No, I have not taken a test
#E-ST-Q9     2   Enquiry     Symptoms & Testing             My child was told by their school to isolate
#E-ST-Q10    3  Enquiry    Symptoms & Testing               My enquiry is not listed                     No test was taken

##### Contact tracing
##E-CT-Q1     2   Enquiry     Contact tracing                 contact of someone with coronavirus (COVID-19)
##E-CT-Q2     2   Enquiry     Contact tracing                 enquiry/complaint about the contact tracing process
#E-CT-Q3     1   Enquiry     Contact tracing                 I was contacted incorrectly or with someone else’s information
##E-CT-Q4     2   Enquiry     Contact tracing                 I was in contact with someone who tested positive
##E-CT-Q5     2   Enquiry     Contact tracing                 question about how NHS Test and Trace gets in touch with me
##E-CT-Q6     2   Enquiry     Contact tracing                 I would like to apply for a self-isolation payment
#E-CT-Q7     2   Enquiry     Contact tracing                 I have not received my test result yet
#E-CT-Q8     2   Enquiry     Contact tracing                 I was wearing PPE but I have been asked to self-isolate
##E-CT-Q9     1   Enquiry     Contact tracing                 My enquiry is not listed
##

#### Self-isolation support
#E-SI-Q1     2   Enquiry     Self-isolation support          contact with someone who tested positive
##E-SI-Q2     2   Enquiry     Self-isolation support          guidance about my self isolation time period
#E-SI-Q3     2   Enquiry     Self-isolation support          I have a question about self-isolation payments
##E-SI-Q4     4   Enquiry     Self-isolation support          support during isolation                   I need financial support
##E-SI-Q5     4   Enquiry     Self-isolation support          support during isolation                   help getting food and other essentials
###
###This one has double sub Q leaving it until last
##E-SI-Q6-M    6   Enquiry     Self-isolation support          support during isolation                   wellbeing and mental health support      Myself
##E-SI-Q6-SE   6   Enquiry     Self-isolation support          support during isolation                   wellbeing and mental health support      Someone else
##
##E-SI-Q7     4   Enquiry     Self-isolation support          support during isolation                   I do not feel safe self-isolating at home
#E-SI-Q8     3   Enquiry     Self-isolation support          support during isolation                   My concern is not listed here
##E-SI-Q9     1   Enquiry     Self-isolation support          I have been named as a close contact of someone in error
##E-SI-Q10    1   Enquiry     Self-isolation support          My self-isolation dates are incorrect
#E-SI-Q11    1   Enquiry     Self-isolation support          My enquiry is not listed
##

#### Staying at home

#E-SaH-Q1     2   Enquiry     Stay at home support         I have COVID-19 and want to know when to stay at home and what to do
#E-SaH-Q2     2   Enquiry     Stay at home support         I was in contact with someone who tested positive for coronavirus (COVID-19)
E-SaH-Q3     2   Enquiry     Stay at home support         I have a question about self-isolation payments
#E-SaH-Q4     4   Enquiry     Stay at home support          I need stay at home support for myself or someone I care for       I need financial support
#E-SaH-Q5     4   Enquiry     Stay at home support          I need stay at home support for myself or someone I care for       I need help getting food and other essentials
#E-SaH-Q6     6   Enquiry     Stay at home support          I need stay at home support for myself or someone I care for       I need wellbeing and mental health support for myself or someone else      Myself
#E-SaH-Q7     4   Enquiry     Stay at home support          I need stay at home support for myself or someone I care for      I need support because I do not feel safe at home
#E-SaH-Q8     3   Enquiry     Stay at home support          I need stay at home support for myself or someone I care for      My concern is not listed here
E-SaH-Q9     1   Enquiry     Stay at home support         My enquiry is not listed
#
##### My business / organisation
E-BU-Q1     2   Enquiry     My business / organisation      I run an organisation that needs to access testing or has a question
#E-BU-Q2     2   Enquiry     My business / organisation      I need advice on COVID safety requirements for my business or organisation
#E-BU-Q3     1   Enquiry     My business / organisation      My enquiry is not listed
##
###### International travel
#E-IA-Q1     5   Enquiry     International travel            Testing when travelling                     No, I have not taken a test
E-IA-Q2     5   Enquiry     International travel            Quarantine and stay at home guidance        No, I have not taken a test
#E-IA-Q3     5   Enquiry     International travel            Red and non-red listed countries            No, I have not taken a test
E-IA-Q4     5   Enquiry     International travel            Job, medical and other exemptions           No, I have not taken a test
#E-IA-Q5     5   Enquiry     International travel            Scotland, Wales and Northern Ireland        No, I have not taken a test
#E-IA-Q6     3   Enquiry     International travel            My enquiry is not listed                    No, I have not taken a test

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
    Login as E&C Central Agent
    Log to Console  ${case-number}
    Sleep   5s
    Open cases tab and select list view
#    Open most recent case   ${case-type}    ${topic}
    Sleep   3s

    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']


    #    Display Most Recent Cases From Digital Helper and Email Cases - Test Queue
#    sleep  2s
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