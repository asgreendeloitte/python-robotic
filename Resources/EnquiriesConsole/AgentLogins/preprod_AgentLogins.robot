*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
*** Variables ***
${BROWSER}   chrome   #Default, set in console to override
#${Env}          preprod    #Default, set in console to override
${login-url}        https://nhs--preprod.lightning.force.com/lightning/page/home
${logout-url}       https://nhs--preprod.my.salesforce.com/secur/logout.jsp
${home-url}         https://nhs--preprod.lightning.force.com/lightning/page/home
${cases-url}        https://nhs--preprod.my.salesforce.com/lightning/o/Case/list?filterName=Recent

${data-import-wizard-url}   https://nhs--mktcloudpo.lightning.force.com/lightning/setup/DataManagementDataImporter/home
${setup-url}        https://nhs--preprod.sandbox.lightning.force.com/lightning/setup/SetupOneHome/home
${accounts-url}     https://nhs--preprod.sandbox.lightning.force.com/lightning/o/Account/list?filterName=Recent
${campaigns-url}    https://nhs--preprod.sandbox.lightning.force.com/lightning/o/Campaign/list?filterName=Recent
${reports-url}    https://nhs--preprod.sandbox.lightning.force.com/lightning/o/Report/home?queryScope=mru
${comms_log_tab-url}    https://nhs--preprod.sandbox.lightning.force.com/lightning/o/DEP_Campaign_Member_Comms_Log__c/list?filterName=Recent
${comm-s_log_items_log-url}    https://nhs--preprod.sandbox.lightning.force.com/lightning/o/DEP_Campaign_Member_Comms_Log_Item__c/list?filterName=Recent


# Test logins
${test-generalist-username}         agent.testgeneralist11@nhs.preprod
${test-specialist-username}         test.specialist@nhs.preprod
${test-expert-username}             test.expert@nhs.preprod
${rit-username}                     rituseragent1@ibm.com.nhs.preprod
# Trace logins
${trace-generalist-username}        trace.generalist@nhs.preprod
${trace-specialist-username}        trace.specialist@nhs.preprod
${trace-expert-username}            trace.expert@nhs.preprod
${ia-surge-team-username}           george.internationarrivals@nhs.preprod
# DHO Salesforce logins
${dho-preprod-agent-username}       automation.tier.1.test.and.trace@deloitte.co.uk.preprod
${dho-preprod-agent-password}       tt-Enq-R10-2023
${dho-preprod-agent-password-2}     tt-Enq-R13-2023
# EFC Central Login
${efc-central-team-username}        geethacenttralteam@uk.ibm.com.preprod

# PPAT Logins
${prep-public-enq-team-member}           automation.pe.agent@deloitte.co.uk.prep
${prep-public-complaints-team-member}    automation.public.complaints.agent@deloitte.co.uk.prep
${prep-info-rights-team-member}          automation.information.rights.agent@deloitte.co.uk.prep
${prep-parly-team-member}                automation.parly.agent@deloitte.co.uk.prep
${prep-ppat-enq-super-user}              automation.pe.superuser@deloitte.co.uk.prep


${prep-ppat-parly-super-user}            automation.parly.superuser@deloitte.co.uk.prep
${prep-info-rights-super-user}           automation.information.rights.superuser@deloitte.co.uk.prep
${prep-reporting-agent}                  automation.reporting.team@deloitte.co.uk.prep

#HPEP Login
${test-username}         pablo.garrido@test-and-trace.nhs.uk.admin.preprod
${campaign-manager}         pablo.campaing.manager@test-and-trace.nhs.uk.dep.preprod


# Password shared by all users
${generic-password}                  CompTest@12345
${E&CUserName}                      geethacenttralteam@uk.ibm.com.preprod
${e&CPassword}                      UATtest123!
${generic-password-2}               tt-Enq-R3-2021
${cookies-password}                 Cookies1!2
${cookies-password2}                 Cookies1!3
${cookies-password1}                 Cookies1!
${cookies-password3}                 Pyramid123!
${cookies-password4}                 sweetu88$
${generic-password-3}                tt-Enq-R11-2021
${generic-password-4}                tt-Enq-R13-2021
${generic-password-5}                tt-Enq-R13-2022
${generic-password-6}                tt-Enq-R14-2023
${generic-password-7}                tt-Enq-R15-2023

#HPEP password
${hpep-password}         10Piik89T&T
${hpep-password2}         10Piik89T&T1

#RTSLTS Users
${RTSAdvisor_Username}              lts-rts@ibm.com.nhs.preprod
${RTSPassword}                          Preprod1234!
*** Keywords ***
Open Browser and Go To Salesforce Login
    ${options}=     Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method     ${options}    add_argument       --no-sandbox
    Call Method     ${options}    add_argument      --headless
    Call Method     ${options}    add_argument      --disable-notifications
    Call Method     ${options}    add_argument      --start-maximized
    Call Method     ${options}    add_argument      --disable-gpu
    Call Method     ${options}    add_argument      --disable-dev-shm-usage
    Open Browser   ${login-url}      ${BROWSER}   options=${options}
Go To Salesforce login
    Go To   ${login-url}
Logout of Salesforce
    Go To   ${logout-url}
Go To Cases Tab
    Go To   ${cases-url}

Go To Accounts Tab
    Go To   ${accounts-url}

Go to Campaigns Tab
    Go To   ${campaigns-url}

Go to Reports Tab
    Go To   ${reports-url}

Go to DEP Campaign Member Comms Logs Tab
    Go To   ${comms_log_tab-url}

Go to DEP Campaign Member Comms Log Items Tab
    Go To   ${comm-s_log_items_log-url}

# Test logins
Login as Generalist Test Agent
        Input Text   id:username   ${test-generalist-username}
        Input Text   id:password   ${hpep-password2}
        Click Element    id:Login
Login as Specialist Test Agent
        Input Text   id:username   ${test-specialist-username}
        Input Text   id:password   ${hpep-password}
        Click Element    id:Login
Login as Expert Test Agent
        Input Text   id:username   ${test-expert-username}
        Input Text   id:password   ${generic-password-3
        Click Element    id:Login
# Trace logins
Login as Generalist Trace Agent
        Input Text   id:username   ${trace-generalist-username}
        Input Text   id:password   ${hpep-password2}
        Click Element    id:Login
Login as Specialist Trace Agent
        Input Text   id:username   ${trace-specialist-username}
        Input Text   id:password   ${generic-password-4}
        Click Element    id:Login
Login as Expert Trace Agent
        Input Text   id:username   ${trace-expert-username}
        Input Text   id:password   ${generic-password-3}
        Click Element    id:Login
Login as MQS IA Agent
        Input Text   id:username    ${ia-surge-team-username}
        Input Text   id:password    ${generic-password-3}
        Click Element    id:Login
# EFC Central logins
Login as E&C Central Agent
        Input Text   id:username    ${efc-central-team-username}
        Input Text   id:password    ${generic-password-6}
        Click Element    id:Login
# #To do
#RTS/LTS login
Login as RTS/LTS Advisor
        Input Text   id:username   ${RTSAdvisor_Username}
        Input Text   id:password   ${generic-password-3}
        Click Element    id:Login
#RIT login
Login as RIT Advisor
        Input Text   id:username   ${rit-username}
        Input Text   id:password   ${generic-password-6}
        Click Element    id:Login

Login as generalist agent to check DHO inputs
        Input Text   id:username   ${dho-preprod-agent-username}
        Input Text   id:password   ${dho-preprod-agent-password-2}
        Click Element    id:Login

# PPAT User logins
Login as PPAT Public Enquiries team member
        Input Text   id:username   ${prep-public-enq-team-member}
        Input Text   id:password   ${hpep-password2}
        Click Element    id:Login

Login as PPAT Public Complaints team member
        Input Text   id:username  ${prep-public-complaints-team-member}
        Input Text   id:password   ${hpep-password2}
        Click Element    id:Login

Login as PPAT Information rights team member
        Input Text   id:username   ${prep-info-rights-team-member}
        Input Text   id:password   ${hpep-password2}
        Click Element    id:Login

Login as PPAT Parliamentary rights team member
        Input Text   id:username   ${prep-parly-team-member}
        Input Text   id:password   ${hpep-password2}
        Click Element    id:Login

Login as PPAT Enquiries Super User
        Input Text   id:username   ${prep-ppat-enq-super-user}
        Input Text   id:password   ${hpep-password2}
        Click Element    id:Login

Login as PPAT Reporting Team Agent
        Input Text   id:username   ${prep-reporting-agent}
        Input Text   id:password   ${RTSPassword}
        Click Element    id:Login

Login as Admin Agent
        Input Text   id:username   ${test-username}
        Input Text   id:password   ${hpep-password}
        Click Element    id:Login

Login as Campaign Manager
        Input Text   id:username   ${campaign-manager}
        Input Text   id:password   ${hpep-password2}
        Click Element    id:Login

Login as PPAT Information rights super user
        Input Text   id:username   ${prep-info-rights-super-user}
        Input Text   id:password   ${hpep-password2}
        Click Element    id:Login