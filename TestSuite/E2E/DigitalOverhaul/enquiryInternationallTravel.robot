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
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/intnlTravel.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***
Make an Enquiry - International Travel
    [Tags]  TTCS20-2172     TTCS20-2109-02
    click on the get help link
    Get help and make an enquiry about the topic     3
    Page should contain     International travel
    Select red list countries and territories
    Page should contain     Red list countries and territories
    Click Start Again
    Page should contain     International travel
    Select travelling abroad during COVID-19
    Page should contain     Travelling abroad during COVID-19
    Click Start Again
    Page should contain     International travel
    Select Travel rules for Scotland, Wales and Northern Ireland
    Page should contain     Guidance for Scotland, Wales and Northern Ireland

Make an Enquiry - International Travel - Red list countries and territories
    [Tags]  TTCS20-3186
    click on the get help link
    Get help and make an enquiry about the topic     3
    Page should contain     International travel
    Select red list countries and territories
    Page should contain     Red list countries and territories
    Select red list countries and territories expander
    Click link  //a[@href="https://www.gov.uk/guidance/red-list-of-countries-and-territories"]
    Switch Window  new
    Page should contain     Travel to England from another country during coronavirus (COVID-19)
    Switch Window  main
    Click Start Again
    Page should contain     International travel

Make an Enquiry for someone - International Travel - Have they arrived in the UK from abroad?
    [Tags]  TTCS20-3464
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     3
    Page should contain     International travel
    Select travelling abroad during COVID-19
    Page should contain     Travelling abroad during COVID-19
    Click Submit Form
    Select someone else Radio Button
    Click Continue on the page
    Input their First Name    Test
    Input their Last Name    last
    Input their Date Of Birth   01  01  2000
    Click Continue on the page
    Click friend as relation
    Click Continue on the page

    Page should contain     Have they arrived in the UK from abroad?
    Click Continue on the page
    Page should contain     Select yes if they have arrived in the UK from abroad

    globalElements.Select Radio Button By Value    Yes
    Input the day was the test taken    25  02  2021
    Click Continue on the page
    Page should contain     Are they fully vaccinated?
    Click GoBack

    Page should contain     Have they arrived in the UK from abroad?
    globalElements.Select Radio Button By Value    Yes
    Input the day was the test taken    25  02  1996
    Click Continue on the page
    Page should contain     Date of arrival into the UK must not be before 2020

    Input the day was the test taken    54  14  3022
    Click Continue on the page
    Page should contain     Date of arrival into the UK must be a real date

    globalElements.Select Radio Button By Value    No
    Click Continue on the page
    Page should contain     Are they fully vaccinated?

Make an Enquiry for myself - International Travel - Have they arrived in the UK from abroad?
    [Tags]  TTCS20-2196
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     3
    Page should contain     International travel
    Select travelling abroad during COVID-19
    Page should contain     Travelling abroad during COVID-19
    Click Submit Form
    Select myself Radio Button
    Click Continue on the page

    Page should contain     Have you arrived in the UK from abroad?
    Click Continue on the page
    Page should contain     Select yes if you have arrived in the UK from abroad

    globalElements.Select Radio Button By Value    Yes
    Input the day was the test taken    25  02  2021
    Click Continue on the page
    Page should contain     Are you fully vaccinated?
    Click GoBack

    Page should contain     Have you arrived in the UK from abroad?
    globalElements.Select Radio Button By Value    Yes
    Input the day was the test taken    25  02  1996
    Click Continue on the page
    Page should contain     Date of arrival into the UK must not be before 2020

    Input the day was the test taken    54  14  3022
    Click Continue on the page
    Page should contain     Date of arrival into the UK must be a real date

    globalElements.Select Radio Button By Value    No
    Click Continue on the page
    Page should contain     Are you fully vaccinated?

Make an Enquiry for myself - International Travel - Check your answers before submitting your enquiry
    [Tags]  TTCS20-3477
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     3
    Page should contain     International travel
    Select travelling abroad during COVID-19
    Click Submit form
    Select someone else Radio Button
    Click Continue on the page
    Input their First Name    Test
    Input their Last Name    last
    Input their Date Of Birth   01  01  2000
    Click Continue on the page
    Page should contain    What is your relationship to this person?
    Click relative as relation
    Click Continue on the page
    Page should contain     Have they arrived in the UK from abroad?
    globalElements.Select Radio Button By Value    Yes
    Input the day was the test taken    25  02  2021
    Click Continue on the page
    Page should contain     Are they fully vaccinated?
    Select Yes radio button
    Click Continue on the page
    Page should contain     Can you provide more detail about the enquiry?
    Enter details in text area  test
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

    Click Change button to change the vaccination status
    Select No radio button
    Click Continue on the page
    Page should contain     Can you provide more detail about the enquiry?
    Enter details in text area  test
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

    Page should contain     Completing form for
    Page should contain     Their full name
    Page should contain     Relationship
    Page should contain     Arrived from abroad
    Page should contain     Arrival date
    Page should contain     Vaccinated
    Page should contain     Enquiry details
    Page should contain     Name
    Page should contain     Email address
    Page should contain     Mobile phone number

    Submit enquiry form
    Page Should Contain         Form submitted
    Page Should Contain         Your case number is
    Wait Until Element Is Visible     ${Case-number-element}
    ${Case-number}=     Get Text      ${Case-number-element}
    Length Should Be            ${Case-number}     8





