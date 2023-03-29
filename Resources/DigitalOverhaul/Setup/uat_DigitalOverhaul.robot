*** Variables ***
${BROWSER}      chrome   #Default, set in console to override

${digital-overhaul-url}              https://uat-dho.cs80.force.com/

${digital-verhaul-analtyics-btn}          //button[@id='nhsuk-cookie-banner__link_accept_analytics']

${accept-nhs-cookies-btn}            //button[@id='nhsuk-cookie-banner__link_accept_analytics']

${digital-overhaul-covid19-testing}   https://nhs--uat.sandbox.my.salesforce-sites.com/covid-19-testing

${digital-overhaul-accessibility-statement}         https://nhs--uat.sandbox.my.salesforce-sites.com/accessibility-statement

${digital-overhaul-all-topics}        https://nhs--uat.sandbox.my.salesforce-sites.com/topics

${digital-overhaul-travelling-abroad-during-covid}   https://nhs--uat.sandbox.my.salesforce-sites.com/international-travel/travelling-abroad

${digital-overhaul-close-contacts}        https://nhs--uat.sandbox.my.salesforce-sites.com/close-contacts

*** Keywords ***
Open Browser, Go To Digital Overhaul and Accept Cookies
    # starts the browser maximised
    ${options}=     Evaluate  sys.modules['selenium.webdriver.${BROWSER}.options'].Options()    sys
    Call Method     ${options}    add_argument    --disable-notifications
    Call Method     ${options}    add_argument    --incognito
    Call Method     ${options}    add_argument      --start-maximized
    Call Method     ${options}    add_argument      --no-sandbox
    Call Method     ${options}    add_argument     --disable-notifications
    Call Method     ${options}    add_argument      --headless
    Call Method     ${options}    add_argument      --start-maximized
    Call Method     ${options}    add_argument      --disable-gpu
    Call Method     ${options}    add_argument      --window-size\=1920,1080
    Call Method     ${options}    add_argument      --disable-dev-shm-usage

    Open Browser   ${digital-overhaul-url}     ${BROWSER}   options=${options}
   #  Click Element   ${digital-verhaul-analtyics-btn}
   #  Click Element   ${accept-nhs-cookies-btn}


Go To Digital Overhaul
    Go To   ${digital-overhaul-url}

Go to Digital Overhaul Covid-19 Testing
    Go To   ${digital-overhaul-covid19-testing}

Go to Digital Overhaul Accessibility Statement
    Go To   ${digital-overhaul-accessibility-statement}

Go to Digital Overhaul All Topics
    Go To   ${digital-overhaul-all-topics}

Go to Digital Overhaul Travelling Abroad During COVID-19
    Go To   ${digital-overhaul-travelling-abroad-during-covid}

Go to Digital Overhaul Close Contacts
    Go To   ${digital-overhaul-close-contacts}