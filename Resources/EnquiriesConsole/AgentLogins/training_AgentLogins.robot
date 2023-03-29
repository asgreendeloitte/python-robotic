*** Variables ***
${BROWSER}     chrome   #Default, set in console to override
#${Env}          UAT       #Default, set in console to override

${login-url}        https://nhs--training.lightning.force.com/lightning/page/home
${logout-url}       https://nhs--training.my.salesforce.com/secur/logout.jsp
${home-url}         https://nhs--training.lightning.force.com/lightning/page/home

${cases-url}        https://nhs--training.my.salesforce.com/lightning/o/Case/list?filterName=Recent

# Test logins
${test-generalist-username}         agent.testgeneralist2@nhs.training
${test-specialist-username}         agent.testspecialist@nhs.training
${test-expert-username}             agent.testexpert@nhs.training
${rit-username}                     ritadvisor@nhs.training

# Trace logins
${trace-generalist-username}        agent.tracegeneralist@nhs.training
${trace-specialist-username}        agent.tracespecialist1@nhs.training
${trace-expert-username}            agent.traceexpert@nhs.training
${ia-surge-team-username}           agent.iasurgeteam@nhs.training

# E&C Central Login
${efc-central-team-username}        george.centralteam@nhs.training

# Password shared by all users
${generic-password}                 tt-Enq-R3-2021
${cookies-password}                 Cookies1!
${cookies-passwordS}                 Cookies2!
${uat-passwordG}                     Uattest12345!
${uat-password-2}                     Uattest1234!


#RTSLTS Users
${RTSAdvisor_Username}              manju.rtslts@.nhs.training
${RTSPassword}                          Uattest12345!
${training-passwordG}                     tt-Enq-R9-2021

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
        Input Text   id:password   ${training-passwordG}
        Click Element    id:Login

Login as Specialist Test Agent
        Input Text   id:username   ${test-specialist-username}
        Input Text   id:password   ${training-passwordG}
        Click Element    id:Login

Login as Expert Test Agent
        Input Text   id:username   ${test-expert-username}
        Input Text   id:password   ${training-passwordG}
        Click Element    id:Login

Login as RIT Advisor
        Input Text   id:username   ${rit-username}
        Input Text   id:password   ${training-passwordG}
        Click Element    id:Login

# Trace logins
Login as Generalist Trace Agent
        Input Text   id:username   ${trace-generalist-username}
        Input Text   id:password   ${training-passwordG}
        Click Element    id:Login

Login as Specialist Trace Agent
        Input Text   id:username   ${trace-specialist-username}
        Input Text   id:password   ${training-passwordG}
        Click Element    id:Login

Login as Expert Trace Agent
        Input Text   id:username   ${trace-expert-username}
        Input Text   id:password   ${training-passwordG}
        Click Element    id:Login

Login as MQS IA Agent
        Input Text   id:username    ${ia-surge-team-username}
        Input Text   id:password    ${training-passwordG}
        Click Element    id:Login

# EFC Central logins
Login as E&C Central Agent
        Input Text   id:username    ${efc-central-team-username}
        Input Text   id:password    ${training-passwordG}
        Click Element    id:Login

#RTS/LTS login
Login as RTS/LTS Advisor
        Input Text       id:username   ${RTSAdvisor_Username}
        Input Text       id:password   ${training-passwordG}
        Click Element    id:Login


##
