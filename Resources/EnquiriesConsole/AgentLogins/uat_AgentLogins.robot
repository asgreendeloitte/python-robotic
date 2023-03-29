*** Variables ***
${BROWSER}     chrome   #Default, set in console to override
#${Env}          UAT       #Default, set in console to override

${login-url}        https://nhs--uat.lightning.force.com/lightning/page/home
${logout-url}       https://nhs--uat.my.salesforce.com/secur/logout.jsp
${home-url}         https://nhs--uat.lightning.force.com/lightning/page/home
${flow-url}         https://nhs--uat.sandbox.lightning.force.com/builder_platform_interaction/flowBuilder.app?flowId=30125000000hSQDAA2

${cases-url}        https://nhs--uat.my.salesforce.com/lightning/o/Case/list?filterName=Recent
${knowledge-url}    https://nhs--uat.sandbox.lightning.force.com/lightning/o/Knowledge__kav/list?filterName=Recent
${reports-url}      https://nhs--uat.lightning.force.com/lightning/o/Report/home?queryScope=userFolders
${Ianto-cc-reports-url}   https://nhs--uat.lightning.force.com/lightning/r/Report/00O4K000003pS1iUAE/view
#https://nhs--uat.lightning.force.com/lightning/r/Report/00O2z000000fyKIEAY/view
${Testproviders-url}        https://nhs--uat.lightning.force.com/lightning/o/Test_Provider__c/list?filterName=00B2z000001DJiGEAW
${liveissure-url}    https://nhs--uat.sandbox.lightning.force.com/lightning/o/ECDLiveIssue__c/list?filterName=00B25000004gWMlEAM

${data-import-wizard-url}   https://nhs--mktcloudpo.lightning.force.com/lightning/setup/DataManagementDataImporter/home
${accounts-url}     https://nhs--uat.sandbox.lightning.force.com/lightning/o/Account/list?filterName=Recent
${campaigns-url}    https://nhs--uat.sandbox.lightning.force.com/lightning/o/Campaign/list?filterName=Recent
${comms_log_tab-url}    https://nhs--uat.sandbox.lightning.force.com/lightning/o/DEP_Campaign_Member_Comms_Log__c/list?filterName=Recent
${comm-s_log_items_log-url}    https://nhs--mktcloudpo.sandbox.lightning.force.com/lightning/o/DEP_Campaign_Member_Comms_Log_Item__c/list?filterName=Recent

# Test logins
${test-generalist-username}             agent.testgeneralist2@nhs.uat
${test-specialist-username}             agent.testspecialist@nhs.uat
${test-expert-username}                 george.testexpert@nhs.uat
${rit-username}                         agent-rit@uk.ibm.com.nhs.uat
${rit-teamlead-username}                hasen.ritteamleader@nhs.uat
${tier1-team-username}                  hasen-tier1test&trace@nhs.uat
${tier1-username}                       hasen.tier1test@nhs.uat
${tier2-team-username}                  hasen.tier2testtrace@nhs.uat
${TeamLeader-username}                  hasen.teamleader@nhs.uat
${ElectiveCareTeam-username}            hasen.electivecareteam@nhs.uat
${ContactCentreManager-username}        hasen.contactcentremanager@nhs.uat
${QualityAssurance-username}            hasen.qualityassurance@nhs.uat
${InboundExpertAgent}                   hasen.inboundexpertagent@nhs.uat
${InboundExpertTeamLead}                hasen.inboundexpertteamlead@nhs.uat

# PPAT Logins
${uat-public-enq-team-member}           spurini@deloitte.co.uk.uat.enq
${uat-public-complaints-team-member}    spurini@deloitte.co.uk.complaints.uat
${uat-info-rights-team-member}          spurini@deloitte.co.uk.uat.info
${uat-parly-team-member}                spurini@deloitte.co.uk.uat.parly
${uat-ppat-enq-super-user}              spurini@deloitte.co.uk.superuser.uat.enq
${information-rights-super-user}        automation.info.rights.superuser@deloitte.co.uk.uat
${ppat-reporting-agent}       spurini@deloitte.co.uk.ppat.uat.reporting.user

# Trace logins
${trace-generalist-username}            agent.tracegeneralist@nhs.uat
${trace-specialist-username}            agent.tracespecialist2@nhs.uat
${head-of-enqcomdis-username}           sameera.purini@test-and-trace.nhs.uk.hoe
${mp-test-trace-username}               sameera.purini@test-and-trace.nhs.uk.mp
${trace-expert-username}                hasen.traceexpert@nhs.uat
${test-supervisor-username}             test-supervisor-ia@nhs.uat
${ia-surge-team-username}               hasen.iatrace@nhsuat.com
${MP-Trace-team-leader-username}        hasen.mptraceteamleader@nhs.uat
${MP-Trace-team-agent-username}         hasen.mptraceagent@nhs.uat
${MQS-Teamlead-username}                hasen.mqsteamlead@nhs.uat
${efc-complaints-agent-username}        automation.efc.complaints.agent@deloitte.co.uk.uat

# E&C Central Login
${efc-central-team-username}            hasen@centralteam.uat

#IANTO Agent Login
${IANTO-agent_Username}              iantotest@nhs.uat
${IANTO-Teamlead_Username}           iantoteamlead@nhs.uat

#PTM Agents
${ptm-agent-username}               hasen.ptmadvisor@nhs.uat

#Webchat Logins
${Webchat-agent_Username}              automation.webchat.agent@deloitte.co.uk.uat
${webchat-qa-username}                 automation.qa@deloitte.co.uk.uat
${webchat-expert-team-username}        automation.expert.team.agent@deloitte.co.uk.uat
${webchat-rit-agent-username}          auto.rit.advisor@deloitte.co.uk.uat
${webchat-mp-compl-trace-username}     automation.complaints.my.trace.agent@deloitte.co.uk.uat
${webchat-content-manager-username}    automation.content.manager@deloitte.co.uk.uat

#HPEP Login
${test-username}         pmorenogarrido@deloitte.es.uat
${campaign-manager}         pablo.campaing.manager@test-and-trace.nhs.uk.dep.uat


# Password shared by all users
${generic-password}                     tt-Enq-R3-2021
${Release9pswd}                         tt-Enq-R9-2021
${cookies-password}                     Cookies1!
${cookies-passwordS}                    Cookies2!
${uat-passwordG}                        Uattest12345!
${uat-password-2}                       Uattest1234!
${uat-password-spec}                    Uattest12346!
${uat-password-new}                     Pyramid123!
${uat-password-r10}                     tt-Enq-R10-2021
${uat-password-r9}                      tt-Enq-R10-2021 R3
${PPATuserpwd}                          tt-Enq-R10-2022
${PPATuserpwd-r13}                      tt-Enq-R13-2022
${Release16pswd}                        tt-Enq-R15-2023


#RTSLTS Users
${RTSAdvisor_Username}                  hasen.rtslts@nhs.uat


${RTSPassword}                          Uattest12345!
${uat-passwordG}                        Uattest12345!
${Release9pswd}                         tt-Enq-R9-2021
${Release11pswd}                        tt-Enq-R11-2021
${Release13pswd}                        tt-Enq-R13-2021
${Release10pwd}                         tt-Enq-R12-2021
${Release14pswd}                        tt-Enq-R14-2021
${Release15pswd}                        tt-Enq-R15-2021
${Release18pswd}                        tt-Enq-R23-2021
${Release19pswd}                        tt-Enq-R24-2023
${Release25pswd}                        tt-Enq-R25-2023

# HPEP passwords
${hpep-password}         10Piik89T&T#1
${hpep-password2}         10Piik89T&T1

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
Go to flow HPEP Desynchronise from MC
    Go to   ${flow-url}

Logout of Salesforce
    Go To   ${logout-url}

Go To Cases Tab
    Go To   ${cases-url}
#    Reload Page

Go To Reports Tab
    Go To   ${reports-url}
#    Reload Page

Go To Ianto-cc Reports Tab
       Go To   ${Ianto-cc-reports-url}

Go To Knowledge Tab
    Go To   ${knowledge-url}
#    Reload Page

Go To Home Tab
    Go To   ${home-url}

Go To Testproviders Tab
    Go To   ${Testproviders-url}

Go To Liveissues Tab
    Go To   ${liveissure-url}


Go To Salesforce Data Import Wizard url
    Go To   ${data-import-wizard-url}

Go To Accounts Tab
    Go To   ${accounts-url}

Go to Campaigns Tab
    Go To   ${campaigns-url}

Go to DEP Campaign Member Comms Logs Tab
    Go To   ${comms_log_tab-url}

Go to DEP Campaign Member Comms Log Items Tab
    Go To   ${comm-s_log_items_log-url}

# Test logins
Login as Generalist Test Agent
        Input Text   id:username   ${test-generalist-username}
        Input Text   id:password   ${Release15pswd}
        Click Element    id:Login

Login as Specialist Test Agent
        Input Text   id:username   ${test-specialist-username}
        Input Text   id:password   ${Release14pswd}
        Click Element    id:Login

Login as Expert Test Agent
        Input Text   id:username   ${test-expert-username}
        Input Text   id:password   ${Release14pswd}
        Click Element    id:Login

Login as test supervisor Agent
        Input Text   id:username   ${test-supervisor-username}
        Input Text   id:password   ${Release11pswd}
        Click Element    id:Login

Login as RIT Advisor
        Input Text   id:username   ${rit-username}
        Input Text   id:password   ${Release14pswd}
        Click Element    id:Login

Login as RIT Team lead
        Input Text   id:username   ${rit-teamlead-username}
        Input Text   id:password   ${Release14pswd}
        Click Element    id:Login

#PTM logins

Login as PTM Advisor
        Input Text   id:username   ${ptm-agent-username}
        Input Text   id:password   ${Release14pswd}
        Click Element    id:Login


# Trace logins
Login as Generalist Trace Agent
        Input Text   id:username   ${trace-generalist-username}
        Input Text   id:password   ${Release19pswd}
        Click Element    id:Login

Login as Specialist Trace Agent
        Input Text   id:username   ${trace-specialist-username}
        Input Text   id:password  ${Release14pswd}
        Click Element    id:Login


Login as MP Trace Lead Agent
        Input Text   id:username   ${MP-Trace-team-leader-username}
        Input Text   id:password   ${Release25pswd}
        Click Element    id:Login

Login as MP Trace team agent
       Input Text   id:username   ${MP-Trace-team-agent-username}
       Input Text   id:password   ${Release25pswd}
       Click Element    id:Login

Login as Head of Enquiries Complaints and Disputes
        Input Text   id:username   ${head-of-enqcomdis-username}
        Input Text   id:password  ${Release14pswd}
        Click Element    id:Login

Login as Expert Trace Agent
        Input Text   id:username   ${trace-expert-username}
        Input Text   id:password   ${Release14pswd}
        Click Element    id:Login

Login as MQS IA Agent
        Input Text   id:username    ${ia-surge-team-username}
        Input Text   id:password    ${Release14pswd}
        Click Element    id:Login

Login as MQS IA Teamlead Agent
        Input Text   id:username    ${MQS-Teamlead-username}
        Input Text   id:password    ${Release14pswd}
        Click Element    id:Login
# EFC Central logins
Login as E&C Central Agent
        Input Text   id:username    ${efc-central-team-username}
        Input Text   id:password    ${hpep-password}
        Click Element    id:Login

#RTS/LTS login
Login as RTS/LTS Advisor
        Input Text       id:username   ${RTSAdvisor_Username}
        Input Text       id:password   ${Release14pswd}
        Click Element    id:Login


##Tier1/2 Test and Trace Logins
Login as Tier 1 Test & Trace Agent
        Input Text   id:username    ${tier1-team-username}
        Input Text   id:password    ${Release14pswd}
        Click Element    id:Login

Login as Tier 2 Test & Trace Agent
        Input Text   id:username    ${tier2-team-username}
        Input Text   id:password    ${Release14pswd}
        Click Element    id:Login

Login as Tier 1 Test Agent
        Input Text   id:username    ${tier1-username}
        Input Text   id:password    ${Release11pswd}
        Click Element    id:Login

Login as Team Leader Agent
        Input Text   id:username    ${TeamLeader-username}
        Input Text   id:password    ${Release14pswd}
        Click Element    id:Login

Login as Elective Care Team Agent
        Input Text   id:username    ${ElectiveCareTeam-username}
        Input Text   id:password    ${Release11pswd}
        Click Element    id:Login

Login as Contact Centre Manager Agent
        Input Text   id:username    ${ContactCentreManager-username}
        Input Text   id:password    ${Release14pswd}
        Click Element    id:Login

Login as Quality Assurance Agent
        Input Text   id:username    ${QualityAssurance-username}
        Input Text   id:password    ${Release14pswd}
        Click Element    id:Login

Login as MP Trace Agent
        Input Text   id:username   ${MPTraceAgent-username}
        Input Text   id:password   ${Release11pswd}
        Click Element    id:Login

Login as EFC Complaints Agent
        Input Text   id:username   ${efc-complaints-agent-username}
        Input Text   id:password   ${Release11pswd}
        Click Element    id:Login

# IANTO Agent Login

Login as IANTO Agent
       Input Text   id:username   ${IANTO-agent_Username}
       Input Text   id:password   ${Release11pswd}
       Click Element    id:Login

Login as IANTO Team Lead
       Input Text   id:username   ${IANTO-Teamlead_Username}
       Input Text   id:password   ${Release11pswd}
       Click Element    id:Login

Login as MP Test Trace agent
       Input Text   id:username   ${mp-test-trace-username}
       Input Text   id:password   ${Release14pswd}
       Click Element    id:Login

Login as Inbound Expert Agent
       Input Text   id:username   ${InboundExpertAgent}
       Input Text   id:password   ${Release15pswd}
       Click Element    id:Login

Login as Inbound Expert Team Lead
       Input Text   id:username   ${InboundExpertTeamLead}
       Input Text   id:password   ${Release14pswd}
       Click Element    id:Login


#DHO Agent logins

Login as dhqa Test Agent
        Input Text   id:username   ${efc-central-team-username}
        Input Text   id:password   ${hpep-password}
        Click Element    id:Login

Login as dhqa E&C Agent working a Test or Trace case
        Input Text   id:username   ${efc-central-team-username}
        Input Text   id:password   ${hpep-password}
        Click Element    id:Login

# PPAT User logins
Login as PPAT Public Enquiries team member
        Input Text   id:username   ${uat-public-enq-team-member}
        Input Text   id:password   ${Release15pswd}
        Click Element    id:Login

Login as PPAT Public Complaints team member
        Input Text   id:username  ${uat-public-complaints-team-member}
        Input Text   id:password   ${Release15pswd}
        Click Element    id:Login

Login as PPAT Information rights team member
        Input Text   id:username   ${uat-info-rights-team-member}
        Input Text   id:password   ${Release14pswd}
        Click Element    id:Login

Login as PPAT Parliamentary rights team member
        Input Text   id:username   ${uat-parly-team-member}
        Input Text   id:password   ${Release14pswd}
        Click Element    id:Login

Login as PPAT Enquiries Super User
        Input Text   id:username   ${uat-ppat-enq-super-user}
        Input Text   id:password   ${Release15pswd}
        Click Element    id:Login

Login as PPAT Reporting Team Agent
        Input Text   id:username   ${ppat-reporting-agent}
        Input Text   id:password   ${Release15pswd}
        Click Element    id:Login

Login as PPAT Information rights super user
        Input Text   id:username   ${information-rights-super-user}
        Input Text   id:password   ${Release15pswd}
        Click Element    id:Login

# Webchat User logins
Login as WebChat Case Management User
        Input Text   id:username   ${Webchat-LoginasMPTraceteamagentagent_Username}
        Input Text   id:password   ${PPATuserpwd}
        Click Element    id:Login

Login as WebChat Quality Assurance User
        Input Text   id:username   ${webchat-qa-username}
        Input Text   id:password   ${PPATuserpwd}
        Click Element    id:Login

Login as WebChat expert team User
        Input Text   id:username   ${webchat-expert-team-username}
        Input Text   id:password   ${PPATuserpwd}
        Click Element    id:Login

Login as WebChat RIT agent User
        Input Text   id:username   ${webchat-rit-agent-username}
        Input Text   id:password   ${PPATuserpwd}
        Click Element    id:Login

Login as WebChat MP Complaints test and trace User
        Input Text   id:username   ${webchat-mp-compl-trace-username}
        Input Text   id:password   ${PPATuserpwd}
        Click Element    id:Login

Login as WebChat Content Manager User
        Input Text   id:username   ${webchat-content-manager-username}
        Input Text   id:password   ${Release16pswd}
        Click Element    id:Login

Login as Admin Agent
        Input Text   id:username   ${test-username}
        Input Text   id:password   ${hpep-password}
        Click Element    id:Login

Login as Campaign Manager
        Input Text   id:username   ${campaign-manager}
        Input Text   id:password   ${hpep-password2}
        Click Element    id:Login
