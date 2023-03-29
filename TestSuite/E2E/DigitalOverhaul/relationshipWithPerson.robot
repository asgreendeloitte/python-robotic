*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***
Checking the Friend relationship with the person
    [Tags]  TTCS20-2169
    Go To Digital Overhaul
    click on the make a complaint link
    Click On Make A Complaint Button
    Make A Complaint About The Topic    COVID-19 testing
    Click Continue on the page
    Select someone else Radio Button
    Click Continue on the page
    Page should contain  Tell us about the person you're completing this form for
    Input their First Name    Test
    Input their Last Name    last
    Input their Date Of Birth   01  01  2000
    Click Continue on the page
    Page should contain  What is your relationship to this person?
    Click Continue on the page
    Page should contain     Enter your relationship to this person

    Relationship to this person     Other
    Click Continue on the page
    Page should contain    Enter your relationship to this person

    Other relation with the person  $%$·
    Click Continue on the page
    Page should contain    Your relationship to this person must only include letters a to z, numbers, spaces, hyphens, full stops, commas, apostrophes and exclamation marks

    Other relation with the person  fuck
    Click Continue on the page
    Page should contain     Your relationship to this person must not include profanities

    Other relation with the person      sadasdnkjnasdunqwnednsdnaknwuiondndaknsdlkansdnlndalnsdlknwdmnaiosndlanskldnainwdasndlknsadionwedoioisdnasndlasndoinadoaisdoasdoiajsodiasoidjoasjdoasjdoqwodjoisjsljdojdasjklllalal8enjojjojqhshasjdbasaasssaaanuelaaasdadadasdasdasddkpqkwpdo3452389asd9834s898
    Click Continue on the page
    Page should contain     Your relationship to this person must contain 255 characters or fewer

    Relationship to this person     Friend
    Click Continue on the page
    Page should contain     Can you provide more detail about the complaint?



