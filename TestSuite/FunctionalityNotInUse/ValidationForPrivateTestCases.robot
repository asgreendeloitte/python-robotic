*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot

Resource    ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot
Resource    ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/PrivateTestProvider.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   Close Browser

*** Variables ***
# Generic variables
${booking-reference-info}       (//*[@class='slds-button slds-button_icon']/lightning-primitive-icon)[32]
${booking-reference-text-field}     //span[contains(text(), "Booking Reference" )]/../../input
${case-number-locator}      //div[contains(text(), "Your case number is" )]/div/div

*** Test Cases ***
#Test - Private Provider populate fields
#    [Tags]  TTCS20-3154-01
#
#    Login as Tier 1 Test Agent
#    #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
#    Reset View (if applicable)
#    Go To Cases Tab
#		Sleep  3s
#    Click Element   ${new-case-btn}
#    Click Drop Down By Name            Test Provider Type
#    Select Drop down option    Private provider
#    Click Drop Down By Name            Case Origin
#    Select Drop down option    Testing Enquiries Mailbox
#    Click Save
#    Sleep   2s
#    Page Should Contain     When Test Provider Type = Private Provider, you must also populate the Test Type, Country, and Private Provider Name OR Test Provider Not Listed fields.
#    Capture Page Screenshot
#
#Test - Private Provider populate fields - Closing case
#    [Tags]  TTCS20-3154-02
#
#    Login as Tier 1 Test Agent
#    #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
#    Reset View (if applicable)
#    Go To Cases Tab
#		Sleep  3s
#    Click Element   ${new-case-btn}
#    Click Drop Down By Name            Test Provider Type
#    Select Drop down option    Private provider
#    Click Drop Down By Name            Case Origin
#    Select Drop down option    Testing Enquiries Mailbox
#    Click Drop Down By Name            Test Type
#    Select Drop down option    PCR test
#    Click Drop Down By Name            Country
#    Select Drop down option     England
#    Input Text          ${PrivateProvider-lookup}   Test
#    Press Keys      ${PrivateProvider-lookup}   ENTER
#    Sleep   2s
#    Click Element       ${private-provider-option}
#    Input Text Field By Name      Booking Reference     abcde1234567
#    Click Drop Down By Name            Private Test package
#    Select Drop down option    Pre-departure
#    Click Drop Down By Name            Private Test Complaint Reason
#    Select Drop down option    Test not received
#    Click Save
#
#    Click Edit
#    Sleep   2s
#
#    Click Element       //span[@class='deleteIcon']
#    Sleep   2s
#    #Click Drop Down By Name            Country
#    #Sleep   2s
#    #click element   (//span[(text()= 'Country')]/../../../div/div/div/div/div/a)[2]/li[contains(text(),'--None--')]]
#    #click element   xpath://html/body/div[13]/div/ul/li[1]
#    Capture Page Screenshot
#    Click Drop Down By Name            Status
#    Select Drop down option    Closed
#    Click Save
#
#    #Scroll element into view    //*[@id="brandBand_2"]/div/div/div[1]/div/article/h2
#    Page Should Contain         When Test Provider Type = Private Provider, you must also populate the Test Type, Country, and Private Provider Name OR Test Provider Not Listed fields
#    Capture Page Screenshot
#
#Test - Private Provider populate fields - PCR Test
#    [Tags]  TTCS20-3154-03
#
#    Login as Tier 1 Test Agent
#    #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
#    Reset View (if applicable)
#    Go To Cases Tab
#		Sleep  3s
#    Click Element   ${new-case-btn}
#    Click Drop Down By Name            Test Provider Type
#    Select Drop down option    Private provider
#    Click Drop Down By Name            Test Type
#    Select Drop down option    PCR test
#    Click Drop Down By Name            Case Origin
#    Select Drop down option    Testing Enquiries Mailbox
#    Click Save
#    Sleep   2s
#    Page Should Contain     When Test Provider Type = Private Provider, you must also populate the Test Type, Country, and Private Provider Name OR Test Provider Not Listed fields.
#    Capture Page Screenshot

#Test - Private Provider populate fields - PCR Test - Closing Case
#    [Tags]  TTCS20-3154-04
#    Login as Tier 1 Test Agent
#    #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
#    Reset View (if applicable)
#    Go To Cases Tab
#		Sleep  3s
#    Click Element   ${new-case-btn}
#    Click Drop Down By Name            Test Provider Type
#    Select Drop down option    Private provider
#    Click Drop Down By Name            Case Origin
#    Select Drop down option    Testing Enquiries Mailbox
#    Click Drop Down By Name            Test Type
#    Select Drop down option    PCR test
#    Click Drop Down By Name            Country
#    Select Drop down option     England
#    Input Text          ${PrivateProvider-lookup}   Test
#    Press Keys      ${PrivateProvider-lookup}   ENTER
#    Sleep   2s
#    Click Element       ${private-provider-option}
#    Input Text Field By Name      Booking Reference     abcde1234567
#    Click Drop Down By Name            Private Test package
#    Select Drop down option    Pre-departure
#    Click Drop Down By Name            Private Test Complaint Reason
#    Select Drop down option    Test not received
#    Click Save
#
#    Click Edit
#    Sleep   2s
#
#    Click Drop Down By Name            Private Test package
#    Select Drop down option    --None--
#    Click Drop Down By Name            Status
#    Select Drop down option    Closed
#
#    Click Save
#    Sleep   2s
#
#    Page Should Contain     You must also populate the Booking Reference, Private Test Package, and Private Test Complaint Reason when the citizen is complaining about a private PCR or LFD test
#    Capture Page Screenshot

Test - Private Test Booking Reference Help Text
    [Tags]  TTCS20-3154-05
    Login as Tier 1 Test Agent
    #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Reset View (if applicable)
    Go To Cases Tab
		Sleep  3s
    Agent Creates Case with Case Type Complaint
    Log     ${booking-reference-info}
    Sleep   10s
    Execute javascript  window.scrollTo(0,1900)
    Sleep  5s
    #mouse over      ${booking-reference-info}
    click element       ${booking-reference-info}
    Sleep  4s

    Page Should Contain     The booking reference was given when the test was booked. It will include the first 5 letters of the providers name followed by 7 numbers. If it has not been provided by the citizen, enter the value AAAAA0000000.

#Test - Private Test Booking Reference Default
#    [Tags]  TTCS20-3154-06
#    Open Browser, Go To Digital Helper and Accept Cookies
#    Click Get Started
#    Select Case Type Radio Button     Complaint
#    Click Continue
#    Select Private Test Provider Radio Button
#    Click Continue
#    Sleep  6s
#    Click Continue
#    Sleep  4s
#    Select What test is your complaint about PCR Test
#    Click Continue
#    Select Country test delivered to as England
#    Click Continue
#    Sleep  4s
#    Select Type of Test complaint Day2 Radio button
#    Click Continue
#    Sleep  4s
#    Private Test Provider Name
#    Click Continue
#    Sleep  5s
#    Select No Radio button booking reference number
#    Click Continue
#    Sleep  3s
#    Select Other Radio button Reason for Complaint
#    Click Continue
#    Sleep  2s
#    Page Should Contain  Randox
#    Page Should Contain  Other
#
#    Input Contact Name (Long Form)     Name
#    Input Email Address (Long Form)    email@email.com
#
##   Input Phone Number (Long Form)      ${phone}
#
#    Input Message (Long Form)       Message
#    Sleep   2s
#    Click Send   Complaint
#    wait until page contains    Form submitted
#    Sleep   10s
#    ${case-number}=     get text    ${case-number-locator}
#    Log     ${case-number}
#    Capture page screenshot
#
#    Go To Salesforce login
#    Login as E&C Central Agent
#    Sleep   5s
#    #Go to cases tab
#    Open cases tab and select list view
#    Sleep   3s
#    Click Element   ${global-search}
#    sleep   3s
#    Click Element   //*[@placeholder='Search Cases and more...']
#    Input Text      //*[@placeholder='Search Cases and more...']        ${case-number}
#    sleep   3s
#    PRESS KEYS  None   ENTER
#    sleep  3s
#    Click Element   //a[text()='${case-number}']
#    Sleep   3s
#    Execute javascript  window.scrollTo(0,1300)
#    Sleep   10s
#    page should contain     AAAAA0000000
#    capture page screenshot