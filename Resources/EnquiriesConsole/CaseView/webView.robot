*** Settings ***
Resource    ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot
Library    SeleniumLibrary

*** Variables ***
${new-case-btn}                          //a[@title='New']
${next-modal-btn}                        //button/span[contains(text(), 'Next')]
${omni-channel-offline-tab}              //span[text()='Omni-Channel (Offline)']
${omni-channel-status}                   xpath: //div[@class='slds-dropdown-trigger slds-dropdown-trigger_click']//button[@class='slds-button slds-button_icon-container slds-button_icon-x-small']
${chat-transcripts}                      xpath: //a//div//lightning-formatted-rich-text//p[@class='slds-truncate']//b[text()='Chat Transcripts']
${app_launcher}                          //*[@class='slds-icon-waffle']
${app_launcher_search}                   //*[@class='slds-input' and @placeholder='Search apps and items...']
${chat-transcript-list-view}             //button[@title='Select a List View']
${efc-web-chat}                           xpath: //li//a//span[text()='EFC WebChat']
${first-list-option}                      (//a[@data-refid='recordId'])[1]
${details-tab}                            //span[text()='Details']
${case-origin-webchat}                    xpath: //div//span[text()="WebChat"]
${case-origin-digital-helper}             xpath: //div/span//slot[@name="outputField"]//lightning-formatted-text[text()="Digital Helper"]
${omni-supervisor-object}                 xpath: //div//span//p//b[text()="Omni Supervisor"]
${agents-by-queue}                        xpath: //li//a//span[text()="Agents by Queue"]
${queues-backlog}                         xpath: //li//a//span[text()="Queues Backlog"]
${assigned-work}                          xpath: //li//a//span[text()="Assigned Work"]
${chat-trascript-details}                 xpath: //h2//a[text()='Chat Transcript Details']
${chat-transcript-component}              xpath: //div[@class="VIEW slds-card"]
${search-apps-launcher}                   xpath: //input[@placeholder='Search apps and items...']
${quick-text-app-launcher}                xpath: //a[@data-label='Quick Text']//p[@class='slds-truncate']
${all-folders-quick-text}                 xpath: //li[@class='slds-nav-vertical__item scope']//a[@title='All Folders']
${webchat-quick-text-folder}              xpath: //lightning-formatted-url[@data-navigation='enable']//a[@title='WebChat Quick Texts']//parent::*
${new-quick-text-button}                  xpath: //span[@class='platform-actions platform-action-has-right folderActionBar']//li[@class='slds-button slds-button--neutral']
${input-quick-text-name}                  xpath: //div[@class='uiInput uiInputText uiInput--default uiInput--input']//input[@type='text']
${message-field-quick-text-creation}      xpath: //div[@class='textAreaContainer slds-border_top']//textarea[@role='textbox']
${folder-button-quick-text-creation}      xpath: //button[@class='slds-button slds-button_neutral selectFolderButton']
${all-folders-quick-text-creation}        xpath: //lightning-button[@class='pickerRow pickerRowSelected']//button[@title='All Folders']
${quick-text-folders-quick-text-creation}        xpath: //button[@title='WebChat Quick Texts']
${select-folder-button-quick-text-creation}      xpath: //button[@title='Select Folder']
${save-quick-text-creation}               xpath: //button[@title='Save']
${success-message-quick-text-creation}               xpath: //span[@class='toastMessage slds-text-heading--small forceActionsText']
${edit-quick-quick-text}                   xpath: //div[@title='Edit']
${chat-sessions-app-launcher}              xpath: //a[@data-label='Chat Sessions']//p[@class='slds-truncate']
${expand-chat-sessions-listview}           xpath: //button[@title='Select a List View']
${todays-chat-session-listview}           xpath: (//span[@class=' virtualAutocompleteOptionText'])[5]
${last-seven-days-session-listview}       xpath: (//span[@class=' virtualAutocompleteOptionText'])[3]
${all-chat-sessions-listview}             xpath: (//span[@class=' virtualAutocompleteOptionText'])[1]
${show-filters}                           xpath: //button[@title='Show filters']
${close-filters}                          xpath: //button[@title='Close Filters']
${locked-filter}                           xpath: //lightning-icon[@class='slds-icon-utility-lock slds-button__icon slds-icon_container forceIcon']
${reports-app-launcher}                   xpath: //a[@data-label='Reports']//p[@class='slds-truncate']
${case-expander-on-chat-transcript}       xpath: (//a[@class='slds-align_absolute-center slds-button slds-button--icon slds-button--icon-border slds-button--icon-x-small'])[3]
${view-case-button}                       xpath: (//a[@title='View'][@role='menuitem'])[1]
${request-time-column}                    xpath: (//a[@class='toggle slds-th__action slds-text-link--reset '])[5]


*** Keywords ***

Click Omni Channel Offline tab
    Click Element   ${omni-channel-offline-tab}

Click Omni Channel status view
    Click Element  ${omni-channel-status}

Navigate to the Chat Transcript object
        Click Element   ${app_launcher}
        Click Element   ${app_launcher_search}
        Sleep  2s
        input text   ${app_launcher_search}   Chat Transcripts
        Sleep  2s
        Click Element   ${chat-transcripts}

Navigate to the Omni Supervisor object
        Click Element   ${app_launcher}
        Click Element   ${app_launcher_search}
        Sleep  2s
        input text   ${app_launcher_search}   Omni Supervisor
        Sleep  2s
        Click Element   ${omni-supervisor-object}

Select the List View titled EFC WebChat
        Click Element      ${chat-transcript-list-view}
        Sleep       2s
        Click Element      ${efc-web-chat}

Navigate to details tab in the case
    Sleep   5s
    Click Element       ${first-list-option}
    Sleep   5s
    Click Element       ${details-tab}


Click Outcome button
    ${outcome-btn}=     Set Variable   (//button[@title='Edit Outcome'])[1]
    sleep   1s
    Set Focus To Element    ${outcome-btn}
    Click Element      ${outcome-btn}
    sleep   1s
    Press Keys  None  RETURN
    sleep   1s

Create a WebChat case
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    Click Element                   ${next-modal-btn}
    Click Drop Down By Name         Case Origin
    Sleep   2s
    Select Drop down option         WebChat
    Click Drop Down By Name         Case type
    Sleep   2s
    Select Drop down option         Feedback
    Sleep   10s
    Click Save

Create a Digital Helper case
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    Click Element                   ${next-modal-btn}
    Click Drop Down By Name         Case Origin
    Select Drop down option         Digital Helper
    Sleep   3s
    Click Save

Select agents by queue
    Click Element       ${agents-by-queue}

Select queues by backlog
    Click Element      ${queues-backlog}

Select assigned work
    Click Element     ${assigned-work}

Content Manager navigates to All Folders folder Quick Text object
    Input Text        ${search-apps-launcher}    Quick Text
    Sleep    3s
    Click Element     ${quick-text-app-launcher}
    Click Element     ${all-folders-quick-text}
#    Click Element     ${webchat-quick-text-folder}

Content Manager creates a new Quick Texts record
    Click Element     ${new-quick-text-button}
    Sleep    3s
    Input Text        ${input-quick-text-name}    Automation Quick Text
    Input Text        ${message-field-quick-text-creation}    Creating new quick text regression testing
    Page Should Contain    Category
    Page Should Contain    Channel
    Click Element     ${folder-button-quick-text-creation}
    Click Element     ${all-folders-quick-text-creation}
    Click Element     ${quick-text-folders-quick-text-creation}
    Click Element     ${select-folder-button-quick-text-creation}
    Click Element     ${save-quick-text-creation}
    Page Should Contain Element    ${success-message-quick-text-creation}

Content Manager edits Quick Text record
    Click Element     ${edit-quick-quick-text}
    Sleep    3s
    Input Text        ${input-quick-text-name}    Automation Quick Text Edit record
    Click Element     ${save-quick-text-creation}
    Page Should Contain Element    ${success-message-quick-text-creation}
    Page Should Contain    Automation Quick Text Edit record

User navigates to Chat Sessions object
    Input Text        ${search-apps-launcher}    Chat Sessions
    Sleep    3s
    Click Element     ${chat-sessions-app-launcher}

User validates todays Chat Session listview
    Sleep    3s
    Click Element     ${expand-chat-sessions-listview}
    Click Element     ${todays-chat-session-listview}
    Page Should Contain    Chat Session Name
    Page Should Contain    Agent
    Page Should Contain    Login Time
    Page Should Contain    Logout Time
    Click Element     ${show-filters}
    Page Should Contain Element    ${locked-filter}
    Page Should Contain    Filter by Owner   All chat sessions
    Page Should Contain    Created Date      equals TODAY
    Click Element     ${close-filters}


User validates Last 7 days chat sessions listview
    Click Element     ${expand-chat-sessions-listview}
    Click Element     ${last-seven-days-session-listview}
    Page Should Contain    Chat Session Name
    Page Should Contain    Agent
    Page Should Contain    Login Time
    Page Should Contain    Logout Time
    Click Element     ${show-filters}
    Page Should Contain Element    ${locked-filter}
    Page Should Contain    Filter by Owner   All chat sessions
    Page Should Contain    Created Date      equals LAST 7 DAYS


User validates all chat sessions listview
    Click Element     ${expand-chat-sessions-listview}
    Click Element     ${all-chat-sessions-listview}
    Page Should Contain    Chat Session Name
    Page Should Contain    Agent
    Page Should Contain    Login Time
    Page Should Contain    Logout Time
    Page Should Contain Element    ${locked-filter}
    Page Should Contain    Filter by Owner   All chat sessions

User navigates to Report object
    Input Text        ${search-apps-launcher}    Report
    Sleep    3s
    Click Element     ${reports-app-launcher}

User opens Case record from Chat Transcript Record
    Click Element     ${case-expander-on-chat-transcript}
    Sleep    3s
    Click Element     ${view-case-button}