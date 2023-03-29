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

*** Test Cases ***

Make an Complaint about NHS COVID-19 app as Someone Else
    [Tags]  TTCS20-4049
    click on the make a complaint link
    Click on Make a complaint button
    Sleep  2s
    Make a complaint about the topic    The NHS COVID-19 app
    Click Continue on the page
    Page should contain     The NHS COVID-19 app
    page should contain   The NHS COVID-19 app will close down on 27 April 2023
    page should contain   All the app features will be working until that date.
    page should contain   Even though the app is closing down, please follow the latest guidance to protect yourself and others.
    page should contain   This includes reporting NHS lateral flow test results on GOV.UK. If you're eligible for COVID-19 treatment, you must report your result so the NHS can contact you about treatment.
    Page Should Contain   Read more about why the app is closing down on GOV.UK
    Tap to continue to the next page

    Select someone else Radio Button
    Sleep       2s
    Page should contain element     ${someone-else-text}
    Page should contain     If you are completing this form for someone else, you must be able to answer detailed questions on their behalf.
    Click Continue on the page


    Page should contain    Tell us about the person you're completing this form for
    Input their First Name      Alan
    Input their Last Name       Smithee
    Click Continue on the page

    Page should contain    What is your relationship to this person?
    Click relative as relation
    Click Continue on the page

    Page should contain     Can you provide more detail about the complaint?
    Page should contain     Do not give personal financial information, like your National Insurance number or credit card details. Do not include characters like £ : ; or %
    Input text         ${complaint-details}        Test
    Click Continue on the page

    Page should contain     What are your contact details?
    Input your First Name   Test
    Input your Last Name    Last
    Input your mobile phone number (Optional)   077556644553
    Click Continue on the page

    Page should contain     What is your email address?
    Enter email address     testtrace4@gmail.com
    Confirm email address   testtrace4@gmail.com
    Click Continue on the page

    Page should contain     Check your answers before submitting your complaint
    Click submit complaint form
    Sleep  3s

    Page Should Contain         Form submitted
    Page Should Contain         Your case number is
    Wait Until Element Is Visible     ${Case-number-element}
    ${Case-number}=     Get Text      ${Case-number-element}
    Length Should Be            ${Case-number}     8

    Tap back to home button
    Sleep   2s
    Page Should Contain     Get help with coronavirus (COVID-19) enquiries and complaints