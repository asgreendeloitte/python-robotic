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
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/homeAddress.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/stayAtHome.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Flows/emailVerification.robot

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

Enquiry - Stay at home - Submit Form - Someone Else
    [Tags]      TTCS20-3806-03    TTCS20-3803   TTCS20-2109-03
    Go To Digital Overhaul
    click on the get help link
    Click stay at home topic

    Page should contain     Stay at home
    Sleep  2s
    Click General guidance for staying at home
    Page should contain     General guidance for staying at home
    Click Submit form

    Page should contain     Who are you completing this form for?
    Select someone else Radio Button
    Sleep       2s
    Page should contain element     ${someone-else-text}
    Page should contain     If you are completing this form for someone else, you must be able to answer detailed questions on their behalf.
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

     Click Change button to change the email address
     Change email address    testtrace4@gmail.com
     Confirm changed email address    testtrace4@gmail.com
     Click Continue on the page

    Page should contain     Check your answers before submitting your enquiry
    Submit enquiry form

    Page Should Contain          Your case number is
    Wait Until Element Is Visible     ${stay-at-home-case-number-element}
    ${Case-number}=     Get Text      ${stay-at-home-case-number-element}
    Length Should Be            ${Case-number}     8
   # Perform multipart email verification   ${subject-text-Enquiry}  ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}






