*** Variables ***
${BROWSER}   headless chrome   #Default, set in console to override
#${Env}          comptest       #Default, set in console to override

${login-url}        https://nhs--codedeploy.lightning.force.com/lightning/page/home
${logout-url}       https://nhs--codedeploy.my.salesforce.com/secur/logout.jsp
${home-url}         https://nhs--codedeploy.lightning.force.com/lightning/page/home

${cases-url}        https://nhs--codedeploy.my.salesforce.com/lightning/o/Case/list?filterName=Recent

# Test logins

${test-generalist-username}         agent.testgeneralist2@nhs.cd
${test-specialist-username}         agent.testspecialist2@nhs.cd
${test-expert-username}             geetha.testexpert@nhs.cd
${rit-username}                     agent-rit@uk.ibm.com.nhs.cd

# Trace logins
${trace-generalist-username}        agent.tracegeneralist@nhs.cd
${trace-specialist-username}        agent.tracespecialist1@nhs.cd
${trace-expert-username}            agent.traceexpert1@nhs.cd
${ia-surge-team-username}           geetha.iatrace@nhscd.com

# E&C Central Login
${efc-central-team-username}        geetha@uk.ibm.com.centralteam.cd

# Password shared by all users
${generic-password}                 Thames01022019#

#RTSLTS Users
${RTSAdvisor_Username}              geetha.rtslts@.nhs.cd


*** Keywords ***
Open Browser and Go To Salesforce Login
    ${options}=     Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method     ${options}    add_argument    --disable-notifications
    Call Method     ${options}    add_argument      --start-maximized
#
    Call Method     ${options}    add_argument      --no-sandbox
    Call Method     ${options}    add_argument     --disable-notifications
    Call Method     ${options}    add_argument      --headless
    Call Method     ${options}    add_argument      --start-maximized
    Call Method     ${options}    add_argument      --disable-gpu
    Call Method     ${options}    add_argument      --window-size\=1920,1080
    Call Method     ${options}    add_argument      --disable-dev-shm-usage

    Open Browser   ${login-url}     ${BROWSER}   options=${options}

Go To Salesforce login
    Go To   ${login-url}

Logout of Salesforce
    Go To   ${logout-url}

Go To Cases Tab
    Go To   ${cases-url}

Login as Generalist Test Agent
        Input Text   id:username   ${test-generalist-username}
        Input Text   id:password   ${generic-password}
        Click Element    id:Login

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

Test Template       Generate Long Form (Test Case) In Digital Helper And Verify It's Created in Salesforce

Default Tags  CS20-162  CS20-163    CS20-421  CS20-95  CS20-1712  CS20-221  data-creation TTCS20-2685  TTCS20-3041  TTCS20-3045

*** Variables ***
# Input details
${name}      Moaning Myrtle
${email}     myrtle@test.com
${message}   this is a desc
${test-barcode}   ABC12345678
${search}       //input[@placeholder='Search this list...']


*** Keywords ***
Generate Long Form (Test Case) In Digital Helper And Verify It's Created in Salesforce
    [Arguments]  ${flow-type}   ${case-type}   ${question}=optional         ${test-type}=optional      ${sub-question}=optional
    ${message-date}=     Create Description With Date And Time   ${message}
    ${email-date}=     Create Email With Date    ${email}

    Complete Long Form User Flow      flow-type=${flow-type}    case-type=${case-type}     question=${question}       sub-question=${test-type}    test-type=${test-type}      name=${name}    email=${email-date}    message=${message-date}
    Check Confirmation Page Content
    Wait Until Element Is Visible     ${case-number-element}
    Sleep  7s
    ${case-number}=     Get Text       ${case-number-element}
    sleep  5s


#   Check Salesfoce
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

#   Account Name
    Page Should Contain     ${name}

#   Case Origin
    Page Should Contain     Online-Web

#   Subject
    Page Should Contain     Moaning Myrtle , Test, ${case-type}, Online-Web

#   Description
    Page Should Contain     ${message-date}

#   Web Email
    Page Should Contain     ${email-date}

#   Test Barcode
    Page Should Contain     ${test-barcode}