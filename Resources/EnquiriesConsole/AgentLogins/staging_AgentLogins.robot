*** Settings ***
Library  Collections
Library  CSVLibrary

*** Variables ***
${BROWSER}     chrome   #Default, set in console to override
#${Env}          comptest       #Default, set in console to override

${login-url}        https://nhs--staging.lightning.force.com/lightning/page/home
${logout-url}       https://nhs--staging.my.salesforce.com/secur/logout.jsp
${home-url}         https://nhs--staging.lightning.force.com/lightning/page/home


# Test logins
${ibm-enq-username}         Enquiry.Agent2202@ibm.com.nhs.staging

# Password shared by all users
${stg-old-pwd}                     Login#123
${stg-new-pwd}                     Login#1234
${answer}                          London
${index}                           0


*** Keywords ***
Open Browser and Go To Salesforce Login
    ${options}=     Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method     ${options}    add_argument    --disable-notifications
    Call Method     ${options}    add_argument      --start-maximized
#
    Call Method     ${options}    add_argument      --no-sandbox
    Call Method     ${options}    add_argument     --disable-notifications
   # Call Method     ${options}    add_argument      --headless
    Call Method     ${options}    add_argument      --start-maximized
    Call Method     ${options}    add_argument      --disable-gpu
    Call Method     ${options}    add_argument      --window-size\=1920,1080
    Call Method     ${options}    add_argument      --disable-dev-shm-usage
    Open Browser   ${login-url}     ${BROWSER}   options=${options}

Go To Salesforce login
    Go To   ${login-url}

Logout of Staging Salesforce
    Go To   ${logout-url}

# Test logins
Login as complaints test staging user
        @{list}=  read csv file to list  Resources/DigitalHelper/Utilities/test.csv
        FOR  ${index}  IN RANGE  299
            Log  ${list[${index}][0]}
            Input Text   id:username   ${list[${index}][0]}
            Input Text   id:password   ${stg-old-pwd}
            Click Element    id:Login

            Input Text   id:newpassword   ${stg-new-pwd}
            Input Text   id:confirmpassword   ${stg-new-pwd}
            Input Text    id:answer   ${answer}
            Click Element    id:password-button
            Go To   ${logout-url}
        END

I do not want to register my phone
        @{list}=  read csv file to list  Resources/EnquiriesConsole/AgentLogins/test.csv
        FOR  ${index}  IN RANGE  298
            Log  ${list[${index}][0]}
            Input Text   id:username   ${list[${index}][0]}
            Input Text   id:password   ${stg-new-pwd}
            Click Element    id:Login

            Click Element    //p[@class="small"]//a[text()="I Don't Want to Register My Phone"]
            Go To   ${logout-url}
        END

