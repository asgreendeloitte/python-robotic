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
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/intnlTravel.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Variables ***
${testing-for-care-home}   //span[contains(text(),'Testing for care homes')]
${safety-workplace}     //span[contains(text(),'Safety in the workplace')]
${work-place}    //h1[@id='workplace,-organisation-or-care-home-guidance']

*** Test Cases ***
Testing in care home validations
    [Tags]  TTCS20-2168
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     4
    page should contain   Workplace, organisation or care home guidance
    Click guidelines and saftey for organisations
    page should contain   Guidelines and safety for organisations
    page should contain   Use the link below to find information on guidelines and safety for organisations. If you need more help, you can make an enquiry.
     click element   ${safety-workplace}
     page should contain link  Find out about reducing the spread of respiratory infections, including COVID-19, in the workplace (opens in new window).
     click link  https://www.gov.uk/guidance/reducing-the-spread-of-respiratory-infections-including-covid-19-in-the-workplace
     Switch Window   new
     page should contain  Reducing the spread of respiratory infections, including COVID-19, in the workplace
     page should contain  Public health principles for reducing the spread of respiratory infections, including COVID-19, in the workplace.
     close window
     Switch Window   main
     Click Start Again
     page should contain   Workplace, organisation or care home guidance


