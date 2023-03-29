*** Variables ***
${BROWSER}     chrome   #Default, set in console to override
#${Env}          dev       #Default, set in console to override

${login-url}        https://nhs--dev.sandbox.lightning.force.com/lightning/page/home
${logout-url}       https://nhs--dev.sandbox.lightning.force.com/secur/logout.jsp


${cases-url}        https://nhs--dev.sandbox.lightning.force.com/lightning/o/Case/list?filterName=Recent
${reports-url}      https://nhs--dev.sandbox.lightning.force.com/lightning/o/Report/home?queryScope=mru
${accounts-url}     https://nhs--dev.sandbox.lightning.force.com/lightning/o/Account/list?filterName=Recent
${home-url}         https://nhs--dev.sandbox.lightning.force.com/lightning/page/home

# Test logins
${test-generalist-username}       	hhtest.generalist@nhs.comptest
${test-specialist-username}         agent.testspecialist@nhs.comptest
${test-expert-username}             georgetestexpert@nhs.comptest
${rit-username}                     agent-rit@uk.ibm.com.nhs.comptest
${tier2-username}                   tier2testtrace@nhs.comptest
${tier1-username}                   automation.tier.1.test.and.trace.agent@deloitte.co.uk.comptest

# Trace logins
${trace-generalist-username}        agent.tracegeneralist@nhs.comptest
${trace-specialist-username}        agent.tracespecialist1@nhs.comptest
${trace-expert-username}            george.traceexpert@nhs.comptest
${ia-surge-team-username}           kieran.iasurgeteam@nhs.comptest
${efc-complaints-agent-username}    automation.efc.complaints.agent@deloitte.co.uk.comptest
${dhqa-agent-username}              automation.efc.dentral.team@deloitte.co.uk.comptest

# E&C Central Login
#${efc-central-team-username}        geetha@uk.ibm.com.centralteam.comptest
${efc-central-team-username}        george.centralteam@nhs.comptest
${RTSAdvisor_Username}              george.rtslts@nhs.comptest
${QualityAssurance-username}        auto.qa@deloitte.co.uk.comptest


#IANTO Agent Login
${IANTO-agent_Username}              iantotest@nhs.comptest



# Password shared by all users
${generic-passwordNew}                  Comptest1234!
${generic-passwordNew1}                 Comptest1234!1
${RTSPassword}                          tt-Enq-R4-2021
${Password-1}                           Pyramid123!
${generic-passwordNew2}                 Pyramid123!
${RTSPassword}                          tt-Enq-R4-2021
${cookies-password}                     Cookies1!
${Release11pswd}                        tt-Enq-R11-2021
${Release12pswd}                        tt-Enq-R11-2022
${Release13pswd}                        tt-Enq-R13-2022
${Release14pswd}                        tt-Enq-R14-2022
${Release15pswd}                        tt-Enq-R14-2023
${Release16pswd}                        tt-Enq-R15-2023

#Web Chat View Login
${webchat-view-username}                       spurini@deloitte.co.uk.webchat
${webchat-qa-username}                         automation.qa@deloitte.co.uk.comptest
${webchat-expert-team-username}                automation.expert.team.agent@deloitte.co.uk
${webchat-rit-agent-username}                  auto.rit.advisor@deloitte.co.uk
${webchat-mp-compl-trace-username}             automation.complaints.my.trace.agent@deloitte.co.uk.comptest
${webchat-content-manager-username}            automation.content.manager@deloitte.co.uk.comptest
${parliamentary-rights-team-member}            automation.parli.agent@deloitte.co.uk.dev
${public-complaints-team-member}               automation.public.complaints.agent@deloitte.co.uk.dev
${public-complaints-super-user}                automation.pc.superuser@deloitte.co.uk.dev
${information-rights-team-member}              automation.info.rights.agent@deloitte.co.uk.dev
${information-rights-super-user}               automation.information.rights.superuser@deloitte.co.uk.dev
${public-enq-team-member}                      automation.pe.agent@deloitte.co.uk.dev
${public-enq-super-user}                       automation.pe.superuser@deloitte.co.uk.dev

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

Go To Reports Tab
    Go To   ${reports-url}
#    Reload Page

Go To Accounts Tab
    Go To   ${accounts-url}

Go To Home Tab
    Go To   ${home-url}

# Test logins
Login as Generalist Test Agent
        Input Text   id:username   ${test-generalist-username}
        Input Text   id:password   ${Release15pswd}
        Click Element    id:Login

Login as Specialist Test Agent
        Input Text   id:username   ${test-specialist-username}
        Input Text   id:password   ${generic-passwordNew}
        Click Element    id:Login

Login as Expert Test Agent
        Input Text   id:username   ${test-expert-username}
        Input Text   id:password   ${generic-passwordNew}
        Click Element    id:Login

Login as Tier 2 Test & Trace Agent
        Input Text   id:username   ${tier2-username}
        Input Text   id:password   ${Release14pswd}
        Click Element    id:Login


Login as RIT Advisor
        Input Text   id:username   ${rit-username}
        Input Text   id:password   ${generic-passwordNew}
        Click Element    id:Login

Login as Tier 1 Test & Trace Agent
        Input Text   id:username   ${tier1-username}
        Input Text   id:password   ${Release14pswd}
        Click Element    id:Login

# Trace logins
Login as Generalist Trace Agent
        Input Text   id:username   ${trace-generalist-username}
        Input Text   id:password   ${Release15pswd}
        Click Element    id:Login

Login as Specialist Trace Agent
        Input Text   id:username   ${trace-specialist-username}
        Input Text   id:password   ${generic-passwordNew}
        Click Element    id:Login

Login as Expert Trace Agent
        Input Text   id:username   ${trace-expert-username}
        Input Text   id:password   ${generic-passwordNew}
        Click Element    id:Login

Login as MQS IA Agent
        Input Text   id:username    ${ia-surge-team-username}
        Input Text   id:password    ${generic-passwordNew1}
        Click Element    id:Login

Login as dhqa Test Agent
        Input Text   id:username    ${dhqa-agent-username}
        Input Text   id:password    ${generic-passwordNew1}
        Click Element    id:Login
# E&C Central logins
Login as E&C Central Agent
        Input Text   id:username    ${efc-central-team-username}
        Input Text   id:password    ${Release16pswd}
        Click Element    id:Login


Login as RTS/LTS Advisor
       Input Text   id:username   ${RTSAdvisor_Username}
                   #       Input Text   id:password   ${RTSPassword}
                   #       Click Element    id:Login
                   #
                   #
                   ## IANTO Agent Login

Login as IANTO Agent
       Input Text   id:username   ${IANTO-agent_Username}
       Input Text   id:password   ${Password-1}
       Click Element    id:Login

Login as EFC Complaints Agent
       Input Text   id:username   ${efc-complaints-agent-username}
       Input Text   id:password   ${Password-1}
       Click Element    id:Login

# WebChat User Credentials

Login as WebChat Case Management User
        Input Text   id:username   ${webchat-view-username}
        Input Text   id:password   ${Release14pswd}
        Click Element    id:Login

Login as WebChat Quality Assurance User
        Input Text   id:username   ${webchat-qa-username}
        Input Text   id:password   ${Release14pswd}
        Click Element    id:Login

Login as WebChat expert team User
        Input Text   id:username   ${webchat-expert-team-username}
        Input Text   id:password   ${Release11pswd}
        Click Element    id:Login

Login as Quality Assurance Agent
        Input Text   id:username    ${QualityAssurance-username}
        Input Text   id:password    ${Release13pswd}
        Click Element    id:Login

Login as WebChat RIT agent User
        Input Text   id:username   ${webchat-rit-agent-username}
        Input Text   id:password   ${Release11pswd}
        Click Element    id:Login

Login as WebChat MP Complaints test and trace User
        Input Text   id:username   ${webchat-mp-compl-trace-username}
        Input Text   id:password   ${Release11pswd}
        Click Element    id:Login

Login as WebChat Content Manager User
        Input Text   id:username   ${webchat-content-manager-username}
        Input Text   id:password   ${Release11pswd}
        Click Element    id:Login

# PPAT logins
Login as PPAT Parliamentary rights team member
        Input Text   id:username   ${parliamentary-rights-team-member}
        Input Text   id:password   ${Release13pswd}
        Click Element    id:Login

Login as PPAT Public Complaints team member
        Input Text   id:username   ${public-complaints-team-member}
        Input Text   id:password   ${Release13pswd}
        Click Element    id:Login

Login as PPAT Public Complaints super user
        Input Text   id:username   ${public-complaints-super-user}
        Input Text   id:password   ${Release13pswd}
        Click Element    id:Login

Login as PPAT Information rights team member
        Input Text   id:username   ${information-rights-team-member}
        Input Text   id:password   ${Release13pswd}
        Click Element    id:Login

Login as PPAT Information rights super user
        Input Text   id:username   ${information-rights-super-user}
        Input Text   id:password   ${Release13pswd}
        Click Element    id:Login

Login as PPAT Public Enquiries team member
        Input Text   id:username   ${public-enq-team-member}
        Input Text   id:password   ${Release13pswd}
        Click Element    id:Login

Login as PPAT Enquiries Super User
        Input Text   id:username   ${public-enq-super-user}
        Input Text   id:password   ${Release13pswd}
        Click Element    id:Login