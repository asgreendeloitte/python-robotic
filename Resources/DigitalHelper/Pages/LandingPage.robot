*** Variables ***
${start-now-btn}   xpath://button[contains(text(), 'Start now')]

*** Keywords ***
Click Get Started
    Click Element   ${start-now-btn}
