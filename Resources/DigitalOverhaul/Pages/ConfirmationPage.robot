*** Variables ***
${Case-number-element}      //div[@class='govuk-panel__body']/div
${Case-number}
${form-sub}                //div//h1[@id="gov-panel-title"]
${arrival-test}            //input[@id='arrival-test']
${another-type-test}       //input[@id="another-type-of-travel-test"]
${not-sure-test}           //input[@id="not-sure"]
${manual-test-provider}    //a[@href="../../../../../complaint/ptp/myself/private-test-provider-name/manual"]
${someone-test-provider}   //a[@href="../../../../../complaint/ptp/someone-else/private-test-provider-name/manual"]

*** Keywords ***
Check Confirmation Page Contents
    Sleep   6s
    Page Should Contain         Form submitted
    Page Should Contain         Your case number is
    Wait Until Element Is Visible     ${Case-number-element}
    ${Case-number}=     Get Text      ${Case-number-element}
    Length Should Be            ${Case-number}     8

    Page Should Contain         What happens next
    Page Should Contain         We have received your enquiry. A confirmation email has been sent to

    Page Should Contain         For more information
    Page Should Contain Link    https://www.gov.uk/coronavirus
    Page Should Contain Link    https://www.nhs.uk/conditions/coronavirus-covid-19/
    Page Should Contain         call NHS Test and Trace on 119

    Page Should Contain         If you need more support
    Page Should Contain         For urgent medical assistance call 111, or for a medical emergency dial 999.
    Page Should Contain         If you are unable to call, use the
    Page Should Contain Link    https://111.nhs.uk/

    Page Should Contain         Find your local NHS
    Page Should Contain Link    https://www.nhs.uk/nhs-services/mental-health-services/where-to-get-urgent-help-for-mental-health/

    Page Should Contain Link    https://nhsvolunteerresponders.org.uk/
    Page Should Contain         also offer help with essential items and prescription collections as well as daily check-ins and chats.

Check answers before submitting a enquiry
    Page Should Contain     Completing form for
    Page Should Contain     Enquiry details
    Page Should Contain     Name
    Page Should Contain     Email address
    Page Should Contain     Mobile phone (optional)
    Page Should contain     Change

Check answers before submitting a enquiry for someoneelse
    Page Should Contain     Completing form for
    Page Should Contain     Their full name
    Page Should Contain     Relationship
    Page Should Contain     Enquiry details
    Page Should contain     Name
    Page Should contain     Email address
    Page Should contain     Mobile phone (optional)

Check An arrival test (also known as a ‘day 2 test’) radio button
    page should contain radio button    id:arrival-test

Check Another type of travel test radio button
    page should contain radio button    id:another-type-of-travel-test

Check Not sure radio button
    page should contain radio button    id:not-sure

Select Check An arrival test (also known as a ‘day 2 test’) radio button
    Click Element   ${arrival-test}

Select another type of travel radio button
    Click Element   ${another-type-test}

Select not sure radio button
    Click Element   ${not-sure-test}

Select I can’t find the private test provider I’m looking for - myself
    Click Element   ${manual-test-provider}

Select I can’t find the private test provider I’m looking for - someonelse
    Click Element   ${someone-test-provider}

Select name of the private test provider
    [Arguments]        ${index}=2
    sleep   2s
    Click Element       //select[@id="select-ptp-name"]/option[${index}]

Citizen wanting to make a complaint about a private test provider
    click on the make a complaint link
    Click on Make a complaint button
    Sleep  2s
    Make a complaint about the topic   A Private Test Provider
    Click Continue on the page
    Tap to continue to the next page
    Select myself Radio Button
    Click Continue on the page
    Page should contain  Which test is your complaint about?
    Select PCR as the complaint about
    Click Continue on the page
    page should contain     Which country was the test delivered to?
    Select Englnd as the country the test was delivered to
    Click Continue on the page
    Select Check An arrival test (also known as a ‘day 2 test’) radio button
    Click Continue on the page
    Input the private test provider name    Randox
    Click Continue on the page
    Select name of the private test provider
    Click Continue on the page

Verify Start again button
    Page Should Contain Element      //a[@id='start-again']
Verify Submit a form button
    Page Should Contain Element  //a[@id='submit-a-form']