
*** Variables ***

${Container}                            xpath://div[@class='SMALL uiTabset--base uiTabset--task uiTabset oneActionsComposer forceActionsContainer]
${Emails-btn}                           xpath:(//li[@class='uiTabItem'])[0]
${emailsTab}                            xpath://button[@title='Write an email...']/parent::div
${compose}                              xpath://button[@title='Compose']
${inserttemplateJS}                     (//span[contains(text(),"Insert, create, or update template")])[0]
${inserttemplate}                       xpath:(//span[contains(text(),'Insert, create, or update template')])[0]
${TemplateInsert}                       xpath://a[text()='Insert a template...']/parent::*
${CaseTypeVal1}                          xpath://lightning-formatted-text[contains(text(),'Feedback')]
${CaseTypeVal}                          xpath:(//span[@class='test-id__field-value slds-form-element__static slds-grow word-break-ie11'])[15]
${ECDTraceFeedbackEmailTemplate1}        xpath://button[@title='ECD Trace Feedback Email Template']
${ECDTraceFeedbackEmailTemplate}        xpath://button[@title='ECD Trace Feedback Email Template']
${sendButton}                           xpath://button[@class='slds-button slds-button--brand cuf-publisherShareButton SMALL send uiButton']
${OptionValue}                          xpath://button[@title='Write an email...']
${SearchTemplate}                          xpath://input[@placeholder='Search templates...']
${SearchTemplateValue}                      International

${SearchTemplateValue1}                     Data Deletion Request

${ToSelection}                //input[contains(@class,' default input uiInput uiInputTextForAutocomplete uiInput--default uiInput--input uiInput uiAutocomplete uiPillContainerAutoComplete uiInput--default uiInput--lookup')]
${ToSelectionValue}            gg@gmail.com
${save}                         (//span[contains(text(), 'Save')])[2]
${textArea}                         //span[text()='Body']/parent::label/parent::div/textarea

*** Keywords ***


Log to console the Case Type Value of case
        Log To Console   \n
        ${Casetype}=     Get Value    ${CaseTypeVal}
        Log to Console        ${Casetype}
        Sleep   3s



EFC Agent drafts email for test case
        #Wait Until Element Is Enabled       ${Emails-btn}
        Sleep   4s
       Execute JavaScript    document.querySelector("li.uiTabItem a[title='Email']").click();   #####Emails Tab
        Sleep  4s

EFC Agent drafts email for trace case
        Wait Until Element Is Enabled       ${emailsTab}
        Sleep   4s
        Execute JavaScript    document.querySelectorAll('.dummyButtonCallToAction')[0].click()   #### click on Write and email..

Agent Enters To value in Email
        Sleep  2s
        Click Element

EFC Agent selects the Email template

        Sleep  3s
        Execute JavaScript    document.querySelectorAll('.slds-icon-utility-insert-template')[0].click()   ###insert an template button
        Sleep  3s
        Click Element       ${TemplateInsert}
         Sleep  3s
         Click Element  ${SearchTemplate}
         Input Text  ${SearchTemplate}   ECD Test Feedback
        Press Keys   ${SearchTemplate}   ENTER
        Sleep  3s
        Select Email Type Template      ECD Test Feedback Email Template
        Execute JavaScript          document.querySelectorAll('.cuf-publisherShareButton')[0].click()   #####option to insert template
        Sleep  3s
Expert Trace Agent selects the Email template

        Sleep  3s
        Execute JavaScript    document.querySelectorAll('.slds-icon-utility-insert-template')[0].click()   ###insert an template button
        Sleep  3s
        Click Element       ${TemplateInsert}
        Execute javascript  window.scrollTo(0,300)
        Search IA Template
        Select Email Type Template      ECD: International Arrivals - Data Deletion Request
        Execute JavaScript          document.querySelectorAll('.cuf-publisherShareButton')[0].click()   #####option to insert template
        Sleep  3s
Expert Trace Agent selects the Email IA Email template

        Sleep  3s
        Execute JavaScript    document.querySelectorAll('.slds-icon-utility-insert-template')[0].click()   ###insert an template button
        Sleep  3s
        Click Element       ${TemplateInsert}
        Execute javascript  window.scrollTo(0,300)
       Search IA Email Template
        Select Email Type Template      ECD: International Arrivals - Data Deletion Request
        Execute JavaScript          document.querySelectorAll('.cuf-publisherShareButton')[0].click()   #####option to insert template
        Sleep  3s
Agent selects the Email template - RIT

        Sleep  3s
        Execute JavaScript    document.querySelectorAll('.slds-icon-utility-insert-template')[0].click()   ###insert an template button
        Sleep  3s
         Execute javascript  window.scrollTo(0,800)
         Sleep  3s
        Click Element       ${TemplateInsert}
        Sleep  3s
         Click Element  ${SearchTemplate}
         Input Text  ${SearchTemplate}   ECD Test Feedback
        Press Keys   ${SearchTemplate}   ENTER
        Sleep  3s
        Select Email Type Template      ECD Test Feedback Email Template
        Execute JavaScript          document.querySelectorAll('.cuf-publisherShareButton')[0].click()   #####option to insert template
        Sleep   3s

Select Email Type Template
    [Arguments]     ${option}
    sleep   4s
    Click Element       (//button[@title="${option}"])

Click Send
    Sleep  2s
    Click Element          ${sendButton}

Search IA Template
    Click Element  ${SearchTemplate}
    Input Text  ${SearchTemplate}    ${SearchTemplateValue}
    Press Keys   ${SearchTemplate}   ENTER
    Sleep  2s
Search IA Email Template
    Click Element  ${SearchTemplate}
    Input Text  ${SearchTemplate}    ${SearchTemplateValue1}
    Press Keys   ${SearchTemplate}   ENTER
    Sleep  2s


EFC Agent adds comment for test case
        Sleep  4s
        Execute JavaScript    document.querySelector("li.uiTabItem a[title='Comment']").click();
        Execute javascript  window.scrollTo(0,400)
        Input Text      ${textArea}     The quick brown fox jumps over the lazy dog
        PRESS KEYS  ${textArea}   TAB
        Sleep  3s
        Execute JavaScript   document.querySelectorAll('.cuf-publisherShareButton')[0].click()




