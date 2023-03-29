*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  Collections
Library  CSVLibrary


# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot


# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login

*** Test Cases ***

Reset Staging Login Credentials
    [Tags]  reset_pwd
    Login as complaints test staging user

Do not register my phone
    [Tags]  reg_phone
   I do not want to register my phone

