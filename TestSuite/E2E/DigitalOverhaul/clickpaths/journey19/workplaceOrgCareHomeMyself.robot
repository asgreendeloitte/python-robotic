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
    [Tags]  TTCS20-2168  TTCS20-2173  TTCS20-3665 TTCS20-3448   TTCS20-2109-08

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
     Click guidelines and saftey for organisations
     Click Submit form

     page should contain  Who are you completing this form for?
     Sleep  2s
     Select myself Radio Button
     Click Continue on the page

     page should contain  Can you provide more detail about the enquiry?
     page should contain  Do not give personal financial information, like your National Insurance number or credit card details. Do not include characters like £ : ; or %
     page should contain  Enquiry details
     Enter details in text area  test
     Click Continue on the page

     page should contain  What are your contact details?
     Input your First Name   Test
     Input your Last Name    Last
     Input your mobile phone number (Optional)   077556644553
     Click Continue on the page

     page should contain  What is your email address?
     Enter email address     testtrace4@gmail.com
     Confirm email address   testtrace4@gmail.com
     Click Continue on the page

     Page should contain     Check your answers before submitting your enquiry
     Page Should Contain     Completing form for
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
     Page Should Contain         Form submitted
     Page Should Contain         Your case number is
     Wait Until Element Is Visible     ${Case-number-element}
     ${Case-number}=     Get Text      ${Case-number-element}
     Length Should Be            ${Case-number}     8
   #  Perform multipart email verification   ${subject-text-Enquiry}  ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}





