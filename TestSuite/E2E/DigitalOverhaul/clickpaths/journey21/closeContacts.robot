*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  ImapLibrary2
Library  AxeLibrary

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Flows/emailVerification.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/closeContacts.robot

Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***
${get-result}            //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/test-results/how-you-get-your-test-result/"]
${reg-kit}               //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/register-a-test-kit/"]
${subject-text-Enquiry}      Sandbox: Confirmation of your enquiry to NHS Test and Trace
${Body-text1}       Case Number
${Body-text2}       Dear Test
${Body-text3}       Thank you
${Body-text4}       What you have provided to us

*** Test Cases ***

Enquiry - Close Contacts - Click Path - Myself
    [Tags]      TTCS20-3806-01      TTCS20-3798     TTCS20-3861     TTCS20-3953     TTCS20-2109-04     TTCS20-5729-04

    click on the get help link
    Click the close contact enquiry link

    Page should contain    Close contacts
    Sleep  2s
    Page Should Contain    Webchat is currently only available for citizens in England. However we are looking to expand this to all nations in the future.
    Page Should Contain Element    //span[@id='helpButtonSpan']
    Click on if you are a close contact of someone who has ccovid-19 and live in the same household

    Click on follow the advice of close contacts of people with Covid-19
    Sleep   2s
    Switch Window   new
    Page should contain     What to do if you are a close contact of someone who has had a positive test result for COVID-19
    Switch Window   main

    Page should contain    Close contacts
    Sleep  2s
    Click on if you are a close contact of someone who has covid-19 and do not live with them

    Click on how to live safely with respiratory infections, including covid-19
    Sleep   2s
    Switch Window   new
    Page should contain     Living safely with respiratory infections, including COVID-19
    Switch Window   main

    Page should contain    Close contacts
    Page should contain    Need more help? Make an enquiry
    Click Start Again
    Page should contain     Get help with coronavirus (COVID-19) enquiries and complaints

    Click the close contact enquiry link
    Page should contain    Close contacts
    Click Submit form
    Page should contain     Who are you completing this form for?

    Select myself Radio Button
    Click Continue on the page

    Page should contain     Can you provide more detail about the enquiry?
    Enter details in text area      testing
    Click Continue on the page

    Page should contain     What are your contact details?
    Input your First Name   Firstname
    Input your Last Name    Lastname
    Input your mobile phone number (Optional)   07766556677
    Click Continue on the page

    Page should contain     What is your email address?
    Enter email address     test@gmail.com
    Confirm email address   test@gmail.com
    Click Continue on the page

    Page should contain     Check your answers before submitting your enquiry
    Submit enquiry form

    Page Should Contain         Form submitted
    Page Should Contain         Your case number is
    Wait Until Element Is Visible     ${Case-number-elem}
    ${Case-number}=     Get Text      ${Case-number-elem}
    Length Should Be            ${Case-number}     8
   # Perform multipart email verification   ${subject-text-Enquiry}  ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}