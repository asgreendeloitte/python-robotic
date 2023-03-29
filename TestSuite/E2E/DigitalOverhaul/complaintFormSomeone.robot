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
Make an COMPLAINT about COVID-19 as Someone else
    [Tags]  TTCS20-2156-2   TTCS20-3609  TTCS20-5122  TTCS20-4929
    click on the make a complaint link
    Click on Make a complaint button
    Sleep  2s
    Make a complaint about the topic    International travel
    Click Continue on the page
    Click Continue on the page
    Page should contain     Select who you are completing this form for
    Select someone else Radio Button
    Sleep       2s
    Page should contain element     ${someone-else-text}
    Page should contain     If you are completing this form for someone else, you must be able to answer detailed questions on their behalf.
    Click Continue on the page

    Page should contain  Tell us about the person you're completing this form for
    Input their Date Of Birth   32  21  2000
    Click Continue on the page
    Page should contain  Enter their first name
    Page should contain  Enter their last name
    Page should contain  Date of birth must be a real date
    Input their First Name      Kevin
    Input their Last Name       Smith
    Input their Date Of Birth   01  01  2000
    Click Continue on the page

    Page should contain     What is your relationship to this person?
    Relationship to this person     Guardian
    Click Continue on the page

    Page should contain     Can you provide more detail about the complaint?
    Page should contain     Do not give personal financial information, like your National Insurance number or credit card details. Do not include characters like £ : ; or %
    Click Continue on the page
    Page should contain     Enter the reason for your complaint
    Input text         ${complaint-details}        Test$#
    Click Continue on the page
    Page should contain     Values must only include letters a to z, numbers, spaces, hyphens, full stops, commas, apostrophes and exclamation marks
    Input text         ${complaint-details}        Test
    Click Continue on the page

    Page should contain     What are your contact details?
    Input your mobile phone number (Optional)   gkgfgigu
    Click Continue on the page
    Page should contain     Enter your first name
    Page should contain     Enter your last name
    Page should contain     Enter a mobile phone number in the correct format

    Input your First Name   Test
    Input your Last Name    Last
    Input your mobile phone number (Optional)   077556644553
    Click Continue on the page

    Page should contain     What is your email address?
    Click Continue on the page
    Page should contain     Enter your email address
    Enter email address     testtrace4gmail.com
    Confirm email address   testtrace4gmail.com
    Click Continue on the page
    Page should contain     Enter an email address in the correct format, like name@example.com
    Enter email address     testtrace4@gmail.com
    Confirm email address   testing@gmail.com
    Click Continue on the page
    Page should contain     Enter email addresses that match

    Click GoBack
    Click GoBack
    Click GoBack
    Click GoBack
    Click GoBack
    Click GoBack

    Make a complaint about the topic    COVID-19 testing
    Click Continue on the page
    Select someone else Radio Button
    Sleep       2s
    Page should contain element     ${someone-else-text}
    Page should contain     If you are completing this form for someone else, you must be able to answer detailed questions on their behalf.
    Click Continue on the page

    Page should contain  Tell us about the person you're completing this form for
    Input their Date Of Birth   32  21  2000
    Click Continue on the page
    Page should contain  Date of birth must be a real date
    Input their First Name      Kevin
    Input their Last Name       Smith
    Input their Date Of Birth   01  01  2000
    Click Continue on the page

    Page should contain     What is your relationship to this person?
    Relationship to this person     Relative
    Click Continue on the page

    Page should contain     Can you provide more detail about the complaint?
    Page should contain     Do not give personal financial information, like your National Insurance number or credit card details. Do not include characters like £ : ; or %
    Input text         ${complaint-details}        Test$#
    Click Continue on the page
    Page should contain     Values must only include letters a to z, numbers, spaces, hyphens, full stops, commas, apostrophes and exclamation marks
    Input text         ${complaint-details}        Test
    Click Continue on the page

    Page should contain     What are your contact details?
    Input your mobile phone number (Optional)   gkgfgigu
    Click Continue on the page
    Page should contain     Enter a mobile phone number in the correct format

    Input your First Name   Test
    Input your Last Name    Last
    Input your mobile phone number (Optional)   077556644553
    Click Continue on the page

    Page should contain     What is your email address?
    Enter email address     testtrace4gmail.com
    Confirm email address   testtrace4gmail.com
    Click Continue on the page
    Page should contain     Enter an email address in the correct format, like name@example.com
    Enter email address     testtrace4@gmail.com
    Confirm email address   testing@gmail.com
    Click Continue on the page
    Page should contain     Enter email addresses that match

    Click GoBack
    Click GoBack
    Click GoBack
    Click GoBack
    Click GoBack
    Click GoBack

    Make a complaint about the topic    Stay at home
    Click Continue on the page
    Select someone else Radio Button
    Click Continue on the page
    Page should contain  Tell us about the person you're completing this form for
    Click GoBack
    Click GoBack

    Make a complaint about the topic   Workplace, organisation, care home or school guidance
    Click Continue on the page
    Select someone else Radio Button
    Click Continue on the page
    Page should contain  Tell us about the person you're completing this form for
    Click GoBack
    Click GoBack

    Make a complaint about the topic   Other
    Click Continue on the page
    Select someone else Radio Button
    Sleep       2s
    Page should contain element     ${someone-else-text}
    Page should contain     If you are completing this form for someone else, you must be able to answer detailed questions on their behalf.
    Click Continue on the page

    Page should contain  Tell us about the person you're completing this form for
    Input their Date Of Birth   32  21  2000
    Click Continue on the page
    Page should contain  Date of birth must be a real date
    Input their First Name      Kevin
    Input their Last Name       Smith
    Input their Date Of Birth   01  01  2000
    Click Continue on the page

    Page should contain     What is your relationship to this person?
    Relationship to this person     Relative
    Click Continue on the page

    Page should contain     Can you provide more detail about the complaint?
    Page should contain     Do not give personal financial information, like your National Insurance number or credit card details. Do not include characters like £ : ; or %
    Click Continue on the page

    Page should contain     What are your contact details?
    Input your mobile phone number (Optional)   gkgfgigu
    Click Continue on the page
    Page should contain     Enter a mobile phone number in the correct format, like 07700 900 982

    Input your First Name   Test
    Input your Last Name    Last
    Input your mobile phone number (Optional)   077556644553
    Click Continue on the page

    Page should contain     What is your email address?
    Enter email address     testtrace4gmail.com
    Confirm email address   testtrace4gmail.com
    Click Continue on the page
    Page should contain     Enter an email address in the correct format, like name@example.com
    Enter email address     testtrace4@gmail.com
    Confirm email address   testing@gmail.com
    Click Continue on the page
    Page should contain     Enter email addresses that match
    Enter email address     testtrace4@gmail.com
    Confirm email address   testtrace4@gmail.com
    Click Continue on the page

    Page should contain     Check your answers before submitting your complaint