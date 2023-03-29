*** Variables ***
${continue-btn}             //button[contains(text(), 'Continue')]
${submit-btn}               //button[contains(text(), 'Submit')]
${submit-a-form-btn}        //button[contains(text(), 'Submit a form')]
${send-enquiry-btn}         //button[contains(text(), 'Send enquiry')]
${send-feedback-btn}        //button[contains(text(), 'Send feedback')]
${send-complaint-btn}       //button[contains(text(), 'Send complaint')]

${accessibility-link}       //a[contains(text(), 'Accessibility statement')]
${cookies-link}             //a[contains(text(), 'Cookies')]
${privacy-policy-link}      //a[contains(text(), 'Privacy policy')]

*** Keywords ***

Click Continue
    Click Element   ${continue-btn}

#Click Submit
#    Click Element   ${submit-btn}

Click Submit A Form
    Click Element   ${submit-a-form-btn}

Click Send Enquiry
    Page Should Contain     Your enquiry
    Page Should Contain     Send enquiry
    Page Should Contain     Make an enquiry
    Click Element   ${send-enquiry-btn}

Click Send Feedback
#    Page Should Contain     Your feedback
#    Page Should Contain     Send feedback
    Page Should Contain     Give feedback
    Click Element   ${send-feedback-btn}

Click Send Complaint
#    Page Should Contain     Your complaint
#    Page Should Contain     Send complaint
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

Click GoBack Link
    Click Element     ${GoBackLink}
    Sleep  4s

Click Feedback in Beta header
        Sleep  2s
       Click Element   //a[contains(text(), 'feedback')]

