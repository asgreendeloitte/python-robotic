*** Variables ***
${BROWSER}     chrome   #Default, set in console to override

${login-url}        https://nhs--ppatqa.my.salesforce.com/lightning/page/home
${logout-url}       https://nhs--ppatqa.my.salesforce.com/secur/logout.jsp
${home-url}         https://nhs--ppatqa.my.salesforce.com/lightning/page/home
${cases-url}        https://nhs--ppatqa.my.salesforce.com/lightning/o/Case/list?filterName=Recent




# Test logins
${test-ppatqa-username}                              sameera.purini@test-and-trace.nhs.uk.ppatqa
${ppat-public-enq-agent-username}                    sameera.public.enquiries.agent@deloitte.co.uk.ppatqa
${ppat-public-Complaints-agent-username}             sameera.public.complaints.agent@deloitte.co.uk.ppatqa
${ppat-info-right-agent-username}                    sameera.information.rights.agent@deloitte.co.uk.ppatqa
${ppat-parliamentary-agent-username}                 sameera.parliamentary.reviewer@deloitte.co.uk.ppatqa
${ppat-standard-agent}                               ppatagent2@deloitte.co.uk.ppat
${ppat-superuser-agent}                              superuseragent@deloitte.co.uk.ppatqa
${ppat-reporting-agent}                               spurini@deloitte.co.uk.ppat.qa.reporting
${ppat-complaint-superuser}                          automation.complaints.superuser@deloitte.co.uk
${ppat-info-right-superuser}                         automation.information.rights.superuser@deloitte.co.uk.ppatqa


# Password shared by all users
${Release10pswd}                        tt-Enq-R10-2022
${Release11pswd}                        tt-Enq-R11-2021

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


# Test logins
Login as PPAT QA Test Agent
        Input Text   id:username   ${test-ppatqa-username}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as PPAT Public Enquiries team member
        Input Text   id:username   ${ppat-public-enq-agent-username}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as PPAT Public Complaints team member
        Input Text   id:username  ${ppat-public-Complaints-agent-username}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as PPAT Information rights team member
        Input Text   id:username   ${ppat-info-right-agent-username}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as PPAT Parliamentary rights team member
        Input Text   id:username   ${ppat-parliamentary-agent-username}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as PPAT Parliamentary Standard Agent
        Input Text   id:username   ${ppat-standard-agent}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as PPAT Enquiries Super User
        Input Text   id:username   ${ppat-superuser-agent}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as PPAT Reporting Team Agent
        Input Text   id:username   ${ppat-reporting-agent}
        Input Text   id:password   ${Release10pswd}
        Click Element    id:Login

Login as PPAT Complaints Super Agent
        Input Text   id:username   ${ppat-complaint-superuser}
        Input Text   id:password   ${Release11pswd}
        Click Element    id:Login

Login as PPAT Information Rights Super Agent
        Input Text   id:username   ${ppat-info-right-superuser}
        Input Text   id:password   ${Release11pswd}
        Click Element    id:Login