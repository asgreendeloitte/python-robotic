*** Variables ***
${YesRadioButton}   xpath://input[@value='Yes']
${NoRadioButton}   xpath://input[@value='No']

*** Keywords ***
Select Yes (Did this answer your question?) Radio Button
    Click Element   ${YesRadioButton}

Select No (Did this answer your question?) Radio Button
    Click Element   ${NoRadioButton}