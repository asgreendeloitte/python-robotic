*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot

Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser

*** Variables ***
${get-result}            //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/test-results/how-you-get-your-test-result/"]
${reg-kit}               //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/register-a-test-kit/"]

*** Test Cases ***

Find a test result - Receiving your test result
    [Tags]      TTCS20-2204
    Click covid-19 testing topic
    Find a test result for covid-19 testing
    Click receiving your test result
    click link  ${get-result}
    Sleep   2s
    Switch Window   new
    Page should contain     Test results for COVID-19 and how to report them
    Switch Window   main
    click link  ${reg-kit}
    Sleep   2s
    Switch Window   new
    Page should contain     Test results for COVID-19 and how to report them
    Switch Window   main
    Click Start Again
    Find a test result for covid-19 testing
    Click Submit form
    Page should contain     Who are you completing this form for?

Covid19 Enquiry- Find a test result - Enter your home address
    [Tags]      TTCS20-3382     TTCS20-2212     TTCS20-3394
    Go To Digital Overhaul
    click on the get help link
    Click covid-19 testing topic
    Find a test result for covid-19 testing
    Click Submit form
    Page should contain     Who are you completing this form for?
    Select myself Radio Button
    Click Continue on the page
    globalElements.Select Radio Button By Value    PCR test
    Click Continue on the page
    globalElements.Select Radio Button By Value    Yes
    Click Continue on the page
    Input the day was the test taken    25  02  2020
    Click Continue on the page

    Click where can I find the test barcode link
    Page Should Contain    This is the series of 3 letters followed by 8 numbers given to the person who took the test at the test centre, or on the bottom of the return box of the home test kit.
#    element should be visible   ${test-barcode-text-elem}

    Click Continue on the page
    Page should contain     Select yes if you know the test barcode

    globalElements.Select Radio Button By Value     Yes-barcode
    Input the test barcode      AB12345678
    Click Continue on the page
    Page should contain     Test barcode must contain 3 letters and 8 numbers

    globalElements.Select Radio Button By Value     No-barcode
    Click Continue on the page
    Page should contain    What mobile phone number was used to book the test?
    Click GoBack

    globalElements.Select Radio Button By Value     Yes-barcode
    Input the test barcode      ABC12345678
    Click Continue on the page

    Input the mobile phone number was used to book the test     +447700900982
    Click Continue on the page
    Input the day of your birth     12  12  2000
    Click Continue on the page

    Page should contain    Enter your home address
    Click Continue on the page
    Page should contain     Enter postcode

    Input the postcode      SW1W 0NY
    Click Continue on the page

    Page should contain     Enter your home address
    Click Continue on the page
    Page should contain     Select an address

    Select address from the Drop down
    Click Continue on the page
    Page should contain     Are you fully vaccinated?

   # Click GoBack
   # Click GoBack
  #  Page should contain    Enter your home address
  #  Input the postcode      IM9 4AA
  #  Click Continue on the page
  #  Click I can't find my address in the list
  #  Page should contain     Enter your home address

    Page should contain     Are you fully vaccinated?
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

     Page should contain       Check your answers before submitting your enquiry

     Click Change button to change the email address
     Change email address    testtrace5@gmail.com
     Confirm changed email address    testtrace5@gmail.com
     Click Continue on the page

     Page should contain     Check your answers before submitting your enquiry
     Page should contain     Completing form for
     Page should contain     Type of test
     Page should contain     For International travel
     Page should contain     Date of test
     Page should contain     Barcode number
     Page should contain     Mobile phone
     Page should contain     Your date of birth
     Page should contain     Home address
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


