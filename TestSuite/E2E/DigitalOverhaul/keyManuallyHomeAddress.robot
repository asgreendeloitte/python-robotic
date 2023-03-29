*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  ImapLibrary2

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/homeAddress.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Flows/emailVerification.robot

Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser


*** Test Cases ***

Enter their home address
    [Tags]      TTCS20-3390
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Find a test result for covid-19 testing
    Click Submit form
    Sleep  2s
    Select someone else Radio Button
    Click Continue on the page

    Page should contain    Tell us about the person you're completing this form for
    Input their First Name      Alan
    Input their Last Name       Smithee
    Click Continue on the page

    Click friend as relation
    Click Continue on the page

    globalElements.Select Radio Button By Value    PCR test
    Click Continue on the page

    Page should contain     Was the test taken for international travel?
    Select Yes radio button
    Click Continue on the page

    Input the day was the test taken     30  03  2021
    Click Continue on the page

    Page should contain     Do you know the test barcode?
    globalElements.Select Radio Button By Value     Yes-barcode
    Input the test barcode      ABC12345678
    Click Continue on the page

    Input the mobile phone number was used to book the test     +447700900982
    Click Continue on the page

    page should contain     Do you know the date of birth of the person who took the test?
    Select Yes radio button
    Input the day of your birth     12  12  2000
    Click Continue on the page

    Page should contain     Do you know the home address of the person who took the test?
    Select Yes radio button
    Click Continue on the page

    Page should contain     Do you know the home address of the person who took the test?
    Click Continue on the page
    Page should contain     Enter postcode

    Input the postcode      SW1W 0NU
    Click Continue on the page

    Click I can't find my address in the list
    Click Continue on the page
    page should contain     Enter house number or name
    page should contain     Enter street name
    page should contain     Enter town or city
    page should contain     Enter postcode

    Input the House number or name      1*&*
    Input the Street name       1@£$%
    Input the Town or city      1@£$£%
    Input the postcode into the field   SDFDT&^%*^&&

    Click Continue on the page

    Page should contain     House number or name must only include letters a to z, numbers, spaces, hyphens, full stops, commas, apostrophes and exclamation marks
    Page should contain     Street name must only include letters a to z, numbers, spaces, hyphens, full stops, commas, apostrophes and exclamation marks
    Page should contain     Town or city must only include letters a to z, numbers, spaces, hyphens, full stops, commas, apostrophes and exclamation marks
    Page should contain     Enter a real postcode, like S42 5TT


    Input the House number or name      FUCK
    Input the Street name       FUCK
    Input the Town or city      FUCK
    Input the postcode into the field   FUCK

    Click Continue on the page

   Page should contain     House number or name must not include profanities
   Page should contain     Street name must not include profanities
   Page should contain     Town or city must not include profanities
   Page should contain     Enter a real postcode, like S42 5TT


    Input the House number or name      A wonderful serenity has taken possession of my entire soul like these sweet mornings of spring which I enjoy with my whole heart I am alone and feel the charm of existence in this spot which was created for the bliss of souls like mine I am so happy my dear friend so absorbed in the exquisite sense of mere tranquil existence that I neglect my talents I should be incapable of drawing a single stroke at the present moment and yet I feel that I never was a greater artist than now When while the lovely valley teems with
    Input the Street name       A wonderful serenity has taken possession of my entire soul like these sweet mornings of spring which I enjoy with my whole heart I am alone and feel the charm of existence in this spot which was created for the bliss of souls like mine I am so happy my dear friend so absorbed in the exquisite sense of mere tranquil existence that I neglect my talents I should be incapable of drawing a single stroke at the present moment and yet I feel that I never was a greater artist than now When while the lovely valley teems with
    Input the Town or city      A wonderful serenity has taken possession of my entire soul like these sweet mornings of spring which I enjoy with my whole heart I am alone and feel the charm of existence in this spot which was created for the bliss of souls like mine I am so happy my dear friend so absorbed in the exquisite sense of mere tranquil existence that I neglect my talents I should be incapable of drawing a single stroke at the present moment and yet I feel that I never was a greater artist than now When while the lovely valley teems with
    Input the postcode into the field   A wonderful serenity has taken possession of my entire soul like these sweet mornings of spring which I enjoy with my whole heart I am alone and feel the charm of existence in this spot which was created for the bliss of souls like mine I am so happy my dear friend so absorbed in the exquisite sense of mere tranquil existence that I neglect my talents I should be incapable of drawing a single stroke at the present moment and yet I feel that I never was a greater artist than now When while the lovely valley teems with

    Click Continue on the page

    Page should contain     House number or name must be not be more than 99 characters
    Page should contain     Street name must be not be more than 155 characters
    Page should contain     Town or city must be not be more than 255 characters
    Page should contain     Enter a real postcode, like S42 5TT

     Input the House number or name      131
     Input the Street name               Kings road
     Input the Town or city              London
     Input the postcode in address not found                 S42 5TT
     Click Continue on the page
     Page should contain        Are they fully vaccinated?
     Page should contain        To be fully vaccinated you must have had a complete course of an approved COVID-19 vaccine at least 14 days ago.
