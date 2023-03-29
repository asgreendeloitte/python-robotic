*** Settings ***
# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LandingPage.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/CaseType.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/Topic.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/Enquiry/Answers.robot

#Short Form page
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/ShortForm.robot

# Long Form Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/TestTaken.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/TypeOfTestingService.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/TestCountry.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/TestLocation.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/LongForm.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Pages/LongForm/PrivateTestProvider.robot

*** Keywords ***
Complete Short Form User Flow
    [Arguments]  ${flow-type}=0   ${case-type}=Feedback  ${topic}=Stay at home support    ${question}=optional     ${sub-question}=optional      ${sub-question-2}=optional    ${name}=Android Amy     ${email}=amy@test.com   ${message}=The quick brown fox jumps over the lazy dog.
    Go To Digital Helper
    Click Get Started
    Select Case Type Radio Button     ${case-type}
    Click Continue
    Select Topic Radio Button   ${topic}
    Click Continue
    Enter Enquiry details (switch)  ${flow-type}    ${question}     ${sub-question}     ${sub-question-2}
    Input Contact Name   ${name}
    Input Email Address  ${email}
    Input Message    ${message}
    sleep   5s
    Click Send   ${case-type}

Complete Long Form User Flow
    [Arguments]  ${flow-type}=0     ${case-type}=Feedback  ${question}=optional     ${sub-question}=optional    ${test-type}=PCR test    ${name}=Android Amy     ${email}=amy@test.com  ${phone}=+441234567890   ${message}=The quick brown fox jumps over the lazy dog.
    Go To Digital Helper
    Click Get Started
    Select Case Type Radio Button     ${case-type}
    Click Continue
    Select Symptoms And Testing Radio Button
    Click Continue
    Enter Enquiry details (switch)  ${flow-type}    ${question}     ${sub-question}
    Select Radio Button By Value    ${test-type}
    Click Continue
    Input Day (Long Form)               25
    Input Month (Long Form)             12
    Input Year (Long Form)              2020
    Click Continue
    Input Test Barcode (IA Form)        ABC12345678
    Click Continue
    Click Element                       ${YesRadioButton}
    Input Day (Long Form)               31
    Input Month (Long Form)             3
    Input Year (Long Form)              1980
    Click Continue
    Sleep   3s
    Click Element                       ${YesRadioButton}
    Click Continue
    Input Home Address of person who took the test
    Click Continue
    Select Myself Radio Button (Long Form)
    Input Contact Name (Long Form)     ${name}
    Input Email Address (Long Form)    ${email}
    Input Phone Number (Long Form)      ${phone}
    Input Message (Long Form)       ${message}
    sleep   2s
    Click Send   ${case-type}



Complete Long Form User Someone else Flow
    [Arguments]  ${flow-type}=0     ${case-type}=Feedback  ${question}=optional     ${sub-question}=optional    ${test-type}=PCR test    ${name}=Android Amy     ${email}=amy@test.com  ${phone}=+441234567890   ${message}=The quick brown fox jumps over the lazy dog.
    Go To Digital Helper
    Click Get Started
    Select Case Type Radio Button     ${case-type}
    Click Continue
    Select Symptoms And Testing Radio Button
    Click Continue
    Enter Enquiry details (switch)  ${flow-type}    ${question}     ${sub-question}
    Select Radio Button By Value    ${test-type}
    Click Continue
    Input Day (Long Form)               25
    Input Month (Long Form)             12
    Input Year (Long Form)              2020
    Click Continue
    Input Test Barcode (IA Form)        ABC12345678
    Click Continue
    Click Element                       ${YesRadioButton}
    Input Day (Long Form)               31
    Input Month (Long Form)             3
    Input Year (Long Form)              1980
    Click Continue
    Sleep   3s
    Click Element                       ${YesRadioButton}
    Click Continue
    Input Home Address of person who took the test
    Click Continue
    #Select Myself Radio Button (Long Form)
    Select Someone Else Radio Button (Long Form)
    Input Contact Name (Long Form)     ${name}
    Input Email Address (Long Form)    ${email}
    Input Phone Number (Long Form)      ${phone}
    Input Message (Long Form)       ${message}
    sleep   2s
    Click Send   ${case-type}



Complete Staying at home Long Form User Flow
    [Arguments]   ${case-type}=Enquiry  ${question}=optional     ${sub-question}=optional     ${name}=Android Amy     ${email}=amy@test.com  ${phone}=+441234567890   ${message}=The quick brown fox jumps over the lazy dog.
    Go To Digital Helper
    Click Get Started
    Select Case Type Radio Button     ${case-type}
    Click Continue
    Select Staying at home Radio Button
    Click Continue
    Select topic and check the page     ${question}     ${sub-question}
    Input Contact Name (Long Form)     ${name}
    Input Email Address (Long Form)    ${email}
    Input Message (Long Form)       ${message}
    sleep   2s
    Click Send   ${case-type}


Select topic and check the page
    [Arguments]     ${question}     ${sub-question}
     Run Keyword If  '${question}' == 'I have COVID-19 and want to know when to stay at home and what to do'
    ...  Submit enquery to I have COVID-19
     Run Keyword If  '${question}' == 'I was in contact with someone who tested positive for coronavirus (COVID-19)'
    ...     Submit enquery to I was in contact with someone
     Run Keyword If  '${question}' == 'I have a question about self-isolation payments'
    ...     Submit enquery to I have a question
     Run Keyword If  '${question}' == 'I need stay at home support for myself or someone I care for'
    ...     Submit enquery to I need to stay at home    ${sub-question}
     Run Keyword If  '${question}' == 'My enquiry is not listed here'
    ...     Submit enquery to my enquery is not listed

Submit enquery to I have COVID-19
    Select Radio Button By Value    I have COVID-19 and want to know when to stay at home and what to do
    Click Continue
    sleep   1s
    Page should contain     I have COVID-19 and want to know when to stay at home and what to do
    Page should contain  Read the guidance for people with COVID-19 and their contacts (opens in new window).
    Page should contain     When to stay at home if you have COVID-19 (opens in new window).
    Page should contain      Find out about support in your local area (opens in new window).
    Click Submit A Form

Submit enquery to I was in contact with someone
    Select Radio Button By Value    I was in contact with someone who tested positive for coronavirus (COVID-19)
    Click Continue
    sleep   1s
    Page should contain     I was in contact with someone who tested positive for coronavirus (COVID-19)
    Page should contain  Read the guidance for people with COVID-19 and their contacts (opens in new window).
    Page should contain      When to stay at home if you have COVID-19 (opens in new window).
    Page should contain      Find out about support in your local area (opens in new window).
    Click Submit A Form

Submit enquery to I have a question
     Select Radio Button By Value   I have a question about self-isolation payments
     Click Continue
     Page should contain   Find out how to get financial support if  you have been asked to self-isolate (opens in new window)
     Click Submit A Form

Submit enquery to my enquery is not listed
    Select Radio Button By Value    My enquiry is not listed
    sleep   1s
    Click Continue


Submit enquery to I need to stay at home
     [Arguments]    ${sub-question}
     Page should contain   I need stay at home support for myself or someone I care for

     Run Keyword If  '${sub-question}' == 'I need financial support'
    ...  Submit enquery to I need financial support
     Run Keyword If  '${sub-question}' == 'I need help getting food and other essentials'
    ...     Submit enquery to I need help getting food and other essentials
     Run Keyword If  '${sub-question}' == 'I need wellbeing and mental health support for myself or someone else'
    ...     Submit enquery to I need wellbeing and mental health support for myself or someone else
     Run Keyword If  '${sub-question}' == 'I need support because I do not feel safe at home'
    ...     Submit enquery to I need support because I do not feel safe at home
     Run Keyword If  '${sub-question}' == 'My concern is not listed here'
    ...     Submit enquery to My concern is not listed here

Submit enquery to I need financial support
     Select Radio Button By Value   I need financial support
     Click Continue
     Page should contain    I need financial support
     Page should contain  Find out how to get financial support if you have been asked to self-isolate (opens in new window).
     Click Submit A Form

Submit enquery to I need help getting food and other essentials
     Select Radio Button By Value   I need help getting food and other essentials
     Click Continue
     Page should contain    I need help getting food and other essentials
     Page should contain  Your local council may be able to provide assistance.
     Page should contain  NHS Volunteer Responders also offer local support for deliveries and wellbeing check-ins.
     Click Submit A Form

Submit enquery to I need wellbeing and mental health support for myself or someone else
     Select Radio Button By Value   I need wellbeing and mental health support for myself or someone else
     Click Continue
     Page should contain    I need wellbeing and mental health support for myself or someone else
     Select Radio Button By Value   Myself
     Click Continue
     sleep   1s
     Click Submit A Form

Submit enquery to I need support because I do not feel safe at home
     Select Radio Button By Value   I need support because I do not feel safe at home
     Click Continue
     Page should contain   Available support
     Page should contain  Specialist support
     Page should contain  Need more help?
     Click Submit A Form

Submit enquery to My concern is not listed here
    Select Radio Button By Value    My concern is not listed here
    sleep   1s
    Click Continue

Complete International Travel Long Form User Flow
    [Arguments]  ${flow-type}=1     ${case-type}=Enquiry  ${question}=My enquiry is not listed    ${traffic-light}=Red list country      ${test-type}=A test from a private test provider    ${name}=Android Amy     ${email}=amy@test.com   ${message}=The quick brown fox jumps over the lazy dog.     ${phone}=+441234567890
    Go To Digital Helper
    Click Get Started
    Select Case Type Radio Button     ${case-type}
    Click Continue
    Select International Travel Radio Button
    Click Continue
    Enter Enquiry details (switch)  ${flow-type}    ${question}
    Select Radio Button By Value    Yes, I have taken a test
    sleep   1s
    Click Continue
    Select Radio Button By Value    ${traffic-light}
    sleep   1
    Click Continue
    Select Radio Button By Value    ${test-type}
    Click Continue
    sleep   1s
    Click Submit a form IA flow(if applicable)  ${test-type}  # does not equal CTM
    sleep   1s
    Input Hotel Details(if applicable)  ${traffic-light}  # equals red listed country
    sleep   2s
    Input Day (Long Form)               25
    Input Month (Long Form)             05
    Input Year (Long Form)              2021
    sleep   2s
    Click Continue
    sleep   2
    Input Day (Long Form)               26
    Input Month (Long Form)             05
    Input Year (Long Form)              2021
    sleep   2s
    Click Continue
    Input Test Barcode (IA Form)        ABC12345678
    sleep   2s
    Click Continue
    sleep   3s
    Page Should Contain     ABC12345678
    Input Contact Name (Long Form)      ${name}
    Input Email Address (Long Form)     ${email}
    Input Phone Number (Long Form)      ${phone}
    Input Message (Long Form)           ${message}
    sleep   2
    Click Send Enquiry

Complete Test form for PTM
    [Arguments]  ${flow-type}=0     ${case-type}=Complaint   ${name}=Android Amy     ${email}=amy@test.com  ${phone}=+441234567890   ${message}=The quick brown fox jumps over the lazy dog.
        Go To Digital Helper
        Click Get Started
        Select Case Type Radio Button     ${case-type}
        Click Continue
        Select Private Test Provider Radio Button
        Click Continue
        Sleep  6s
        Click Continue
        Sleep  4s
        Select What test is your complaint about PCR Test
         Click Continue
        Select Country test delivered to as England
        Click Continue
         Sleep  4s
        Select Type of Test complaint Day2 Radio button
        Click Continue
        Sleep  4s
        Private Test Provider Name
        Click Continue
        Sleep  5s
        Select Yes Radio button booking reference number
        Click Continue
        Sleep  3s
        Select Other Radio button Reason for Complaint
        Click Continue
        Sleep  2s
        Page Should Contain  Randox
        Page Should Contain  Other

        Input Contact Name (Long Form)     ${name}
        Input Email Address (Long Form)    ${email}

#        Input Phone Number (Long Form)      ${phone}

        Input Message (Long Form)       ${message}
        sleep   2s
        Click Send   ${case-type}

Complete Test form for PTM search
    [Arguments]  ${flow-type}=0     ${case-type}=Complaint   ${name}=Android Amy     ${email}=amy@test.com  ${phone}=+441234567890   ${message}=The quick brown fox jumps over the lazy dog.
        Go To Digital Helper
        Click Get Started
        Select Case Type Radio Button     ${case-type}
        Click Continue
        Select Private Test Provider Radio Button
        Click Continue
        Capture Page Screenshot
        Sleep  6s
        Page Should Contain     If your complaint is about a travel test provided by
        Page Should Contain Link    NHS UKHSA (opens in new window)
        Page Should Contain     go back to the
        Page Should Contain     What is your complaint about?
        Page Should Contain     page and select
        Page Should Contain     International travel
        Page Should Contain     or call 119.
        Click Link  //a[@href="https://book-travel-test-enter-uk.service.gov.uk/"]
        Sleep   3s
        Capture Page Screenshot
        Switch Window
        Sleep  2s
        Click Continue
        Sleep  4s
        Select What test is your complaint about Rapid Lateral Flow
         Click Continue
        Click Continue
        Capture Page Screenshot
        Select Country test delivered to as Scotland
        Select Country test delivered to as Wales
        Select Country test delivered to as Northern Ireland
        Select Country test delivered to as England
        Click Continue
        Select Type of Test complaint Day2 Radio button
        Click Continue
        Sleep  4s
        Private Test Provider Name AutoSearch
        Click Continue
        Sleep  5s
        Select Yes Radio button 13 character booking reference number
        Click Continue
        Capture Page Screenshot
        Sleep  5s
        Select Yes Radio button booking reference number
        Click Continue
        Sleep  3s
        Select Other Radio button Reason for Complaint
        Click Continue
        Sleep  2s
        Page Should Contain  Randox
        Page Should Contain  Other

        Input Contact Name (Long Form)     ${name}
        Input Email Address (Long Form)    ${email}

#        Input Phone Number (Long Form)      ${phone}

        Input Message (Long Form)       ${message}
        sleep   2s
        Click Send   ${case-type}


Click Submit a form IA flow(if applicable)
    [Arguments]  ${test-type}
    Run Keyword If  '${test-type}' != 'Corporate Travel Management (CTM)'
    ...     Click Submit A Form

Input Hotel Details(if applicable)
    [Arguments]  ${traffic-light}
    Run Keyword If  '${traffic-light}' == 'Red list country'
    ...     Input Hotel Details

Input Hotel Details
    Click My hotel is not listed here
    Input Hotel Name        Ibis
    Input Hotel Street      Shepherd Road
    Input Hotel Town        Stoke
    Input Hotel Postcode    ST11BS
    Sleep   1s
    Click Continue

Enter Enquiry details (switch)
    [Arguments]  ${flow-type}   ${question}=optional     ${sub-question}=optional   ${sub-question-2}=optional

    Log     ${flow-type}, ${question}, ${sub-question}, ${sub-question-2}

    Run Keyword If  '${flow-type}' != '0'       Select Question      ${question}

    Run Keyword If  '${flow-type}' == '1'       Log     No extra steps needed

    Run Keyword If  '${flow-type}' == '2'       Click Submit A Form

    Run Keyword If  '${flow-type}' == '3'       Select Question     ${sub-question}

    Run Keyword If  '${flow-type}' == '4'
    ...     Run Keywords
    ...     Select Question     ${sub-question}
    ...     AND     Click Submit A Form

    Run Keyword If  '${flow-type}' == '5'
    ...     Run Keywords
    ...     Click Submit A Form
    ...     AND     Select Question     ${sub-question}

    Run Keyword If  '${flow-type}' == '6'
    ...     Run Keywords
    ...     Select Question     ${sub-question}
    ...     AND     Select Question     ${sub-question-2}
    ...     AND     Click Submit A Form

    Run Keyword If  '${flow-type}' == '7'
    ...     Run Keywords
    ...     Click Submit A Form

Select Question
    [Arguments]  ${sub-question}
    Select Radio Button By Value    ${sub-question}
    sleep   1s
    Click Continue


Complete Short Form User Flow with DAC Error Messages
    [Arguments]  ${flow-type}=0   ${case-type}=Feedback  ${topic}=Stay at home support    ${question}=optional     ${sub-question}=optional      ${sub-question-2}=optional    ${name}=Android Amy     ${email}=amy@test.com   ${message}=The quick brown fox jumps over the lazy dog.
    Go To Digital Helper
    Click Get Started
    sleep  4s
    Click Continue
    Sleep   3s
    ${ErrorMessageNotified}=  Get Text    ${ErrorMessagecaptured}
    Log to Console    ${ErrorMessageNotified}
    Should Not Contain  ${ErrorMessageNotified}   Please
    Sleep  3s
    Select Case Type Radio Button     ${case-type}
    Click Continue
    Sleep  4s
    Click Continue
    ${ErrorMessageNotified1}=  Get Text    ${ErrorMessagecaptured1}
    Log to Console    ${ErrorMessageNotified1}
    Should Not Contain Any   ${ErrorMessageNotified1}   Please
    sleep  3s
    Select Topic Radio Button   ${topic}
    Click Continue
    Enter Enquiry details (switch)  ${flow-type}    ${question}     ${sub-question}     ${sub-question-2}
    Input Contact Name   ${name}
    Input Email Address  ${email}
    Input Message    ${message}
    sleep   5s
    Click Send   ${case-type}

Complete Long Form User Flow for Help With Home Test Kit
    [Arguments]  ${flow-type}=0     ${case-type}=Feedback  ${question}=optional     ${sub-question}=optional    ${test-type}=PCR test    ${name}=Android Amy     ${email}=amy@test.com  ${phone}=+441234567890   ${message}=The quick brown fox jumps over the lazy dog.
    Go To Digital Helper
    Click Get Started
    Select Case Type Radio Button     ${case-type}
    Click Continue
    Select Symptoms And Testing Radio Button
    Click Continue

    Enter Enquiry details (switch)  ${flow-type}    ${question}     ${sub-question}

Check Digital Helper Start Page
    Page Should Contain     Get help with coronavirus (COVID-19) enquiries and complaints
    Page Should Contain     Use this service for advice, guidance and help with NHS Test and Trace.

    Page Should Contain     You can:

    Page Should Contain     make an enquiry
    Page Should Contain     For example, get the latest guidance on staying at home.

    Page Should Contain     give feedback
    Page Should Contain     For example, share your experience of taking a COVID-19 test.

    Page Should Contain     make a complaint
    Page Should Contain     For example, share a poor experience with the service.

    Page Should Contain     If you have not found what you are looking for, you may submit a form.
    Page Should Contain     Enquiries are responded to within 3 working days and complaints are responded to within 20 working days.

    Page Should Contain     Advice in other parts of the UK

    Page Should Contain     Most of the information on this website applies to England only. The NHS
    page should contain     COVID-19 app is available to anyone living in England and Wales. This means
    Page should contain     people in Wales can also get help with the app here.

    Page Should Contain Link    Scotland - COVID-19(opens in new window).
    Page Should Contain Link    Wales - COVID-19(opens in new window).
    Page Should Contain Link    Northern Ireland - COVID-19(opens in new window).

    Page Should Contain     Before you start

    Page Should Contain     We may ask you for:

    Page Should Contain     your name, date of birth or address
    Page Should Contain     details about the COVID-19 test you have taken
    Page Should Contain     your arrival or departure date if you are travelling abroad

    Page Should Contain     If it is hard for you to do things online or if your enquiry needs an immediate response, you can call 119.
    Page Should Contain     119 opening times:
    Page Should Contain     8am to 6pm, Monday to Friday
    Page Should Contain     9am to 1pm, Saturday and Sunday


#    Page Should Contain     8am to 8pm for trace related enquiries
#    Page Should Contain     For example, stay at home advice
#
#    Page Should Contain     7am to 11pm for test related enquires and other related matters
#    Page Should Contain     For example, booking a test

Check I have not recieved my test result page
    [Arguments]  ${flow-type}=0     ${case-type}=Enquiry
    Go To Digital Helper
    Click Get Started
    Select Case Type Radio Button     ${case-type}
    Click Continue
    Select Symptoms And Testing Radio Button
    Click Continue
    Select Radio Button By Value    I have not received my test result
    Click Continue
    Capture Page Screenshot

    Page Should Contain     Details we need

    Page Should Contain     To investigate a delayed test result we will need the test barcode,
    Page Should Contain     date of birth and home address of the person that took the test.
    Page Should Contain     If you are unable to provide these details please call 119.

    Page Should Contain     How long it takes to get your coronavirus test result depends on the type of test you had.

    Page Should Contain     Please ensure you have waited the appropriate amount of time before contacting us about a delayed test result.
    Page Should Contain Link     Find out how long you should wait after taking an LFD or PCR test before contacting us (opens in new window).

    Page Should Contain     When you did your test,
    Page Should Contain     you may have been asked to register it.
    Page Should Contain     You may need to
    Page Should Contain Link    register your test kit (opens in a new window)
    Page Should Contain     if this has not been done.

    Page Should Contain     Need more help?

    Page Should Contain     If you need more help you can submit a form.
    Page Should Contain     We will respond to your message within 3 working days.
    Page Should Contain     If your enquiry needs an immediate response,
    Page Should Contain     you can call 119.

Check Testing when Travelling Policy
    [Arguments]  ${flow-type}=0     ${case-type}=Enquiry
    Go To Digital Helper
    Click Get Started
    Select Case Type Radio Button     ${case-type}
    Click Continue
    Select Symptoms And Testing Radio Button
    Click Continue
    Select Radio Button By Value    I have an enquiry about testing when travelling
    Click Continue
    Capture Page Screenshot

Check International Travel Testing when Travelling Policy
    [Arguments]  ${flow-type}=0     ${case-type}=Enquiry
    Go To Digital Helper
    Click Get Started
    Select Case Type Radio Button     ${case-type}
    Click Continue
    Select International Travel Radio Button
    Click Continue
    Select Radio Button By Value    Testing when travelling
    Click Continue
    Capture Page Screenshot

Click go back
    Click Element   xpath://u[text()='Go back']
