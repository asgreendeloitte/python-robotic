*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  ImapLibrary2
Library  AxeLibrary

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/intnlTravel.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Flows/emailVerification.robot


Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Variables ***
${testing-for-care-home}   //span[contains(text(),'Testing for care homes')]
${safety-workplace}     //span[contains(text(),'Safety in the workplace')]
${work-place}    //h1[@id='workplace,-organisation-or-care-home-guidance']
${subject-text-Enquiry}      Sandbox: Confirmation of your enquiry to NHS Test and Trace
${Body-text1}       Case Number
${Body-text2}       Dear Test
${Body-text3}       Thank you
${Body-text4}       What you have provided to us

*** Test Cases ***
Testing in care home validations
    [Tags]  TTCS20-3661         [Tags]  TTCS20-3931

     Go To Digital Overhaul
     click on the get help link
     Sleep  2s
     Get help and make an enquiry about the topic     4

     page should contain   Workplace, organisation or care home guidance
     Click guidelines and saftey for organisations
     Click Submit form

     page should contain  Who are you completing this form for?
     Sleep  2s
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
     page should contain  Do not give personal financial information, like your National Insurance number or credit card details. Do not include characters like £ : ; or %
     page should contain  Enquiry details
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

     Page Should Contain         Form submitted
     Page Should Contain         Your case number is
     Wait Until Element Is Visible     ${Case-number-element}
     ${Case-number}=     Get Text      ${Case-number-element}
     Length Should Be            ${Case-number}     8
    # Perform multipart email verification   ${subject-text-Enquiry}  ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}