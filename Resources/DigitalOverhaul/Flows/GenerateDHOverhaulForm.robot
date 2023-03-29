*** Settings ***
# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelperOverhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/enquiry.robot


*** Keywords ***
Check Digital Helper Overhaul Start Page
    Page Should Contain     Get help with coronavirus (COVID-19) enquiries and complaints

Submit an enquiry form on behalf of someone else
    [Arguments]  ${enquiry-type}    ${relation-type}
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     ${enquiry-type}
    Click Submit form
    Sleep  2s
    Select someone else Radio Button
    Click Continue on the page
    Page should contain  Tell us about the person you're completing this form for
    Input their First Name    Test
    Input their Last Name    last
    Input their Date Of Birth   01  01  2000
    Click Continue on the page
    What is your relationship to this person    ${relation-type}
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

Get help and make an enquiry about the topic
    [Arguments]  ${enquiry-type}
    Run Keyword If  '${enquiry-type}' == '1'       Click self-isolation topic
    Run Keyword If  '${enquiry-type}' == '2'       Click covid-19 testing topic
    Run Keyword If  '${enquiry-type}' == '3'       Click international travel topic
    Run Keyword If  '${enquiry-type}' == '4'       Click workplace organisation or carehome guidance topic
    Run Keyword If  '${enquiry-type}' == '5'       click nhs covid-19 app topic



What is your relationship to this person
    [Arguments]  ${relation-type}
    Run Keyword If  '${relation-type}' == '0'       Click Continue on the page
    Run Keyword If  '${relation-type}' == '2'       Click relative as relation
    Run Keyword If  '${relation-type}' == '3'       Click guardian as relation
    Run Keyword If  '${relation-type}' == '4'       Click other as relation

Contniue without selecting who you are while submitting an enquiry form
    [Arguments]  ${enquiry-type}
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     ${enquiry-type}
    Click Submit form
    Sleep  2s
    Click Continue on the page

Contniue without selecting who you are while submitting a Covid-19 enquiry form
    [Arguments]  ${enquiry-type}
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     ${enquiry-type}
    Find a test result for covid-19 testing
    Click Submit form
    Sleep  2s
    Click Continue on the page
    Sleep  1s
    Page should contain         Select who you are completing this form for

Submit an enquiry form as myself for self isolation support
    [Arguments]  ${enquiry-type}
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     ${enquiry-type}
    Click Submit form
    Sleep  2s
    Select myself Radio Button
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

Submit an enquiry form as myself for self isolation support with review
    [Arguments]  ${enquiry-type}
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     ${enquiry-type}
    Click Submit form
    Sleep  2s
    Select myself Radio Button
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
    Check answers before submitting a enquiry
    Submit enquiry form

Enquiry form as myself for self isolation support with email edited before sending the form
    [Arguments]  ${enquiry-type}
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     ${enquiry-type}
    Click Submit form
    Sleep  2s
    Select myself Radio Button
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
    Check answers before submitting a enquiry
    Click Change button to change the email address
    Change email address    testtrace5@gmail.com
    Confirm changed email address    testtrace5@gmail.com


Relationship to this person
    [Arguments]  ${relation-type}
    Run Keyword If  '${relation-type}' == 'Friend'       Click friend as relation
    Run Keyword If  '${relation-type}' == 'Relative'       Click relative as relation
    Run Keyword If  '${relation-type}' == 'Guardian'       Click guardian as relation
    Run Keyword If  '${relation-type}' == 'Carer'       Click carer as relation
    Run Keyword If  '${relation-type}' == 'Other'       Click other as relation

Enquiry form submission as myself for Covid-19 testing
    [Arguments]  ${enquiry-type}
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     2
    Find a test result for covid-19 testing
    Click Submit form
    Sleep  2s
    Select myself Radio Button
    Click Continue on the page

Enquiry form submission as someone for Covid-19 testing
    [Arguments]  ${enquiry-type}
    Go To Digital Overhaul
    click on the get help link
    Sleep  2s
    Get help and make an enquiry about the topic     2
    Find a test result for covid-19 testing
    Click Submit form
    Sleep  2s
    Select someone else Radio Button
    Click Continue on the page

