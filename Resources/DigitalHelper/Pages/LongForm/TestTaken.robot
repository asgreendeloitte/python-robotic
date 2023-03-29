*** Variables ***

#Radio buttons
${antigen-radio-btn}   xpath://input[@value='Antigen']
${antibody-radio-btn}   xpath://input[@value='Antibody']


*** Keywords ***

Select Antigen Radio Button
    Click Element   ${antigen-radio-btn}

Select AntiBody Radio Button
    Click Element   ${antibody-radio-btn}
