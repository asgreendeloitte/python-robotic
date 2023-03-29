*** Variables ***
${self-isolation-support}        //h4[@id="self-isolation-support"]
${covid-19-testing}              //h4[@id="covid-19-testing"]
${workplace-carehome-guidance}   //h4[@id="workplace,-organisation-or-care-home-guidance"]
${report-test-result}            //h3[@id="report-a-test-result"]
${reporting-your-test-result}    //button[@id='reporting-your-test-result-header']
${receiving-your-test-result}    //button[@id='receiving-your-test-result-header']
${understanding-test-result}     //button[@id='understanding-your-test-result-header']
${start-again-button}            //a[@id='start-again']
${their-first-name}              //input[@name="firstname-input"]
${their-last-name}               //input[@name="lastname-input"]
${their-dob-day}                 //input[@name="Day"]
${their-dob-month}               //input[@name="Month"]
${their-dob-year}                //input[@name="Year"]
${continue-btn}                  //button[@id = "continue"]
${first-name-error}              //span[@id="their-first-name-error"]
${last-name-error}               //span[@id="their-last-name-error"]
${dob-error}                     //span[@id="their-date-of-birth-error"]
${friend-relation}               xpath://input[@id="friend"]
${relative-relation}             xpath://input[@id="relative"]
${guardian-relation}             xpath://input[@id="guardian"]
${carer-relation}                xpath://input[@id="carer"]
${other-relation}                xpath://input[@id="other"]
${other-field}                   //input[@id='other-input-text']
${enquiry-details}               //div/textarea[@name="enquiry-textarea"]
${your-first-name}               //input[@id="first-name"]
${your-last-name}                //input[@name='lastname-input']
${your-mobile-number}            //input[@name="mobile-input"]
${email-address}                 //input[@id="email-address"]
${confirm-email-address}         //input[@name="emailconfirm-input"]
${submit-enquiry}                //a[@id="submit-enquiry"]
${back-to-home}                  //a[@id='back-to-home']
${guidance-support-link}         //a[@href="https://www.gov.uk/coronavirus"]
${latest-nhs-info}               //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/"]
${online-nhs-111}                //a[@href="https://111.nhs.uk/"]
${urgent-mental-health}          //a[@href="https://www.nhs.uk/nhs-services/mental-health-services/where-to-get-urgent-help-for-mental-health/"]
${nhs-voln-resp}                 //a[@href="https://nhsvolunteerresponders.org.uk/"]
${error-message-elem}            //span[@class="nhsuk-error-message"]
${change-email}                  //div[@id='email-address']//a
${change-type-of-test}           //div[@id='type-of-test']//a
${Completing-form-for}           //div[@id='completing-form-for']
${Someone-else}                  //dd[contains(text(),'Someone else')]
${their-full-name}               //div[@id="their-full-name"]
${their-date}                    //div[@id='their-date-of-birth']
${list-item}                     //div//dd[contains(text(),'31/01/2000')]
${relationship}                  //div[@id="relationship"]
${relation}                      //div//dd[contains(text(),'Relative')]
${change-completing-form-for}    //a[@href="../../../../self-isolation-support/enquiry/who-for"]
${change-relation}               //div[@id="relationship"]/dd[2]/a
${index}                          0
${find-test-result}               //h3[@id="find-a-test-result"]
${home-test-kits}                       //h3[@id="home-test-kits"]
${getting-test}                          //h3[@id="getting-a-test"]
${report-test-result}                    //h3[@id="report-a-test-result"]
${report_test}                           //h3[@id="report-a-test-result"]
${travelling-abroad}                      //h3[@id="travelling-abroad-during-covid-19"]
${testing-care-home}                      //h3[@id="testing-in-a-care-home"]
${guidance-safety}                        //h3[@id='guidelines-and-safety-for-organisations']
${rapid-test-flow}                        //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/testing/how-to-do-a-test-at-home-or-at-a-test-site/how-to-do-a-rapid-lateral-flow-test"]
${pcr-test-home}                          //a[@href='https://www.gov.uk/government/publications/testing-for-coronavirus-at-home/']
${antibody-test-home}                     (//summary/ancestor::details//a)[3]
${day-taken}                               name:Day
${month-taken}                             name:Month
${year-taken}                              name:Year
${year-taken}                               name:Year
${intl-travel}                              //h4[@id="international-travel"]
${changed-test}                             //div[@id='type-of-test']//dd[contains(text(), 'Rapid lateral flow test')]
${cant-find-addrs}                          (//*[@class='slds-rich-text-editor__output'])[2]
${test-barcode-link}                        //button[@id='where-can-i-find-the-test-barcode?-header']
${test-barcode-text-elem}                   //div[@id="where-can-i-find-the-test-barcode?-details"]
${change-vacc-status}                       //div[@id='vaccinated']//a
${dontknow-mobile-num}                      //a[contains(text(),'I do not know the mobile phone number')]
${stay-at-home}                             //h4[@id="stay-at-home"]
${general-guidance-for-staying-at-home}     //h3[@id="general-guidance-for-staying-at-home"]
${stay-at-home-support}                     //h3[@id="stay-at-home-support"]
${Case-number-elem}                         //div[@id='gov-panel-body']/div
${nhs-covid-19-app}                         //h4[@id="the-nhs-covid-19-app"]

*** Keywords ***
Click self-isolation topic
    Click Element   ${self-isolation-support}

Click international travel topic
    Click Element   ${intl-travel}

Click covid-19 testing topic
    Click Element   ${covid-19-testing}

Click stay at home topic
    Click Element  ${stay-at-home}

Click workplace organisation or carehome guidance topic
    Click Element   ${workplace-carehome-guidance}

click nhs covid-19 app topic
       Click Element   ${nhs-covid-19-app}

Click guidelines and saftey for organisations
    Click Element   ${guidance-safety}

Click report a test result
    Click Element   ${report-test-result}

Click reporting your test result
    Click Element   ${reporting-your-test-result}

Click receiving your test result
    Click Element   ${receiving-your-test-result}

Click understanding your test result
    Click Element   ${understanding-test-result}

Click Start Again
    Click Element   ${start-again-button}

Input their First Name
    [Arguments]  ${first}
    Input Text  ${their-first-name}    ${first}

Clear their First Name
    Clear Element Text      ${their-first-name}

Input their Last Name
    [Arguments]  ${last}
    Input Text  ${their-last-name}    ${last}

Clear their Last Name
    Clear Element Text      ${their-last-name}

Input their Date Of Birth
    [Arguments]  ${day}         ${month}        ${year}
    Input Text  ${their-dob-day}      ${day}
    Input Text  ${their-dob-month}    ${month}
    Input Text  ${their-dob-year}     ${year}

Clear their Date of Birth
    Clear Element Text      ${their-dob-day}
    Clear Element Text      ${their-dob-month}
    Clear Element Text     ${their-dob-year}

Input the day was the test taken
    [Arguments]  ${day}         ${month}        ${year}
    Input Text  ${day-taken}      ${day}
    Input Text  ${month-taken}    ${month}
    Input Text  ${year-taken}     ${year}

Input the test barcode
    [Arguments]  ${barcode-id}
    Input Text  id:yes-barcode-input-text     ${barcode-id}

Click where can I find the test barcode link
    Click Element   ${test-barcode-link}

Input the mobile phone number was used to book the test
    [Arguments]  ${phone-number}
    Input Text  id:mobile-phone-number    ${phone-number}

Input the day of your birth
    [Arguments]  ${day}         ${month}        ${year}
    Input Text  ${day-taken}      ${day}
    Input Text  ${month-taken}    ${month}
    Input Text  ${year-taken}     ${year}

Input the postcode
    [Arguments]  ${postcode}
    Input text  //input[@name="query-postcode"]    ${postcode}

Input the postcode in address not found
    [Arguments]  ${postcode}
    Input text  //input[@name="address-postcode"]    ${postcode}

Select Yes radio button
     Click element   id:yes
Select No radio button
     Click element   id:no

Input your First Name
    [Arguments]  ${first-name}
    Input Text  ${your-first-name}    ${first-name}

Input your Last Name
    [Arguments]  ${last-name}
    Input Text  ${your-last-name}    ${last-name}

Input your mobile phone number (Optional)
    [Arguments]  ${ph-no}
    Input Text  ${your-mobile-number}      ${ph-no}

Do not enter the mandatory fields
     Click Element   ${continue-btn}

Presented with the error message that displays missing first name, last name and DOB
    Page Should Contain     ${first-name-error} ${last-name-error}

Click friend as relation
    Click Element  ${friend-relation}

Click relative as relation
    Click Element   ${relative-relation}

Click guardian as relation
    Click Element   ${guardian-relation}

Click carer as relation
    Click Element   ${carer-relation}

Click other as relation
    Click Element   ${other-relation}

click on I dont know mobile number
   click Element  ${dontknow-mobile-num}

Other relation with the person
    [Arguments]  ${other-relationship}
    Input Text  ${other-field}   ${other-relationship}

Clear other as relation
    Clear Element Text     ${other-field}

Enter details in text area
    [Arguments]  ${text}
    Input Text  ${enquiry-details}   ${text}

Enter email address
    [Arguments]  ${email}
    Input Text  ${email-address}   ${email}

Delete email address
    Clear Element Text      ${email-address}

Confirm email address
    [Arguments]  ${confirm-email}
    Input Text  ${confirm-email-address}   ${confirm-email}

Delete confirm email address
    Clear Element Text      ${confirm-email-address}

Submit enquiry form
    Click Element    ${submit-enquiry}

Tap back to home button
    Click Element    ${back-to-home}

View Guidance and Support page on GOV UK
    Click Element   ${guidance-support-link}
    Switch Window    new
  #  Close Window
    Switch Window    main

View the latest NHS information and advice
    Click Element   ${latest-nhs-info}
    Switch Window    new
    Close Window
    Switch Window    main

Use the online NHS 111 services
    Click Element   ${online-nhs-111}
    Switch Window    new
    Close Window
    Switch Window    main

Find your local NHS urgent mental health helpline
    Click Element   ${urgent-mental-health}
    Switch Window    new
    Close Window
    Switch Window    main

View the NHS volunteer responders information online
    Click Element   ${nhs-voln-resp}
    Switch Window    new
    Close Window
    Switch Window    main

Check for error message
    Wait Until Element Is Visible     ${error-message-elem}

Click Change button to change the email address
    Click Element   ${change-email}

Check Change button to change the vaccination status
    Page Should Contain Element      ${change-vacc-status}

Click Change button to change the vaccination status
    Click Element   ${change-vacc-status}

Click Change button to change the type of test
    Click Element   ${change-type-of-test}

Change email address
    [Arguments]  ${email}
    Clear Element Text      ${email-address}
    Input Text  ${email-address}   ${email}

Confirm changed email address
    [Arguments]  ${confirm-email}
    Clear Element Text      ${confirm-email-address}
    Input Text  ${confirm-email-address}   ${confirm-email}

Completing form for Someone else
    [Arguments]  ${header}    ${text}
    Wait Until Element Is Visible     ${Completing-form-for}
    Page should contain     ${header}
    Wait Until Element Is Visible     ${Someone-else}
    Page should contain     ${text}

Their full name
    [Arguments]  ${text}
    Wait Until Element Is Visible     ${their-full-name}
    Page should contain     ${text}

Their Date Of Birth
    [Arguments]  ${text}   ${text2}
    Wait Until Element Is Visible     ${their-date}
    Page should contain     ${text}
    Page should contain     ${text2}

Their Relationship to the user
    [Arguments]   ${their-rel}   ${rel-value}
    Wait Until Element Is Visible     ${relationship}
    Page should contain     ${their-rel}
    Wait Until Element Is Visible     ${relation}
    Page should contain     ${rel-value}

Change their relationship
    Click Element   ${change-relation}

Continue to complete submitting the enquiry after an update
    FOR    ${index}    IN RANGE    3
        Click Element   ${continue-btn}
    END

Getting a test for covid-19 testing
     Click Element   ${getting-test}

Reporting a test result for covid-19 testing
     Click Element   ${report-test-result}

Report a test result for covid-19 testing
    Click Element   ${report_test}

Travelling abroad during COVID-19 for covid-19 testing
    Click Element   ${travelling-abroad}

Testing in a carehome
   Click Element   ${testing-care-home}

Find a test result for covid-19 testing
    Click Element   ${find-test-result}

Home test kits for covid-19 testing
    Click Element   ${home-test-kits}

Expand How to do a rapid lateral flow test at home
    Click Element   (//button[@class='accordion-trigger'])[1]

Expand How to do a PCR test at home
    Click Element   (//button[@class='accordion-trigger'])[2]

Expand How to do an antibody test at home
    Click Element   (//summary/span)[3]

Click on how to do a rapid lateral flow link
    Click Element   ${rapid-test-flow}

Click on how to do a PCR test at home link
    Click Element   ${pcr-test-home}

Click on how to do an antibody test at home
    Click Element  ${antibody-test-home}

Click I can't find my address in the list
    Click Element   ${cant-find-addrs}

Submit get help and make an enquiry on covid-19 testing for getting a test
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Getting a test for covid-19 testing
    Page should contain     Getting a test
    Click Submit form
    Sleep  2s

    Select myself Radio Button
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

Continue to submit the enquiry form for getting result covid-19 test after an update
    Click Continue on the page
    globalElements.Select Radio Button By Value    Yes
    Click Continue on the page
    Input the day was the test taken    25  02  2020
    Click Continue on the page
    globalElements.Select Radio Button By Value     Yes-barcode
    Input the test barcode      ABC12345678
    Click Continue on the page
    Input the mobile phone number was used to book the test     +447700900982
    Click Continue on the page
    globalElements.Select Radio Button By Value     Yes
    Click Continue on the page
    Enter details in text area      testing
    Click Continue on the page
    Input your First Name   Firstname
    Input your Last Name    Lastname
    Input your mobile phone number (Optional)   07766556677
    Click Continue on the page
    Enter email address     testtrace4@gmail.com
    Confirm email address   testtrace4@gmail.com
    Click Continue on the page

Continue to submit the enquiry form for finding a covid-19 test result
    globalElements.Select Radio Button By Value    Yes
    Click Continue on the page
    Input the day was the test taken    25  02  2020
    Click Continue on the page
    globalElements.Select Radio Button By Value     Yes-barcode
    Input the test barcode      ABC12345678
    Click Continue on the page
    Input the mobile phone number was used to book the test     +447700900982
    Click Continue on the page
    Input the day of your birth     12  12  2000
    Click Continue on the page

Submit get help and make an enquiry on covid-19 for someone else for getting a test
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Getting a test for covid-19 testing
    Page should contain     Getting a test
    Click Submit form
    Sleep  2s
    Select someone else Radio Button
    Click Continue on the page
    globalElements.Select Radio Button By Value    PCR test
    Click Continue on the page
    globalElements.Select Radio Button By Value    Yes
    Click Continue on the page
    Input the day was the test taken    25  02  2020
    Click Continue on the page
    globalElements.Select Radio Button By Value     Yes-barcode
    Input the test barcode      ABC12345678
    Click Continue on the page
    Page should contain     What mobile phone number was used to book the test?
    Input the mobile phone number was used to book the test     +447700900982
    Click Continue on the page
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


Submit an enquiry form for covid-19 International testing for someone else
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2
    Getting a test for covid-19 testing
    Click Submit form
    Sleep  2s
    Select someone else Radio Button
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

Click General guidance for staying at home
    Click element   ${general-guidance-for-staying-at-home}

Click Stay at home support
    Click element   ${stay-at-home-support}

Expand When to stay at home
    Click Element   //button[@id='when-to-stay-at-home-header']

Expand When to get a COVID-19 test
    Click Element   //button[@id='when-to-get-a-covid-19-test-header']

Expand General stay at home support
    Click Element   //button[@id='general-stay-at-home-support-header']

Expand Mental health and wellbeing support
    Click Element   //button[@id='mental-health-and-wellbeing-support-header']

Expand Support at home
    Click Element   //button[@id='support-at-home-header']
