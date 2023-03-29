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
#    Reload Page

# Test logins
Login as Generalist Test Agent
        Input Text   id:username   ${test-generalist-username}
        Input Text   id:password   ${generic-password}
        Click Element    id:Login

Login as Specialist Test Agent
        Input Text   id:username   ${test-specialist-username}
        Input Text   id:password   ${generic-password}
        Click Element    id:Login

Login as Expert Test Agent
        Input Text   id:username   ${test-expert-username}
        Input Text   id:password   ${generic-password}
        Click Element    id:Login

Login as RIT Advisor
        Input Text   id:username   ${rit-username}
        Input Text   id:password   ${generic-password}
        Click Element    id:Login

# Trace logins
Login as Generalist Trace Agent
        Input Text   id:username   ${trace-generalist-username}
        Input Text   id:password   ${generic-password}
        Click Element    id:Login

Login as Specialist Trace Agent
        Input Text   id:username   ${trace-specialist-username}
        Input Text   id:password   ${generic-password}
        Click Element    id:Login

Login as Expert Trace Agent
        Input Text   id:username   ${trace-expert-username}
        Input Text   id:password   ${generic-password}
        Click Element    id:Login

Login as IA Surge Agent
        Input Text   id:username    ${ia-surge-team-username}
        Input Text   id:password    ${generic-password}
        Click Element    id:Login

# EFC Central logins
Login as E&C Central Agent
        Input Text   id:username    ${efc-central-team-username}
        Input Text   id:password    ${generic-password}
        Click Element    id:Login

#RTS/LTS login
Login as RTS/LTS Advisor
        Input Text   id:username   ${RTSAdvisor_Username}
        Input Text   id:password   ${generic-password}
        Click Element    id:Login


##
