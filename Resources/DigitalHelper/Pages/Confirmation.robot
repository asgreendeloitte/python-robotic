*** Variables ***
${case-number-element}      //div[@class='govuk-panel__body']/div/div
${case-number}

*** Keywords ***
Check Confirmation Page Content
    Sleep   6s
    Page Should Contain         Form Submitted
    Page Should Contain         Your case number is
    Wait Until Element Is Visible     ${case-number-element}
    Sleep   7s
    ${case-number}=     Get Text      ${case-number-element}
    Length Should Be            ${case-number}      8

    Page Should Contain         Thank you for submitting your message
    Page Should Contain         What happens next
    Page Should Contain         We have received your message. A confirmation email has been sent to
    ## To-do, add a check for the email, this would involve passing a variable in (maybe not worth the effort)

#    Page Should Contain         We will respond to your message via email within 3 working days.

    Page Should Contain         You can visit the
    Page Should Contain Link    https://www.gov.uk/coronavirus
    Page Should Contain         for further information.

    Page Should Contain         Get the latest
    Page Should Contain Link    https://www.nhs.uk/conditions/coronavirus-covid-19/
    Page Should Contain         about coronavirus (COVID-19).

    Page Should Contain         Alternatively you can call 119, if you need further assistance.

    Page Should Contain         If you need more support

    Page Should Contain         For urgent medical assistance please call NHS 111, or for a medical emergency dial 999.

    Page Should Contain         If you are unable to call, please refer to the
    Page Should Contain Link    https://www.111.nhs.uk

    Page Should Contain         Find your local NHS
    Page Should Contain Link    https://www.nhs.uk/mental-health/advice-for-life-situations-and-events/where-to-get-urgent-help-for-mental-health

    Page Should Contain Link    https://www.nhsvolunteerresponders.org.uk/services
    Page Should Contain         also offer help with essential items and prescription collections as well as daily check-ins and chats.

Check Confirmation Page Private Test Provider
    Page Should Contain     Thank you for your complaint
    Page Should Contain     What happens next
    Page Should Contain     We have received your complaint.
    Page Should Contain     An email has been sent to
#    Page Should Contain Element     ${email-date}

    Page Should Contain     If you have any further concerns about the service you received from NHS Test and Trace, let us know by calling 119 or visiting
    Page Should Contain Link    Test and Trace: get help with test and trace related enquiries, feedback or complaints (opens in new window).
    Page Should Contain     You can visit the guidance and support pages for your part of the UK .

    Page Should Contain Link    England - COVID-19 (opens in new window)
    Page Should Contain Link    Scotland - COVID-19 (opens in new window)
    Page Should Contain Link    Wales - COVID-19 (opens in new window)
    Page Should Contain Link    Northern Ireland - COVID-19 (opens in new window)

    Page Should Contain         If you need more support
    Page Should Contain         For urgent medical assistance please call NHS 111, or for a medical emergency dial 999.
    Page Should Contain         If you are unable to call, please refer to the
    Page Should Contain Link    online NHS 111 service (opens in new window)

Check Confirmation Page Help With Home Test Kit
    Page Should Contain Link    Find help to do a rapid lateral flow test at home (opens in new window).
    Page Should Contain     A rapid lateral flow test is a test that gives a quick result.

    Page Should Contain Link    Find help to do a PCR test at home (opens in new window).
    Page Should Contain     A PCR test is a test that is sent to a lab.

    Page Should Contain Link    Find help to do an antibody test for COVID-19 at home (opens in new window).
    Page Should Contain     An antibody test is a test to check if you had COVID-19 before.

    Page Should Contain     If you need help returning a test via courier please call 119.

    Page Should Contain     Need more help?

    Page Should Contain     If you need more help you can submit a form. We will respond to your message within 3 working days. If your enquiry needs an immediate response, call 119.

Check 'After Arriving in England' Policy
    Page Should Contain     After arriving in England
   # Page Should Contain     After you arrive in England, you must take a test.
    Page Should Contain Link    Find a travel test provider (opens in new window).
    Page Should Contain Link    Check the guidance for travel to England from abroad (opens in new window).

Verify Submit a form button
    Page Should Contain Button  //button[text()='Submit a form']

Verify Conmtinue button
    Page Should Contain Button  //button[text()='Continue']

Verify Start again button
    Page Should Contain Button  //button[text()='Start again']
