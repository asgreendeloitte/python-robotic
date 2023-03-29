*** Variables ***
${BROWSER}      chrome   #Default, set in console to override

${digital-helper-url}         https://comptest-hcermprodsignoff-171fe182e04-1736bd867e8.cs126.force.com/s/

${accecpt-analtyics-btn}            //button[@id='nhsuk-cookie-banner__link_accept_analytics-6']

${accept-nhs-cookies-btn}            //button[@id='nhsuk-cookie-banner__link_accept_analytics-0']

*** Keywords ***
Open Browser, Go To Digital Helper and Accept Cookies
    # starts the browser maximised
    ${options}=     Evaluate  sys.modules['selenium.webdriver.${BROWSER}.options'].Options()    sys
#    Call Method     ${options}    add_argument    --disable-javascript
    Call Method     ${options}    add_argument    --disable-notifications
    Call Method     ${options}    add_argument      --start-maximized

    Call Method     ${options}    add_argument      --no-sandbox
  #  Call Method     ${options}    add_argument      --headless
    Call Method     ${options}    add_argument      --disable-gpu
    Call Method     ${options}    add_argument      --window-size\=1920,1080
    Call Method     ${options}    add_argument      --disable-dev-shm-usage

    Open Browser   ${digital-helper-url}     ${BROWSER}   options=${options}
#    sleep   2s
#    Click Element   ${accecpt-analtyics-btn}
    Wait Until Page Contains     I'm OK with analytics cookies
    sleep   1s
    Click Element   ${accept-nhs-cookies-btn}
    sleep   1s

Go To Digital Helper
    Go To   ${digital-helper-url}

