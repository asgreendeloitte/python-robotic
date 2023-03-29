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
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/intnlTravel.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Variables ***
${testing-for-care-home}            //span[contains(text(),'Testing for care homes')]
${travel-to}                        //span[contains(text(),'Travel to England')]
${work-place}                       //h1[@id='workplace,-organisation-or-care-home-guidance']
${app-works}                        //*[@id="what-the-app-does-and-how-it-works"]
${about-your-nhs-accout}            (//a[@class='nhsuk-breadcrumb__link'])[2]
${what-the-app-does}                 //button[@id='what-the-app-does-and-how-it-works-header']
${app-does-link}                     //*[@id="what-the-app-does-and-how-it-works-details"]/p[1]/a
${app-does-link2}                    //*[@id="what-the-app-does-and-how-it-works-details"]/p[2]/a
${nhs-app-new-link}                  //a[contains(text(),'NHS App (opens in new window).')]
${see-all-topics}                   //a[@id='see-all-topics']
${settingup-the-app}                //a[contains(text(),'Using and setting up the app')]
${settingup-app-link}               //button[@id='using-and-setting-up-the-app-header']
${go-back}                          //*[@id="backLink"]
${Nhs-covid-app}                    //a[contains(text(),'The NHS COVID-19 app')]
${troubleshootinglink}              //*[contains(text(),'Troubleshooting and technical information')]
${troubleshoot+link}                //button[@id='troubleshooting-and-technical-information-header']
${Data-privacy}                       //*[contains(text(),'Data and privacy')]
${Data-privacy-link}                //button[@id='data-and-privacy-header']


*** Test Cases ***
Testing NHS Covid-19 app Someone else navigation
    [Tags]  TTCS20-4047     TTCS20-5839-02
    Go To Digital Overhaul
   # click on the get help link
    Sleep  2s
    click element  ${see-all-topics}
    #Get help and make an enquiry about the topic     5
    page should contain   Search by topic
    page should contain  See all topics
    page should contain   Using and setting up the app
    page should contain   What the app does and how it works
    page should contain   Troubleshooting and technical information
    page should contain   Data and privacy
    click element    ${settingup-the-app}
    page should contain   The NHS COVID-19 app will close down on 27 April 2023
    page should contain   All the app features will be working until that date.
    page should contain   Even though the app is closing down, please follow the latest guidance to protect yourself and others.
    page should contain   This includes reporting NHS lateral flow test results on GOV.UK. If you're eligible for COVID-19 treatment, you must report your result so the NHS can contact you about treatment.
    Page Should Contain   Read more about why the app is closing down on GOV.UK
    page should contain   Using and setting up the app
    page should contain   Use the links to find information on using and setting up the app. If you need more help, you can make an enquiry.
    page should contain   The app is available to anyone living in England and Wales. This means people in Wales can also get help with the app here.
    page should contain element   ${settingup-app-link}
    click element   ${settingup-app-link}
    page should contain link   Find out who can use the app (opens in new window).
    page should contain link   Find out how to use the app (opens in new window).
    page should contain link   Find out how to download and set up the app (opens in new window).
    page should contain    The NHS App
    page should contain    View your health record
    page should contain    Get your NHS COVID pass
    page should contain    Order repeat prescriptions
    page should contain    Need more help? Make an enquiry
    page should contain    If you need more help you can contact NHS Test and Trace by making an enquiry. We will respond within 3 working days. If you would prefer to speak to someone directly, call 119.
    Click Submit form
    page should contain   Who are you completing this form for?
    Select someone else Radio Button
    page should contain   If you are completing this form for someone else, you must be able to answer detailed questions on their behalf.
    Click Continue on the page

    Page should contain    Tell us about the person you're completing this form for
    click element           ${go-back}
    sleep  3s
    click element           ${go-back}
    page should contain    Using and setting up the app
    click element           ${Nhs-covid-app}
    sleep  3s
    page should contain    The NHS COVID-19 app
    click element   ${troubleshootinglink}
    sleep  3s
    page should contain   The NHS COVID-19 app will close down on 27 April 2023
    page should contain   All the app features will be working until that date.
    page should contain   Even though the app is closing down, please follow the latest guidance to protect yourself and others.
    page should contain   This includes reporting NHS lateral flow test results on GOV.UK. If you're eligible for COVID-19 treatment, you must report your result so the NHS can contact you about treatment.
    Page Should Contain   Read more about why the app is closing down on GOV.UK
    page should contain   Troubleshooting and technical information
    page should contain element  ${troubleshoot+link}
    click element   ${troubleshoot+link}
    page should contain link  Get help troubleshooting and technical information about the app (opens in new window).
    Click Submit form
    page should contain   Who are you completing this form for?
#    page should contain   We will now ask for details about your enquiry.

    Select someone else Radio Button
    page should contain   If you are completing this form for someone else, you must be able to answer detailed questions on their behalf.
    Click Continue on the page
    Page should contain    Tell us about the person you're completing this form for
    click element           ${go-back}
    sleep  6s
    click element           ${go-back}
    page should contain    Troubleshooting and technical information
    click element           ${Nhs-covid-app}
    sleep  3s
    page should contain    The NHS COVID-19 app
    click element   ${Data-privacy}
    sleep  3s
    page should contain   The NHS COVID-19 app will close down on 27 April 2023
    page should contain   All the app features will be working until that date.
    page should contain   Even though the app is closing down, please follow the latest guidance to protect yourself and others.
    page should contain   This includes reporting NHS lateral flow test results on GOV.UK. If you're eligible for COVID-19 treatment, you must report your result so the NHS can contact you about treatment.
    Page Should Contain   Read more about why the app is closing down on GOV.UK
    page should contain   Data and privacy
    page should contain element  ${Data-privacy-link}
    click element   ${Data-privacy-link}
    page should contain link   Information about data and privacy (opens in new window).
    Click Submit form
    page should contain   Who are you completing this form for?
    Select someone else Radio Button
    page should contain   If you are completing this form for someone else, you must be able to answer detailed questions on their behalf.
    Click Continue on the page

    Page should contain    Tell us about the person you're completing this form for
    click element           ${go-back}
    sleep  3s
    click element           ${go-back}
    page should contain    Data and privacy
    click element           ${Nhs-covid-app}
    sleep  3s
    page should contain    The NHS COVID-19 app
    click element  ${app-works}
    page should contain   What the app does and how it works
    page should contain   Use the links to find information on what the app does and how it works. If you need more help, you can make an enquiry.
    page should contain   The app is available to anyone living in England and Wales. This means people in Wales can also get help with the app here.
    page should contain   We can help you with enquiries about the NHS COVID-19 app. The app includes a number of features to protect you, including contact tracing and a symptoms checker.
    click element    ${what-the-app-does}
    page should contain link   Find out what the app does (opens in new window).
    page should contain link   Find out how the app works (opens in new window).
    sleep  4s
    Click Submit form
    page should contain   Who are you completing this form for?
    Select someone else Radio Button
    page should contain   If you are completing this form for someone else, you must be able to answer detailed questions on their behalf.
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
    Submit enquiry form

    Page Should Contain         Form submitted
    Page Should Contain         Form submitted
    Page Should Contain         Your case number is
    Wait Until Element Is Visible     ${Case-number-element}
    ${Case-number}=     Get Text      ${Case-number-element}
    Length Should Be            ${Case-number}     8
















