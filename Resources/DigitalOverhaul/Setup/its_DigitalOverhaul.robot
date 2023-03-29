*** Variables ***
${BROWSER}      chrome   #Default, set in console to override

${digital-overhaul-url}              https://itstest-dho.cs80.force.com/

${digital-verhaul-analtyics-btn}          //button[@id='nhsuk-cookie-banner__link_accept_analytics']

${accept-nhs-cookies-btn}            //button[@id='nhsuk-cookie-banner__link_accept_analytics']



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

