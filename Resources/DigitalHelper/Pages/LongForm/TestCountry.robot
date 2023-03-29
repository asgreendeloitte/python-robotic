*** Variables ***

#Radio buttons
${england-radio-btn}   xpath://input[@value='England']
${scotland-radio-btn}   xpath://input[@value='Scotland']
${ni-radio-btn}   xpath://input[@value='NI']
${wales-radio-btn}   xpath://input[@value='Wales']

*** Keywords ***

Select England Radio Button
    Click Element   ${england-radio-btn}

Select Scotland Radio Button
    Click Element   ${scotland-radio-btn}

Select Northern Irealand Radio Button
    Click Element   ${ni-radio-btn}

Select Wales Radio Button
    Click Element   ${wales-radio-btn}