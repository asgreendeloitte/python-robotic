*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser


*** Test Cases ***
Rapid lateral flow test to do a home test
    [Tags]  TTCS20-2205     TTCS20-4340-02    TTCS20-5729-03-06
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Home test kits for covid-19 testing
    Page should contain     Home test kits
    page should contain     If you need help returning a test via courier, call 119.
    Page Should Contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.
    Page Should Contain Element    //span[@id='helpButtonSpan']

    Expand How to do a rapid lateral flow test at home
    Click on how to do a rapid lateral flow link
    Switch Window   title=How to use an NHS COVID-19 rapid lateral flow test - NHS

    Page should contain     How to use an NHS COVID-19 rapid lateral flow test
    Page should contain    A COVID-19 rapid lateral flow test shows you the result on a device that comes with the test.


PCR test to do a home test
    [Tags]  TTCS20-2205-01
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Home test kits for covid-19 testing
    Page should contain     Home test kits

    Expand How to do a PCR test at home
    Click on how to do a PCR test at home link

    Switch Window   title= Coronavirus (COVID-19) PCR home test kit instructions - GOV.UK


    Page should contain     Coronavirus (COVID-19) PCR home test kit instructions

An antibody test to do a home test
    [Tags]  TTCS20-5666-02
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Home test kits for covid-19 testing
    Page should contain     Home test kits
    Page Should Not Contain    How to do an antibody test at home
    Expand How to do a rapid lateral flow test at home
    Click on how to do a rapid lateral flow link

    Switch Window   title=How to use an NHS COVID-19 rapid lateral flow test - NHS

    Page should contain     How to use an NHS COVID-19 rapid lateral flow test

#    Expand How to do an antibody test at home
#    Click on how to do an antibody test at home


Need more help to do a home test
    [Tags]  TTCS20-2205-03
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Home test kits for covid-19 testing
    Page should contain     Home test kits
    Click Submit form
    Page should contain     Who are you completing this form for?
    page should contain radio button    id:myself
