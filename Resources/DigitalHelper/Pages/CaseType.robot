*** Variables ***
${enquiry-radio-btn}   xpath://input[@value='Enquiry']
${feedback-radio-btn}   xpath://input[@value='Feedback']
${complaint-radio-btn}   xpath://input[@value='Complaint']

*** Keywords ***
Select Enquiry Radio Button
    Click Element   ${enquiry-radio-btn}

Select Feedback Radio Button
    Click Element   ${feedback-radio-btn}

Select Complaint Radio Button
    Click Element   ${complaint-radio-btn}

Select Case Type Radio Button
    [Arguments]  ${case-type}
    Click Element   xpath://input[@value='${case-type}']

