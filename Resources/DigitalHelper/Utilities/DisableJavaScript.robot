*** Variables ***
${warning-btn}          //button[@id="warningButton"]
${search-bar}           //input[@id="about-config-search"]
${javascript-toggle}    (//button[@title='Toggle'])[2]

*** Keywords ***
Disable JavaScript (Firefox)
    Sleep   2s
    Go To   about:config
    Click Element       ${warning-btn}
    Sleep   1s
    Input Text  ${search-bar}   javascript
    Sleep   2s
    Click Element   ${javascript-toggle}
    Sleep   2s