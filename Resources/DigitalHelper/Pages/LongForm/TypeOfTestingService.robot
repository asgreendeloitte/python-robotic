*** Variables ***

#Radio buttons
${home-radio-btn}   xpath://input[@value='Home']
${regional-radio-btn}   xpath://input[@value='Regional Test Site']
${local-radio-btn}   xpath://input[@value='Local Test Site']
${mobile-radio-btn}   xpath://input[@value='Mobile Test Site']

*** Keywords ***

Select Home Radio Button
    Click Element   ${home-radio-btn}

Select Regional Test Site Radio Button
    Click Element   ${regional-radio-btn}

Select Local Test Site Radio Button
    Click Element   ${local-radio-btn}

Select Mobile Test Site Radio Button
    Click Element   ${mobile-radio-btn}

