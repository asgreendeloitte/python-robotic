*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup
Resource    ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot

# DigitalHelper Flows
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

Suite Setup     Open Browser, Go To Digital Helper and Accept Cookies
Suite Teardown  Close Browser

*** Test Cases ***
Empty Short Form
         [Tags]      CS20-645
    Complete Short Form User Flow  name=    email=  message=
    sleep   2s
    Page Should Contain     Enter your name
    Page Should Contain     Enter an email address, like name@example.com
    Page Should Contain     Enter your feedback



