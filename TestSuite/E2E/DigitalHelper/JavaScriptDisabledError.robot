*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

Resource    ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource    ${EXECDIR}/Resources/DigitalHelper/Utilities/DisableJavaScript.robot

Test Teardown  Close Browser

*** Test Cases ***
Verify JavaScript error page is shown when JavaScript is disbaled
    [Documentation]  This test runs in firefox, the steps to turn off javascript are unique to each browser.
    [Tags]  CS20-1167

    Set Suite Variable     ${BROWSER}  firefox
    Open Browser, Go To Digital Helper and Accept Cookies

    Page Should Contain     Start now   #This only appears when Javascript is enabled

    Disable JavaScript (Firefox)

    Go To Digital Helper
    Page Should Contain     JavaScript Required     #This only appears when Javascript is NOT enabled

