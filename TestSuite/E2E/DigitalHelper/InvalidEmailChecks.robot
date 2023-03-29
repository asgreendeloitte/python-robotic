*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup
Resource    ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot

# DigitalHelper Flows
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

Suite Setup     Open Browser, Go To Digital Helper and Accept Cookies
Suite Teardown  Close Browser

*** Test Cases ***
Verify invalid email formats
    [Tags]      CS20-620 CS20-621
    [Template]      Submit form with invalid email and check error message
#   Invalid emails
    John_£_Barnes@test.com
    plainaddress
    @%^%#$@#$@#.com
    @example.com
#    .email@example.com     # this ones gives a ugly error
    John__Barnes£@test.com

*** Keywords ***
Submit form with invalid email and check error message
    [Arguments]  ${invalid-email}
    Complete Short Form User Flow  email=${invalid-email}
    Page Should Contain     Enter an email address in the correct format, like name@example.com