*** Variables ***
${BROWSER}    chrome   #Default, set in console to override

${login-url}        https://nhs--mktcloudpo.lightning.force.com/lightning
${setup-url}        https://nhs--mktcloudpo.lightning.force.com/lightning/setup/SetupOneHome/home
${data-import-wizard-url}   https://nhs--mktcloudpo.lightning.force.com/lightning/setup/DataManagementDataImporter/home

${cases-url}        https://nhs--codedeploy.my.salesforce.com/lightning/o/Case/list?filterName=Recent
${accounts-url}     https://nhs--mktcloudpo.sandbox.lightning.force.com/lightning/o/Account/list?filterName=Recent
${campaigns-url}    https://nhs--mktcloudpo.sandbox.lightning.force.com/lightning/o/Campaign/list?filterName=Recent
${reports-url}    https://nhs--mktcloudpo.sandbox.lightning.force.com/lightning/o/Report/home?queryScope=userFolders
${comms_log_tab-url}    https://nhs--mktcloudpo.sandbox.lightning.force.com/lightning/o/DEP_Campaign_Member_Comms_Log__c/list?filterName=Recent
${comm-s_log_items_log-url}    https://nhs--mktcloudpo.sandbox.lightning.force.com/lightning/o/DEP_Campaign_Member_Comms_Log_Item__c/list?filterName=Recent


${logout-url}       https://nhs--mktcloudpo.lightning.force.com//secur/logout.jsp
# Test logins

${test-username}         pmorenogarrido@deloitte.es.depdev
${campaign-manager}         pablo.campaing.manager@test-and-trace.nhs.uk.dep.dev

# Password shared by all users
${password}         T&T10Piik89#22
${password2}         10Piik89T&T


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

Go To Salesforce Data Import Wizard url
    Go To   ${data-import-wizard-url}

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

Login as Admin Agent
        Input Text   id:username   ${test-username}
        Input Text   id:password   ${password}
        Click Element    id:Login

Login as Campaign Manager
        Input Text   id:username   ${campaign-manager}
        Input Text   id:password   ${password2}
        Click Element    id:Login