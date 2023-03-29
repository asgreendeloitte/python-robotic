*** Settings ***
Library  AxeLibrary

*** Variables ***
${continue-btn}                   //button[@id = "continue"]
${cont-button}                    //div//a[@id = "continue"]
${submit-btn}                     //button[contains(text(), 'Submit')]
${submit-form-btn}                //a[@id="submit-a-form"]
${send-enquiry-btn}               //button[contains(text(), 'Send enquiry')]
${send-feedback-btn}              //button[contains(text(), 'Send feedback')]
${send-complaint-btn}             //button[contains(text(), 'Send complaint')]
${someone-else-radio-btn}         //input[@id='someone-else']
${myself-radio-btn}               //input[@id='myself']

${see-all-topics-button}         //a[contains(text(), 'See all topics')]
${search-by-keyword}             //input[@name='search']
${guidance-scotland-wales-ni}    //h4[@id='guidance-for-scotland,-wales-and-northern-ireland']
${guidance-scotland}             //a[contains(text(), 'Find out what the COVID-19 guidance is for Scotland (opens in new window).')]
${guidance-wales}                //a[contains(text(), 'Find out what the COVID-19 guidance is for Wales (opens in new window).')]
${guidance-northern-ireland}     //a[contains(text(), 'Find out what the COVID-19 guidance is for Northern Ireland (opens in new window).')]

${accessibility-link}            //a[contains(text(), 'Accessibility statement')]
${cookies-link}                  //a[contains(text(), 'Cookies')]
${privacy-policy-link}           //a[contains(text(), 'Privacy policy')]


${complaint-button}             //a[@id="make-a-complaint"]
${international-travel}         //input[@id="international-travel"]
${covid-19}                     //input[@id="covid-19-testing"]
${private-test-provider}        //input[@id="private-test-provider"]
${self-isolation-guidance}      //input[@id="self-isolation-guidance"]
${contact-tracing}              //input[@id="contact-tracing"]
${workplace-guidance}           //input[@id="workplace,-organisation,-care-home-or-school-guidance"]
${other}                        //input[@id="other"]
${stay-home}                    //input[@id="stay-at-home"]
${GoBackLink}                   //a[@class='nhsuk-back-link__link']
${nhs-home}                     //a[@href="../..//"]
${using-setting-app}            //a[@href="nhs-covid-19-app/use-set-app"]
${what-the-app-does}            //a[@href="nhs-covid-19-app/how-app-works"]
${troubleshootin-tech-info}     //a[@href="nhs-covid-19-app/troubleshooting-tech-info"]
${data-privacy-link}            //a[@href="nhs-covid-19-app/data-and-privacy"]
${nhs-logo}                     //a[@href="/"]
${nhs-covid19-app-topic}        //input[@id="the-nhs-covid-19-app"]
${someone-else-text}            //label[@for="someone-else-input-text"]
${complaint-text-area}          //textarea[@id='complaint-details']


*** Keywords ***

Click Continue on the page
    Click Element   ${continue-btn}

Tap to continue to the next page
    Click Element   ${cont-button}

Click Submit form
    Click Element   ${submit-form-btn}

Click Send Enquiry
    Page Should Contain     Your enquiry
    Page Should Contain     Send enquiry
    Page Should Contain     Make an enquiry
    Click Element   ${send-enquiry-btn}

Click Send Feedback
    Page Should Contain     Give feedback
    Click Element   ${send-feedback-btn}

Click Send Complaint
    Page Should Contain     Make a complaint
    Click Element   ${send-complaint-btn}

Click Send
    [Arguments]  ${case-type}
    Run Keyword If  '${case-type}' == 'Enquiry'     Click Send Enquiry
    Run Keyword If  '${case-type}' == 'Feedback'     Click Send Feedback
    Run Keyword If  '${case-type}' == 'Complaint'     Click Send Complaint

Select Radio Button By Value
    [Arguments]  ${value}
    Click Element   //input[contains(@value, "${value}")]

Open Accessibility statement
    Click Element   ${accessibility-link}
    Switch Window    new

Open Cookies Policy
    Click Element   ${cookies-link}
    Switch Window    new

Open Privacy Policy
    Click Element   ${privacy-policy-link}

Click GoBack
    Click Element     ${GoBackLink}
    Sleep  4s

Click Feedback in Beta header
        Sleep  2s
       Click Element   //a[contains(text(), 'feedback')]

Select someone else Radio Button
    Click Element   ${someone-else-radio-btn}

Select myself Radio Button
    Click Element   ${myself-radio-btn}

Click See all topics
    Click Element   ${see-all-topics-button}
    Sleep   3s

Search by keyword
    [Arguments]     ${keyword}
    Input Text      ${search-by-keyword}    ${keyword}
    Press Keys  ${search-by-keyword}  ENTER
    Sleep   3s

Click Guidance Scotland Wales Northern Ireland
    Click Element   ${guidance-scotland-wales-ni}

Click Accept Cookies if applicable
    Run Keyword And Ignore Error    Click Accept Cookies

Click Accept Cookies
    Click Element   //button[@id='ccc-notify-accept']

Click Guidance Scotland
    Click Element   ${guidance-scotland}
    Sleep   3s
    Switch Window   title=Coronavirus (COVID-19) in Scotland | NHS inform

Click Guidance Wales
    Click Element   ${guidance-wales}
    Sleep   3s
    Switch Window   title=Coronavirus (COVID-19) | Topic | GOV.WALES

Click Guidance Northern Ireland
    Click Element   ${guidance-northern-ireland}
    Sleep   3s
    Switch Window   title=Coronavirus (COVID-19) | nidirect

Make a complaint about the topic
    [Arguments]  ${complaint-type}
    Run Keyword If  '${complaint-type}' == 'International travel'       Click topic international travel
    Run Keyword If  '${complaint-type}' == 'COVID-19 testing'       Click topic covid-19 testing
    Run Keyword If  '${complaint-type}' == 'A Private Test Provider'       Click topic private test provider
    Run Keyword If  '${complaint-type}' == 'Stay at home'       Click topic stay at home
    Run Keyword If  '${complaint-type}' == 'Contact tracing'       Click topic contact tracing
    Run Keyword If  '${complaint-type}' == 'Workplace, organisation, care home or school guidance'       Click topic workplace guidance
    Run Keyword If  '${complaint-type}' == 'Other'       Click topic other
    Run Keyword If  '${complaint-type}' == 'The NHS COVID-19 app'       Click topic the NHS COVID-19 app

Click on Make a complaint button
    Click Element   ${complaint-button}

Click topic international travel
    Click Element   ${international-travel}

Click topic covid-19 testing
    Click Element   ${covid-19}

Click topic private test provider
    Click Element   ${private-test-provider}

Input the private test provider name
    [Arguments]     ${search-by-keyword}
    Input Text      ${private-test-provider}    ${search-by-keyword}

Click topic self insolation guidance
    Click Element   ${self-isolation-guidance}

Click topic stay at home
     Click Element   ${stay-home}

Click topic contact tracing
    Click Element   ${contact-tracing}

Click topic workplace guidance
    Click Element   ${workplace-guidance}

Click topic the NHS COVID-19 app
    Click Element   ${nhs-covid19-app-topic}

Click topic other
    Click Element   ${other}

Select address from the Drop down
    [Arguments]        ${index}=3
    sleep   2s
    Click Element       //select[@id="select-query-postcode"]/option[${index}]

Perform accessibilty checks on the page
    &{results}=    Run Accessibility Tests    axe_results.json
    Log   Violations Count: ${results.violations}
    Log Readable Accessibility Result    violations

Click on NHS home button
    Click Element   ${nhs-home}

Select using and setting up the app
    Click Element   ${using-setting-app}

Select what the app does and how it works
    Click Element   ${what-the-app-does}

Select troubleshooting and technical information
    Click Element   ${troubleshootin-tech-info}

Select data and privacy
    Click Element   ${data-privacy-link}

Select the NHS home logo
    Click Element   ${nhs-logo}






