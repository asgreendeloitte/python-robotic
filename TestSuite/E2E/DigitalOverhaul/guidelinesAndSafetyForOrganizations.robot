*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/complaint.robot


Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser


*** Variables ***
${safety-in-workplace}   //span[contains(text(),'Safety in the workplace')]


*** Test Cases ***
Guidelines and safety for organizations
    [Tags]  TTCS20-2173
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     4
    page should contain   Workplace, organisation or care home guidance
    Click guidelines and saftey for organisations
    click element   ${safety-in-workplace}
    page should contain     Guidelines and safety for organisations
    page should contain link        Find out about reducing the spread of respiratory infections, including COVID-19, in the workplace (opens in new window).
    click link   https://www.gov.uk/guidance/reducing-the-spread-of-respiratory-infections-including-covid-19-in-the-workplace
    Switch Window   new
    page should contain     Reducing the spread of respiratory infections, including COVID-19, in the workplace
    page should contain     Public health principles for reducing the spread of respiratory infections, including COVID-19, in the workplace.
    page should contain     Who this information is for
    page should contain     Know which symptoms to look out for
    page should contain     What to do if a member of staff has symptoms of a respiratory infection, including COVID-19
    page should contain     Actions to reduce the spread of respiratory infections, including COVID-19
    close window
    Switch Window   main
    Verify Start again button
    Verify Submit a form button
