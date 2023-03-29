*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/nhsCovid19App.robot


Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser

*** Test Cases ***

COVID-19 App - The NHS COVID-19 App tile route - Submit enquiry for someonelse
    [Tags]      TTCS20-4060

    Go To Digital Overhaul
    Click the nhs covid-19 app link
    Page should contain     The NHS COVID-19 app
    Sleep   2s
    Click using and setting up the app tile

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
     Page should contain     Their date of birth
     Page Should Contain     Relationship
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