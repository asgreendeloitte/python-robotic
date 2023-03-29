*** Settings ***
Resource    ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

*** Variables ***
${related-tab}              //li//a[@id="relatedListsTab__item"]
${details-tab}              //li//a[@id="detailTab__item"]
${case-team}                //h2//a//span[@title="Case Team"]
${case-history}             //h2//a//span[@title="Case History"]
${close-sub-tab}            (//button[@tabindex="0"])[4]

*** Keywords ***
Click Related Tab
    Click Element   ${related-tab}

Click Case Team section
    Click Element   ${case-team}

Close sub tab section
    Click Element  ${close-sub-tab}

Click Case History section
    Click Element   ${case-history}

Click Details Tab
    Click Element   ${details-tab}