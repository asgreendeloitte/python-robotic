*** Variables ***
${BROWSER}     chrome   #Default, set in console to override
#${Env}          UAT       #Default, set in console to override

${login-url}        https://nhs--itstest.lightning.force.com/lightning/page/home
${logout-url}       https://nhs--itstest.lightning.force.com/secur/logout.jsp
${home-url}         https://nhs--itstest.lightning.force.com/lightning/page/home

${cases-url}        https://nhs--itstest.lightning.force.com/lightning/o/Case/list?filterName=Recent




# Test logins
${test-dhqa-username}             spurini@deloitte.co.uk.itstest
${ec-dhqa-agent}                  efctier1.automation@test-and-trace.nhs.uk.dhqa
${test-specialist-username}       agent.testspecialist@nhs.uat



# Password shared by all users
${Release10pswd}                        tt-Enq-R10-2022


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
Login as dhqa Test Agent
        Input Text   id:username   ${test-dhqa-username}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as dhqa E&C Agent working a Test or Trace case
        Input Text   id:username   ${ec-dhqa-agent}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login