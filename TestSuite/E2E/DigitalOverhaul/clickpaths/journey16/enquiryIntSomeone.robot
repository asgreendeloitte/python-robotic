*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
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

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

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
${Test-taken}       (//*[@class='slds-form-element__control'])[30]
${Relation-type}    //lightning-formatted-text[contains(text(),'Other')]
${other-input}      //input[@id='other-input-text']



*** Test Cases ***
Journey 16 - International Travel - Enquiry - Someone else - Click path
    [Tags]  TTCS20-3514     TTCS20-2109-07    TTCS20-4320
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Click international travel topic
    page should contain     International travel

    Select travelling abroad during COVID-19
    Click Submit form
    Sleep  2s

    Select someone else Radio Button
    Sleep       2s
    Page should contain element     ${someone-else-text}
    Page should contain     If you are completing this form for someone else, you must be able to answer detailed questions on their behalf.
    Click Continue on the page
    Page should contain  Tell us about the person you're completing this form for
    Input their First Name    Test
    Input their Last Name    last
    Input their Date Of Birth   01  01  2000
    Click Continue on the page

    What is your relationship to this person    4
    input text   ${other-input}   other test person

    Click Continue on the page
    Page should contain     Have they arrived in the UK from abroad?
    globalElements.Select Radio Button By Value    Yes
    Input the day was the test taken    25  02  2021
    Click Continue on the page

    Page should contain     Are they fully vaccinated?
    globalElements.Select Radio Button By Value    Yes
    Click Continue on the page

    Enter details in text area  test
    Click Continue on the page

    Input your First Name   Test
    Input your Last Name    Last
    Input your mobile phone number (Optional)   077556644553
    Click Continue on the page

    Enter email address     testtrace4@gmail.com
    Confirm email address   testtrace4@gmail.com
    Click Continue on the page
    Submit enquiry form

    Page Should Contain         Form submitted
    Page Should Contain         Your case number is
    Wait Until Element Is Visible     ${Case-number-element}
    ${Case-number}=     Get Text      ${Case-number-element}
    Length Should Be            ${Case-number}     8


     Sleep  8s

    Go To Salesforce login
    Login as dhqa Test Agent

    Log to Console  ${case-number}
    Sleep   8s
    Open cases tab and select list view
#    Open most recent case   ${case-type}    ${topic}
    Sleep   8s

    Click Element   ${global-search}
    sleep   3s
    Click Element   (//input[@type='search'])[last()]
    Input Text      (//input[@type='search'])[last()]   ${case-number}
    sleep   3s
    PRESS KEYS  None   ENTER
    sleep  5s
    Click Element   //a[text()='${case-number}']

    #   Account Name
    Page Should Contain     Test Last

#   Case Origin
    Page Should Contain     Online-Web
    page should contain     Enquiry
    page should contain     testtrace4@gmail.com
    page should contain     077556644553
    page should contain     International travel
    page should contain     25/02/2021
    page should contain element  ${Relation-type}
    page should contain     other test person

   # page should contain element   ${vaccinationstatus}

#    ${testtypedisplayed}=   get text  ${Test-type}
#
#    log to console  ${testtypedisplayed}
#
#    should contain  ${testtypedisplayed}    PCR test
