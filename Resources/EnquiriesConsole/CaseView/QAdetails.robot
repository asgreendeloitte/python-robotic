*** Settings ***
Resource    ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/CloseCaseTab/CloseCase.robot

*** Variables ***

${edit-icon_RAG}       xpath://button[@title='Edit RAG Status']

${Comment_Box_Tag}     xpath://span[contains(text(),'Comments from QA')]

${Comment_Box}          xpath://textarea[@class=' textarea']

${Comment_Box_Value}    Adding the valid comments

${Save}                 xpath://span[contains(text(),'Save')]
*** Keywords ***

Click Edit Status RAG Icon

    Set Focus To Element    ${edit-icon_RAG}
    Sleep  2s
    Press Keys  None  RETURN
    Sleep  3s
    Scroll Tab Into View By Name    QA
QA Details Edit without filling any details
    Sleep   2s
    Click Edit Status RAG Icon
    Click Save (bug fix)
    Check Error Message Content
    Click Cancel (bug fix)
    Sleep  2s
QA Details Edit without filling Comments

    Click Edit Status RAG Icon
    Click Drop Down By Name (bug fix)    RAG Status
     Select Dropdown Option (bug fix)      Green
#     Sleep  2s
       Click Save (bug fix)
      Check Error Message Content
      Click Cancel (bug fix)
      Sleep  2s

QA Details Edit by adding all details
      Click Edit Status RAG Icon
        Click Drop Down By Name (bug fix)    RAG Status
        Select Dropdown Option (bug fix)      Green
        Sleep  2s
        Execute javascript  window.scrollTo(0,300)
     Click Comment Box
#      Input Text Area for CommentBox     TestingForQA
#      Sleep  2s
     Click Save (bug fix)
      Sleep  4s
      Page Should Contain   Green
      Page Should Contain    Area
      Page Should Contain    Date and Time of QA
      Page should contain     Name of Team Lead completing QA

#      ${response}=    Get Text    xpath=//span[contains(text(), 'Name of Team Lead completing QA')]
#       Should Contain Any    ${response}     GeethaTest Specialist