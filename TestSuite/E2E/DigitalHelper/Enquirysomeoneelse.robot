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
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/LongForm.robot

Test Setup      Open Browser, Go To Digital Helper and Accept Cookies
Test Teardown   Close Browser



*** Variables ***
${name}     Draco Malfoy
${email}    malfoy@test.com
${message}  this is a desc
${case1}
${global-search}    //button[@aria-label="Search"]
${message-date}=     Create Description With Date And Time   ${message}
${email-date}=     Create Email With Date    ${email}


*** Test Cases ***
Checking Thirdparty contacting details reflected in Salesforce
    [Tags]      TTCS20-4313

    Complete Long Form User Someone else Flow  flow-type=4        case-type=Enquiry      question=Symptoms & Testing       sub-question=I need to report a test result       test-type=PCR test       name=Test        email=testtrace4@gmail.com        message=Automated regression testing
    sleep   2s
     Wait Until Element Is Visible     ${case-number-element}
    Sleep  10s
    ${case-number}=     Get Text      ${case-number-element}
    sleep  5s

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
    sleep  5s

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
    Page Should Contain     Online-Web
    Third Party Contact Text Should Be   Yes




