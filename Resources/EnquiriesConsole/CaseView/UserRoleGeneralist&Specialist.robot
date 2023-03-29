*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  DateTime

*** Variables ***

${SearchKnowledgeArticles}      xpath://input[@title='Search Knowledge...']
${SelectArticle}                xpath://span[@title='What is the NHS Test and Trace Support Payment Scheme?']

*** Keywords ***
Change Owner To Generalist User
    [Arguments]  ${queue-name}
    ${change-owner}=     Set Variable      //button[@title='Change Owner']
    ${people-icon}=     Set Variable      //img[@title='Users']
    ${User-field}=     Set Variable      //input[@title='Search Users']
    ${result-option}=     Set Variable    //div[@title='${queue-name}']
    ${change-owner-btn}=     Set Variable   //button[@name='change owner']

    Click Element       ${change-owner}
    Sleep  2s
    Click Element       ${people-icon}
    Sleep  2s
    #Select Drop down option     Users
    Click Element        //ul/li/a[@title='Users']
    Sleep  2s
    Input Text       ${User-field}  Hasen Tier 2 Test & Trace
    Click Element   ${result-option}
    Sleep  2s
    Click Element At Coordinates   ${change-owner-btn}     0   0
    sleep   4s
    ${success-message}=     Set Variable      //span[@class='toastMessage slds-text-heading--small forceActionsText']
    Wait Until Page Contains Element    ${success-message}
    sleep   4s


Change Owner To Specialist User
    [Arguments]  ${queue-name}
    ${change-owner}=     Set Variable      //button[@title='Change Owner']
    ${people-icon}=     Set Variable      //img[@title='Users']
    ${User-field}=     Set Variable      //input[@title='Search Users']
    ${result-option}=     Set Variable    //div[@title='${queue-name}']
    ${change-owner-btn}=     Set Variable   //button[@name='change owner']

    Click Element       ${change-owner}
    Sleep  2s
    Click Element       ${people-icon}
    Sleep  2s
    Select Drop down option     Users
    Sleep  2s
    Input Text       ${User-field}  Hasen Tier 2 Test & Trace
    Click Element   ${result-option}
    Sleep  2s
    Click Element At Coordinates   ${change-owner-btn}     0   0
    sleep   4s
    ${success-message}=     Set Variable      //span[@class='toastMessage slds-text-heading--small forceActionsText']
    Wait Until Page Contains Element    ${success-message}
    sleep   4s



Agent access Knowlege Articles
     ${SearchKnowledgeArticles}=     Set Variable      //input[@title='Search Knowledge...']
     Click Element At Coordinates     ${SearchKnowledgeArticles}     0   0
     Sleep  3s
    # Click Element       ${SearchKnowledgeArticles}
     Input Text    ${SearchKnowledgeArticles}   What is the NHS Test and Trace Support Payment Scheme?
     Sleep  2s
     PRESS KEYS  None   ARROW_DOWN
     Sleep  3s
#     PRESS KEYS  None   ARROW_DOWN
#     Sleep  3s
      PRESS KEYS  None   ENTER
#     Click Element  ${SelectArticle}
     Sleep   4s
     Page Should contain   What is the NHS Test and Trace Support Payment Scheme?