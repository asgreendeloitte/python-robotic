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

Enquiry - Close Contacts - Click Path - Someone else
    [Tags]       TTCS20-3953

    click on the get help link
    Click the close contact enquiry link

    Page should contain    Close contacts
    Click Submit form
    Page should contain     Who are you completing this form for?
    Select someone else Radio Button
    Click Continue on the page

    Page should contain    Tell us about the person you're completing this form for
    Input their First Name      Alan
    Input their Last Name       Smithee
    Input their Date Of Birth   01  01  2000
    Click Continue on the page

    Page should contain    What is your relationship to this person?
    Click relative as relation
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
    Enter email address     testtrace4@gmail.com
    Confirm email address   testtrace4@gmail.com
    Click Continue on the page

     Page should contain     Check your answers before submitting your enquiry
     Page Should Contain     Completing form for
     Page Should Contain     Their full name
     Page Should Contain     Relationship
     Page should contain     Their date of birth
     Page Should Contain     Enquiry details
     Page Should contain     Name
     Page Should contain     Email address
     Page Should contain     Mobile phone number

    Submit enquiry form

    Page Should Contain         Form submitted
    Page Should Contain         Your case number is
    Wait Until Element Is Visible     ${Case-number-elem}
    ${Case-number}=     Get Text      ${Case-number-elem}
    Length Should Be            ${Case-number}     8
  #  Perform multipart email verification   ${subject-text-Enquiry}  ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}