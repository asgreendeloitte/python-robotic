*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${digital-overhaul-url}       https://dhqa-dho.cs110.force.com/

${os}                          Windows
${osVersion}                   10
${browserVersion}              latest
${browserstack_userName}       sameerapurini_arjV2M
${browserstack_accessKey}      hqyShAKNxEwMhqxpj8Bc


*** Keywords ***
Open Browser, Go To Digital Overhaul and Accept Cookies
   Call browser stack for device         Samsung Galaxy S21    12      chrome    latest
   Call browser stack for device         Samsung Galaxy S20    10      chrome    latest
   Call browser stack for device         Samsung Galaxy S10    9.0     chrome    latest
   Call browser stack for device         Samsung Galaxy S9     8.0     chrome    latest
   Call browser stack                    Windows  10   firefox    latest
   Call browser stack                    Windows  10   chrome    latest
   Call browser stack for ios device     OS X        Monterey   Chrome    ${browserVersion}
   Call browser stack for ios device     iPhone XS   12         safari    ${browserVersion}
   Call browser stack for ios device     iPhone 11   15         safari    ${browserVersion}
   Call browser stack for ios device     iPhone X    11         safari    ${browserVersion}ol0
   Call browser stack for ios device     iPhone SE   11         safari    ${browserVersion}
   Call browser stack for ios device     iPhone 7    12         safari    ${browserVersion}



Call browser stack
    [Arguments]  ${os}    ${osVersion}    ${browser}   ${browserVersion}
    ${options}=     Evaluate  sys.modules['selenium.webdriver.${BROWSER}.options'].Options()    sys
        Call Method     ${options}    add_argument      --no-sandbox
        Call Method     ${options}    add_argument     --disable-notifications
        Call Method     ${options}    add_argument      --headless
        Call Method     ${options}    add_argument      --start-maximized
        Call Method     ${options}    add_argument      --disable-gpu
        Call Method     ${options}    add_argument      --window-size\=1920,1080
        Call Method     ${options}    add_argument      --disable-dev-shm-usage
        ${remoteUrl}                Set Variable        http://${browserstack_userName}:${browserstack_accessKey}@hub-cloud.browserstack.com:80/wd/hub
        &{desiredCapabilities}      Create Dictionary   os=${os}     os_version=${osVersion}     browser=${browser}   browserstack.idleTimeout=100     browser_version=${browserVersion}
        Open Browser   ${digital-overhaul-url}     remote_url=${remoteUrl}     desired_capabilities=${desiredCapabilities}

Call browser stack for device
    [Arguments]  ${device}    ${osVersion}    ${browser}   ${browserVersion}
    ${options}=     Evaluate  sys.modules['selenium.webdriver.${BROWSER}.options'].Options()    sys
        Call Method     ${options}    add_argument      --no-sandbox
        Call Method     ${options}    add_argument     --disable-notifications
        Call Method     ${options}    add_argument      --headless
        Call Method     ${options}    add_argument      --start-maximized
        Call Method     ${options}    add_argument      --disable-gpu
        Call Method     ${options}    add_argument      --disable-dev-shm-usage
        ${remoteUrl}                Set Variable        http://${browserstack_userName}:${browserstack_accessKey}@hub-cloud.browserstack.com:80/wd/hub
        &{desiredCapabilities}      Create Dictionary   device=${device}     build=DigitalOverhaul     os_version=${osVersion}     real_mobile=true     browserstack.idleTimeout=100     browser=${browser}   browser_version=${browserVersion}     browserstack.idleTimeout=1200    browserstack.appium_version=1.22.0    appium_version=1.22.0
        Open Browser   ${digital-overhaul-url}     remote_url=${remoteUrl}     desired_capabilities=${desiredCapabilities}

Call browser stack for ios device
    [Arguments]  ${device}    ${platformVersion}    ${browser}   ${browserVersion}
        ${remoteUrl}                Set Variable        http://${browserstack_userName}:${browserstack_accessKey}@hub-cloud.browserstack.com:80/wd/hub
        &{desiredCapabilities}      Create Dictionary       osVersion=14      deviceName=iPhone 12       realMobile=true      local=false       browserstack.use_w3c=true
        Open Browser   ${digital-overhaul-url}     remote_url=${remoteUrl}     desired_capabilities=${desiredCapabilities}

Go To Digital Overhaul
    Go To   ${digital-overhaul-url}







