*** Variables ***

#England radio buttons
${london-radio-btn}   xpath://input[@value='London']
${south-east-radio-btn}   xpath://input[@value='South East']
${midland-radio-btn}   xpath://input[@value='Midlands']
${south-west-radio-btn}   xpath://input[@value='South West']
${east-radio-btn}   xpath://input[@value='East']
${north-east-yorkshire-radio-btn}   xpath://input[@value='North East & Yorkshire']
${north-west-radio-btn}   xpath://input[@value='North West']


# Devolved Nations radio buttons
# All of the nations other than England do not have specific
# locations hence they enter their country name again
${scotland-radio-btn}   xpath://input[@value='Scotland']
${ni-radio-btn}   xpath://input[@value='NI']
${wales-radio-btn}   xpath://input[@value='Wales']

*** Keywords ***

#England location radio buttons
Select London Radio Button
    Click Element   ${london-radio-btn}

Select South East Radio Button
    Click Element   ${south-east-radio-btn}

Select Midlands Irealand Radio Button
    Click Element   ${midland-radio-btn}

Select South West Radio Button
    Click Element   ${south-west-radio-btn}

Select East Radio Button
    Click Element   ${east-radio-btn}

Select North East And Yorkshire Radio Button
    Click Element   ${north-east-yorkshire-radio-btn}

Select North West Radio Button
    Click Element   ${north-west-radio-btn}


# Devolved Nations radio buttons
Select Scotland Radio Button
    Click Element   ${scotland-radio-btn}

Select Northern Irealand Radio Button
    Click Element   ${ni-radio-btn}

Select Wales Radio Button
    Click Element   ${wales-radio-btn}
