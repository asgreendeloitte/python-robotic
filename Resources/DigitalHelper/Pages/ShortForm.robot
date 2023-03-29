*** Variables ***
# Note the contact name and description form fields do not have any label or name attributes (heading are used instead)
# so I have used field types as a work around, but a defect should be raised to fix this
${myself-field}         //input[@value='Myself']

${name-field}           //input[@name='Full name']
${email-field}          //input[@name='Email']
${message-field}        //textarea[@class='nhsuk-textarea']

*** Keywords ***
Select Myself (Who are you completing this form for) Radio Button
    Click Element   ${myself-field}

Input Contact Name
    [Arguments]  ${name}
    Input Text  ${name-field}    ${name}

Input Email Address
    [Arguments]  ${email}
    Input Text  ${email-field}     ${email}

Clear Email Address
    Clear Element Text      ${email-field}

Input Message
    [Arguments]  ${message}
    Input Text  ${message-field}      ${message}

Input All Short Form Fields
    [Arguments]  ${name}  ${email}  ${description}
    Input Contact Name   ${name}
    Input Email Address   ${email}
    Input Description    ${description}


