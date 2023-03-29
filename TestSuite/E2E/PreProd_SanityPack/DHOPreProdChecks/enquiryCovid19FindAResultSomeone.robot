*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  ImapLibrary2
Library  AxeLibrary

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
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
#Suite Teardown  Close Browser

*** Variables ***
${get-result}            //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/test-results/how-you-get-your-test-result/"]
${reg-kit}               //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/register-a-test-kit/"]
${subject-text-Enquiry}      Sandbox: Confirmation of your enquiry to NHS Test and Trace
${Body-text1}       Case Number
${Body-text2}       Dear Test
${Body-text3}       Thank you
${Body-text4}       What you have provided to us
${vaccinationstatus}  //lightning-formatted-text[contains(text(),'Fully vaccinated')]
${Test-type}        //lightning-formatted-text[contains(text(),'PCR test')]
${Test-taken}       (//*[@class='slds-form-element__control'])[27]
*** Test Cases ***

COVID-19 Testing Journey - Find a result for someone else - Address Not Known - Click path
    [Tags]      TTCS20-3406     TTCS20-4037   TTCS20-4035    TTCS20-3962

    Go To Digital Overhaul
    click on the get help link
    Click covid-19 testing topic
    Find a test result for covid-19 testing
    Click Submit form

    Page should contain     Who are you completing this form for?
    Sleep  2s
    Select someone else Radio Button
    Click Continue on the page

    Page should contain    Tell us about the person you're completing this form for
    Input their First Name      Alan
    Input their Last Name       Smithee
    Click Continue on the page

    Page should contain    What is your relationship to this person?
    Click relative as relation
    Click Continue on the page

    Page should contain    Which COVID-19 test did they take?
    globalElements.Select Radio Button By Value    PCR test
    Click Continue on the page

    Page should contain     Was the test taken for international travel?
    globalElements.Select Radio Button By Value    Yes
    Click Continue on the page

    Page should contain     When was the test taken?
    Input the day was the test taken    25  02  2021
    Click Continue on the page

    Page should contain     Do you know the test barcode?
    globalElements.Select Radio Button By Value     Yes-barcode
    Input the test barcode      ABC12345678
    Click Continue on the page

    Page should contain     What mobile phone number was used to book the test?
    Input the mobile phone number was used to book the test     +447700900982
    Click Continue on the page

    Page should contain     Do you know the date of birth of the person who took the test?
    globalElements.Select Radio Button By Value    Yes
    Input the day of your birth     12  12  2000
    Click Continue on the page

    globalElements.Select Radio Button By Value    Yes
    Click Continue on the page

    Page should contain    Do you know the home address of the person who took the test?
    Page should contain    Please enter the postcode
    Input the postcode      SW1W 0NY
    Click Continue on the page

    Page should contain     Do you know the home address of the person who took the test?
    Select address from the Drop down
    Click Continue on the page

    Page should contain     Are they fully vaccinated?
    globalElements.Select Radio Button By Value     Yes
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
    Submit enquiry form

    Page Should Contain         Form submitted
    Page Should Contain         Form submitted
    Page Should Contain         Your case number is
    Wait Until Element Is Visible     ${Case-number-element}
    ${Case-number}=     Get Text      ${Case-number-element}
    Length Should Be            ${Case-number}     8
   #  Perform multipart email verification   ${subject-text-Enquiry}  ${Body-text1}   ${Body-text2}   ${Body-text3}   ${Body-text4}
    Sleep   8s
    Go To Salesforce login
    Login as generalist agent to check DHO inputs

    Log to Console  ${case-number}
    Sleep   8s
    Open cases tab and select list view
    Reset View (if applicable)
  #  Open most recent case   ${case-type}    ${topic}
    Sleep   8s

    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   ${case-number}
    sleep   8s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']

    #   Account Name
    Page Should Contain     Firstname

#   Case Origin
    Page Should Contain     Online-Web
    page should contain     Enquiry
    page should contain     testtrace4@gmail.com
    page should contain     07766556677
    page should contain     relative
    page should contain     Web Name of affected person
    page should contain element   ${vaccinationstatus}
     page should contain     25/02/2021
    page should contain     12/12/2000
    page should contain     Sw1w 0ny
    Third Party Contact Text Should Be   Yes
    Affected Person Contact name Text Should Be  Alan Smithee

    ${testtypedisplayed}=   get text  ${Test-type}

    log to console  ${testtypedisplayed}

    should contain  ${testtypedisplayed}    PCR test

   # not in scope right now
   # ${testtakendisplayed}=  get text  ${Test-taken}
   #  log to console  ${testtakendisplayed}
   # should contain  ${testtakendisplayed}    Yes