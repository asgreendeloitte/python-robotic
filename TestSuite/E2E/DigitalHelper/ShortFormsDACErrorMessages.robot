###### Documentation ##########
#need testing are the ones that have 3 rules on them, so like the test barcode, booking number or form fields, they all have Character Limits, Special Characters aren't allowed and can't be left blank




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

Default Tags  TTCS20-1457    data-creation

*** Variables ***
${name}     Draco Malfoy
${email}    malfoy@test.com
${message}  Training Environment data creation for test case
${ErrorMessagecaptured}       xpath://a[contains(text(),'Select enquiry, feedback or complaint')]
${ErrorMessagecaptured1}       xpath://a[contains(text(),'Select what your feedback is about')]
*** Test Cases ***
##Feedback
F-ST        0   Feedback    Symptoms & Testing
#F-CT        0   Feedback    Contact tracing
#F-SI        0   Feedback    Self-isolation support
#F-BU        0   Feedback    My business / organisation
#F-IA        0   Feedback    International travel

##Complaints
#C-ST        0   Complaint   Symptoms & Testing
#C-CT        0   Complaint   Contact tracing
#C-SI        0   Complaint   Self-isolation support
#C-BU        0   Complaint   My business / organisation
#C-IA        0   Complaint   International travel

##Enquirys
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

### Contact tracing
#E-CT-Q1     2   Enquiry     Contact tracing                 contact of someone with coronavirus (COVID-19)
#E-CT-Q2     2   Enquiry     Contact tracing                 enquiry/complaint about the contact tracing process
#E-CT-Q3     1   Enquiry     Contact tracing                 I was contacted incorrectly or with someone else’s information
#E-CT-Q4     2   Enquiry     Contact tracing                 I was in contact with someone who tested positive
#E-CT-Q5     2   Enquiry     Contact tracing                 question about how NHS Test and Trace gets in touch with me
#E-CT-Q6     2   Enquiry     Contact tracing                 I would like to apply for a self-isolation payment
#E-CT-Q7     2   Enquiry     Contact tracing                 I have not received my test result yet
#E-CT-Q8     2   Enquiry     Contact tracing                 I was wearing PPE but I have been asked to self-isolate
#E-CT-Q9     1   Enquiry     Contact tracing                 My enquiry is not listed

### Self-isolation support
#E-SI-Q1     2   Enquiry     Self-isolation support          contact with someone who tested positive
#E-SI-Q2     2   Enquiry     Self-isolation support          guidance about my self isolation time period
#E-SI-Q3     2   Enquiry     Self-isolation support          I have a question about self-isolation payments
#E-SI-Q4     4   Enquiry     Self-isolation support          support during isolation                   I need financial support
#E-SI-Q5     4   Enquiry     Self-isolation support          support during isolation                   help getting food and other essentials

#This one has double sub Q leaving it until last
#E-SI-Q6-M    6   Enquiry     Self-isolation support          support during isolation                   wellbeing and mental health support      Myself
#E-SI-Q6-SE   6   Enquiry     Self-isolation support          support during isolation                   wellbeing and mental health support      Someone else

#E-SI-Q7     4   Enquiry     Self-isolation support          support during isolation                   I do not feel safe self-isolating at home
#E-SI-Q8     3   Enquiry     Self-isolation support          support during isolation                   My concern is not listed here#E-SI-Q9     1   Enquiry     Self-isolation support          I have been named as a close contact of someone in error
#E-SI-Q10    1   Enquiry     Self-isolation support          My self-isolation dates are incorrect
#E-SI-Q11    1   Enquiry     Self-isolation support          My enquiry is not listed

### My business / organisation
#E-BU-Q1     2   Enquiry     My business / organisation      I run an organisation that needs to access testing or has a question
#E-BU-Q2     2   Enquiry     My business / organisation      COVID safety requirements for my business or organisation
#E-BU-Q3     2   Enquiry     My business / organisation      I'm an employer with a positive case
#E-BU-Q4     1   Enquiry     My business / organisation      My enquiry is not listed

### International travel
#E-IA-Q1     5   Enquiry     International travel            Testing when travelling                     No, I have not taken a test
#E-IA-Q2     5   Enquiry     International travel            Quarantine and self-isolation rules         No, I have not taken a test
#E-IA-Q3     5   Enquiry     International travel            Red and non-red listed countries            No, I have not taken a test
#E-IA-Q4     5   Enquiry     International travel            Job, medical and other exemptions           No, I have not taken a test
#E-IA-Q5     5   Enquiry     International travel            Scotland, Wales and Northern Ireland        No, I have not taken a test
#E-IA-Q6     3   Enquiry     International travel            My enquiry is not listed                    No, I have not taken a test

*** Keywords ***
Generate Short Form (Trace Case) In Digital Helper And Verify It's Created in Salesforce
    [Arguments]  ${flow-type}   ${case-type}   ${topic}   ${question}=optional     ${sub-question}=optional     ${sub-question-2}=optional
    ${message-date}=     Create Description With Date And Time   ${message}
    ${email-date}=     Create Email With Date    ${email}
    Log     In the test
    Log     ${question}
    Complete Short Form User Flow with DAC Error Messages
   # Complete Short Form User Flow with DAC Error Messages   flow-type=${flow-type}    case-type=${case-type}  topic=${topic}  question=${question}    sub-question=${sub-question}  sub-question-2=${sub-question-2}  name=${name}    email=${email-date}    message=${message-date}
    Check Confirmation Page Content

   ######
#    # Check Salesfore
#    Go To Salesforce login
##    Login as E&C Central Agent
##    Open Most Recent Case From E&C Central Trace Queue
#    Login as agent and open most recent case    ${case-type}
#    sleep   3s
#
#    # Case Record Type
#    Page Should Contain     Complaints and Enquiries(Trace)
#
#    # Account Name
#    Page Should Contain     ${name}
#
#    # Status
#    Page Should Contain     New
#
#    # Case Origin
#    Page Should Contain     Online-Web
#
#    # Complaint is set as high and othere are set as medium, need smart way to chekc this
#    # Priority
##    Page Should Contain     High
#
#    # Complaint/Enquiry Type
#    Page Should Contain     Complaint
#
#    # Category
#    Page Should Contain     General
#
#    # the value and the name name for the radio buttons are different so this is failing
#    # Case Theme
##    Page Should Contain     ${topic}
#
#    # Subject
#    Page Should Contain     ${name} , Trace, ${case-type}, Online-Web
#
#    # Description
#    Page Should Contain     ${message-date}
#
#    # Web Email
#    Page Should Contain     ${email-date}

#    Reassign to Test / Trace Should Be       Yes

#Login as agent and open most recent case
    # [Tags]  CS20-1118
   # [Arguments]  ${case-type}
    # Login as Specialist Trace Agent if the case is an Enquiry
  #  Run Keyword If    '${case-type}'=='Enquiry'    Login as Specialist Trace Agent
 #   Run Keyword If    '${case-type}'=='Enquiry'    Open Most Recent Case From Specialist Enquiries – Trace Queue

 #   Run Keyword If    '${case-type}'=='Feedback'    Login as E&C Central Agent
 #   Run Keyword If    '${case-type}'=='Feedback'    Open Most Recent Case From E&C Central Trace Queue

 #   Run Keyword If    '${case-type}'=='Complaint'    Login as Specialist Trace Agent
 #   Run Keyword If    '${case-type}'=='Complaint'    Open Most Recent Case From Complaints Team - Trace Queue