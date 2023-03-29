*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
#Library  AppiumLibrary
#Library  SeleniumLibrary  server_host=${SELENIUM HOST}  server_port=${SELENIUM PORT}

# Setup
Resource    ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot

# DigitalHelper Flows
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

#Suite Setup     Open Browser, Go To Digital Helper and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***
${remote}   remote_url=https://hasenh:2fc36fe4-cb5d-4e5a-8390-1b7cb64b5dba@ondemand.us-west-1.saucelabs.com:443/wd/hub  desired_capabilities=name:macOS 11.00 + Safari 14,platform:macOS 11.00,browserName:safari,version:14
${digital-helper-url}         https://uat-hcermprodsignoff-171fe182e04-1736bd867e8.cs119.force.com/s/
${BROWSER} =  chrome
${Remote_URL}       https://hasenhaneef_DZXsA4:fTp78mAHduozg8UzzQ5q@hub-cloud.browserstack.com/wd/hub

${Desired_cap}     name:macOS 11.00 + Safari 14,browserName:ios,device:iPad Pro 12.9 2021,os_version:14,build:browserstack-build-1,realMobile:true


*** Test Cases ***
Empty Short Form
         [Tags]      CS20-645

   Open Browser  ${digital-helper-url}  ${BROWSER}  remote_url=${Remote_URL}  desired_capabilities=${Desired_cap}
    SeleniumLibrary.wait until page contains    I'm OK with analytics cookies
    sleep   2s
    SeleniumLibrary.Click Element   ${accept-nhs-cookies-btn}
    sleep   3s
    SeleniumLibrary.Page Should Contain     Get help with coronavirus (COVID-19) enquiries and complaints
    SeleniumLibrary.Page Should Contain     Use this service for advice, guidance and help with NHS Test and Trace.

    SeleniumLibrary.Page Should Contain     You can:

    SeleniumLibrary.Page Should Contain     make an enquiry
    SeleniumLibrary.Page Should Contain     For example, get the latest guidance on self-isolation.

    SeleniumLibrary.Page Should Contain     give feedback
    SeleniumLibrary.Page Should Contain     For example, share your experience of taking a coronavirus test.

    SeleniumLibrary.Page Should Contain     make a complaint
    SeleniumLibrary.Page Should Contain     For example, share a poor experience with a contact tracer.

    SeleniumLibrary.Page Should Contain     If you have not found what you are looking for, you may submit a form.
    SeleniumLibrary.Page Should Contain     Enquiries are responded to within 3 working days and complaints are responded to within 25 working days.

    SeleniumLibrary.Page Should Contain     Advice for other parts of the UK

    SeleniumLibrary.Page Should Contain     This website contains COVID-19 guidance that applies to England.

    SeleniumLibrary.Page Should Contain Link    Scotland - COVID-19
    SeleniumLibrary.Page Should Contain Link    Wales - COVID-19
    SeleniumLibrary.Page Should Contain Link    Northern Ireland - COVID-19












