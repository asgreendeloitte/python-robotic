*** Variables ***


#${account-name-lookup-first-option}         (//ul[contains(@class, 'lookup__list')]/li)[2]

${DeleteIcon}                               (//*[@data-key='close'])[4]
#//a[@class='deleteAction']
#${account-name-lookup}                      //input[@title='Search Accounts']

${FieldName}                                Account Name
${AccountName}                              Accountwithout Email



*** Keywords ***

Agent Clears Acocunt information and enters new account
    Sleep  3s
    Click Element   ${DeleteIcon}
    Sleep  2s
    Click Element   ${account-name-lookup}
    Input Text        ${account-name-lookup}    ${AccountName}
     Click Element   ${account-name-lookup-first-option}

    Sleep  2s


