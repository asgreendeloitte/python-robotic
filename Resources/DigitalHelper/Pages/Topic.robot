*** Variables ***
${symptoms-and-testing-radio-btn}   xpath://input[@value='Symptoms & Testing']
${contact-tracing-radio-btn}   xpath://input[@value='Contact tracing']
${self-isolation-radio-btn}   xpath://input[@value='Self-isolation support']
${business-radio-btn}   xpath://input[@value='My business / organisation']
${international-travel-radio-btn}   xpath://input[@value='International travel']
${staying-at-home-radio-btn}   xpath://input[@value="Stay at home support"]
${covid19app-radio-btn}        xpath://input[@value="The NHS COVID-19 app"]

*** Keywords ***
Select Symptoms And Testing Radio Button
    Click Element   ${symptoms-and-testing-radio-btn}

Select Contact Tracing Radio Button
    Click Element   ${contact-tracing-radio-btn}

Select Self-isolation Support Radio Button
    Click Element   ${self-isolation-radio-btn}

Select Business Or Organisation Radio Button
    Click Element   ${business-radio-btn}

Select International Travel Radio Button
    Click Element   ${international-travel-radio-btn}

Select Staying at home Radio Button
    Click Element   ${staying-at-home-radio-btn}

Select Covid-19 app home Radio Button
    Click Element   ${covid19app-radio-btn}


#Dynamically set the radio button using the argument, pass in the value
Select Topic Radio Button
    [Arguments]  ${feedback-topic}
    Click Element   xpath://input[@value='${feedback-topic}']

Check Topic Page Content
[Arguments]  ${case-type}
    Run Keyword If    '${case-type}' == 'Complaint'
    ...    Check Complaint Heading Content
    ...    ELSE IF      '${case-type}' == 'Feedback'
    ...    Check Feedback Heading Content
    ...    ELSE IF      '${case-type}' == 'Enquiry'
    ...    Check Feedback Heading Content
    ...    ELSE    Log to console      Case type not found: ${case-type}

Check Complaint Heading Content
    Page Should Contain     Make a complaint about the NHS Test and Trace service

Check Feedback Heading Content
    Page Should Contain     What is your feedback about?

Check Enquiry Heading Content
    Page Should Contain     What is your enquiry about?