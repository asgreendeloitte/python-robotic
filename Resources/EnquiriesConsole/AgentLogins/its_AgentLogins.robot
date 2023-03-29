*** Variables ***
${BROWSER}     chrome   #Default, set in console to override

${login-url}        https://nhs--itstest.lightning.force.com/lightning/page/home
${logout-url}       https://nhs--itstest.lightning.force.com/secur/logout.jsp
${home-url}         https://nhs--itstest.lightning.force.com/lightning/page/home
${cases-url}        https://nhs--itstest.lightning.force.com/lightning/o/Case/list?filterName=Recent


# DHQA Logins
${test-dhqa-username}                   spurini@deloitte.co.uk.itstest
${ec-dhqa-agent}                        efctier.automation@test-and-trace.nhs.uk.itstest
${test-specialist-username}             agent.testspecialist@nhs.uat

# PPAT Agent logins
${its-public-enq-team-member}           spurini@deloitte.co.uk.ppat.its.enq
${its-public-complaints-team-member}    spurini@deloitte.co.uk.ppat.its.cplnt
${its-info-rights-team-member}          spurini@deloitte.co.uk.ppat.its.info
${its-parly-team-member}                spurini@deloitte.co.uk.ppat.parly
${its-ppat-enq-super-user}              spurini@deloitte.co.uk.ppat.its.enq.super
${its-ppat-reporting-team-member}       spurini@deloitte.co.uk.ppat.its.reporting.user


#Web Chat View Login
${webchat-its-mp-compl-trace-username}             automation.efc.complaints.agent@deloitte.co.uk.itstest
${webchat-its-qa-username}                         automation.qa@deloitte.co.uk.itstest
${webchat-its-case-management-username}            automation.webchat.case.management@deloitte.co.uk.itstest
${webchat-its-expert-team-username}                automation.inbound.expert.team.lead@deloitte.co.uk.itstest
${webchat-its-rit-agent-username}                  automation.rit.advisor@deloitte.co.uk.itstest

# Password shared by all users
${Release10pswd}                        tt-Enq-R10-2022
${Release11pwd}                         tt-Enq-R11-2021
${Release12pwd}                         tt-Enq-R11-2022

*** Keywords ***
Open Browser and Go To Salesforce Login
    ${options}=     Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method     ${options}    add_argument    --disable-notifications
    Call Method     ${options}    add_argument      --start-maximized
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
#    Reload Page


# DHQA Test logins
Login as dhqa Test Agent
        Input Text   id:username   ${test-dhqa-username}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as dhqa E&C Agent working a Test or Trace case
        Input Text   id:username   ${ec-dhqa-agent}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

# PPAT ITS Login Credentials

Login as PPAT Public Enquiries team member
        Input Text   id:username   ${its-public-enq-team-member}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as PPAT Public Complaints team member
        Input Text   id:username  ${its-public-complaints-team-member}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as PPAT Information rights team member
        Input Text   id:username   ${its-info-rights-team-member}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as PPAT Parliamentary rights team member
        Input Text   id:username   ${its-parly-team-member}
        Input Text   id:password   ${Release12pwd}
        Click Element    id:Login

Login as PPAT Enquiries Super User
        Input Text   id:username   ${its-ppat-enq-super-user}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as PPAT Reporting team member
        Input Text   id:username   ${its-ppat-reporting-team-member}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

# WebChat User Credentials

Login as WebChat Case Management User
        Input Text   id:username   ${webchat-its-case-management-username}
        Input Text   id:password   ${Release11pwd}
        Click Element    id:Login

Login as WebChat Quality Assurance User
        Input Text   id:username   ${webchat-its-qa-username}
        Input Text   id:password   ${Release11pwd}
        Click Element    id:Login

Login as WebChat expert team User
        Input Text   id:username   ${webchat-its-expert-team-username}
        Input Text   id:password   ${Release11pwd}
        Click Element    id:Login

Login as WebChat RIT agent User
        Input Text   id:username   ${webchat-its-rit-agent-username}
        Input Text   id:password   ${Release11pwd}
        Click Element    id:Login

Login as WebChat MP Complaints test and trace User
        Input Text   id:username   ${webchat-its-mp-compl-trace-username}
        Input Text   id:password   ${Release11pwd}
        Click Element    id:Login