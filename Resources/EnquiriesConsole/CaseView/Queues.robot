*** Settings ***
Library    SeleniumLibrary
*** Variables ***
# Generic variables
${navigation-dropdown}          //button[@title='Show Navigation Menu']
${cases-option}                 //a[@title='Cases']
${list-views-menue}             //button[@title='Select a List View']
#${list-views-menue}             //button[@title='Select List View']
${queue-search}                 //input[@class='slds-input default input uiInput uiInputTextForAutocomplete uiInput--default uiInput--input']
${global-search-button}         //button[@class='slds-button slds-button_neutral search-button slds-truncate']
${global-search}                //div/button[@aria-label="Search"]
${global-search-cases}          //input[@placeholder='Search Cases and more...']

${first-list-option}            //a[@data-refid='recordId']
${first-list-option1}           (//a[@data-refid='recordId'])[1]
${date-time-opened}             //th[@title='Date/Time Opened']/div/a

# EFC
${efc-central-test-queue}       //span[contains(text(), 'EFC Central Test')]/../../a
${efc-central-trace-queue}      //span[contains(text(), 'EFC Central Trace')]/../../a

# Trace
${trace-generalist-queue}       //span[contains(text(), 'Generalist Enquiries – Trace')]/../../a
${inbound-tier2-trace-queue}       //span[contains(text(), 'Inbound 119 Tier 2 - All')]/../../a
${recently-viewed-queue}       //span[contains(text(), 'Recently Viewed')]/../../a
${trace-specialist-queue}       //span[contains(text(), 'Specialist Enquiries – Trace')]/../../a
${trace-expert-queue}           //span[contains(text(), 'Expert Enquiries – Trace')]/../../a
${trace-expert-queue1}           //span[contains(text(), 'UKHSA Expert 119 Team')]/../../a
#//span[contains(text(), 'Expert Team - Test & Trace')]/../../a
${inbound-tier2-queue1}           //span[contains(text(), 'Inbound 119 Tier 2 - Trace')]/../../a
${ia-surge-team-queue}          //span[contains(text(), 'UKHSA MQS Inbound')]/../../a
#//span[contains(text(), 'MQS IA Team')]/../../a
${my-open-cases}                //span[contains(text(), 'My Open Cases')]/../../a

${ia-surge-team-exemptions}     //span[contains(text(), 'IA Surge Team - Exemptions')]/../../a

#Complaints-Team-trace-queue
${Complaints-trace-queue}       //span[contains(text(),'Complaints Team – Test & Trace')]/../../a
#//span[contains(text(), 'Complaints Team – Trace')]/../../a

${RIT-queue}                    //span[contains(text(), 'UKHSA Results Investigation Team Cases')]/../../a
#//span[contains(text(), 'RIT Cases')]/../../a

# Test
${test-generalist-queue}        //span[contains(text(), 'Generalist Enquiries - Test')]/../../a
${inbound-119-tier2-test}         //span[contains(text(), 'Inbound 119 Tier 2 - Test')]/../../a
${inbound-119-tier2-trace}         //span[contains(text(), 'Inbound 119 Tier 2 - Trace')]/../../a
${complaints-team-test}         //span[contains(text(), 'Complaints Team – Test')]/../../a
${test-specialist-queue}        //span[contains(text(), 'Specialist Enquiries - Test')]/../../a
#//span[@class=' virtualAutocompleteOptionText']/mark

${test-expert-queue}            //span[contains(text(), 'Expert Enquiries - Test')]/../../a
${IANTO-queue}                  //span[contains(text(), 'IANTO Team')]/../../a

${dh-email-test-queue}            //span[contains(text(), 'Digital Helper and Email Cases - Test')]/../../a

${MP-queue}                     //span[contains(text(), 'MP Trace')]/../../a
#//span[@class=' virtualAutocompleteOptionText']/mark
#//span[contains(text(), 'MP Trace')]/../../a



${tabs-container}               //div[@role='tablist']
${tab-element}                  //ul[@class='tabBarItems slds-grid']/li

${order}                        //th[@title='Date/Time Opened']/div/span

${chevron-svg}                  //button[@class='slds-button slds-button_icon-container slds-button_icon-x-small']
${close-tab-btn}                //li[@title='Close Tab']

${close-btn}                    //button[@class='slds-button slds-button_icon slds-button_icon-x-small slds-button_icon-container']

${RTSLTS-queue}       (//span[contains(text(),'RTS/LTS & MTU Advisors')])[1]
#//span[contains(text(),'LTS - RTS Advisors')]



${ia-team-exemptions_Unaccompanied}   //span[contains(text(), 'IA Exemptions - Unaccompanied Minors')]/../../a

${ia-exemptions_team}               //span[contains(text(), 'IA Exemptions Team')]/../../a

${test-Complaints-queue}             //span[contains(text(),'Complaints Team – Test & Trace')]/../../a

#//span[contains(text(),'Complaints Team – Test')]/../../a

${MQS-exemptions_Mailbox}           //span[contains(text(),'MQS Exemptions Mailbox')]/../../a

${MQS-Enquiries_Mailbox}            //span[contains(text(),'MQS General Enquiries Mailbox')]/../../a

${MQS-Exemptions_CaseType}          //span[contains(text(),'UKHSA MQS Inbound - Exemptions')]/../../a
#//span[contains(text(),'MQS IA Team - Exemptions (Case Type)')]/../../a

${MQS-MP_Enquiries}                 //span[contains(text(),'MQS MP Enquiries Mailbox')]/../../a

${SelectListView}                               xpath://div[@class='test-listviewdisplayswitcher forceListViewManagerDisplaySwitcher']
${TableView}                                    xpath://li[@title='Table']

# Case numbers
${case-number-element}      //div[@class='govuk-panel__body']/div/div
${case-number}=     Get Text      ${case-number-element}
${search}       //input[@placeholder='Search this list...']

# Case Comments
#${Case-comment-text}    div.uiInput[class='uiInput uiInputTextArea uiInput--default uiInput--textarea']
${Case-comment-text}    //div[@class='uiInput uiInputTextArea uiInput--default uiInput--textarea']
${case-list-search}     //*[@class='slds-input default input uiInput uiInputTextForAutocomplete uiInput--default uiInput--input']
#${case-list-search}     //span[contains(text(),'MP Trace')]/../..
${Public-enquires-contribution-queue}       //span[contains(text(), 'Public Enquiries Contribution Cases')]/../../a
${Parliamentary-contribution-queue}       //span[contains(text(), 'Parliamentary Contribution Cases')]/../../a

*** Keywords ***
Reset View (if applicable)
#    Reload Page
    Wait Until Element Is Visible      ${tabs-container}  timeout=15
    sleep   3s

    ${tabs-count}=  Get Element Count   ${tab-element}
    ${tabs-count} =	Evaluate	${tabs-count}-1

    Run Keyword If    ${tabs-count}>0    Reset View   ${tabs-count}

Reset View
    [Arguments]  ${tabs}
    FOR    ${tab}    IN RANGE   ${tabs}
        Close Tab
    END

Table View
    Sleep  2s
    Click Element    ${SelectListView}
     Sleep   5s
    Click Element    ${TableView}

Close Tab
    sleep   2
    Click Element   ${close-btn}
    sleep   4s


Open cases tab and select list view
    Go To Cases Tab
    Sleep   3s
    Click Element   ${list-views-menue}

Open Reports tab and select list view
    Go To Reports Tab
   # Click Element   ${list-views-menue}

Open IANTO Reports tab
    Go To Ianto-cc Reports Tab

Open knowledge tab and select list view
    Go To Knowledge Tab
    #Click Element   ${list-views-menue}

Open testproviders tab
    Go To Testproviders Tab

Open liveissues tab
    Go To Liveissues Tab

Change Date/Time Opened to Descending (if applicable)
    Wait Until Element Is Visible      ${order}  timeout=10s
    ${order}    Get Text    ${order}
    Run Keyword If    '${order}'=='Sorted Ascending'    Click Element      ${date-time-opened}

# Trace queues
## Generalist Trace
Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${trace-generalist-queue}
#    Table View
    sleep   3s
    Change Date/Time Opened to Descending(if applicable)
    sleep   3s

Display Most Recent Cases From inbound tier2 – Trace Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${inbound-tier2-trace-queue}
#    Table View
    sleep   3s
    Change Date/Time Opened to Descending(if applicable)
    sleep   3s


Display Most Recent Cases Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${recently-viewed-queue}
#    Table View
    sleep   3s

Display Most Recent Cases From My open cases Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${my-open-cases}
#    Table View
    sleep   3s
    Change Date/Time Opened to Descending(if applicable)
    sleep   3s

Open Most Recent Case From My open cases Queue
    Display Most Recent Cases From My open cases Queue
    Click Element   ${first-list-option1}
    sleep   3s

Open Most Recent Case From inbound tier2 – Trace Queue
    Display Most Recent Cases From inbound tier2 – Trace Queue
    Click Element   ${first-list-option}
    sleep   3s


Open Most Recent Case From Generalist Enquiries – Trace Queue
    Display Most Recent Cases From Generalist Enquiries – Trace Queue
    Click Element   ${first-list-option}
    sleep   3s

## Specialist Trace
Display Most Recent Cases From Specialist Enquiries – Trace Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${trace-specialist-queue}
   # Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Case From Specialist Enquiries – Trace Queue
    Display Most Recent Cases From Specialist Enquiries – Trace Queue
    Click Element   ${first-list-option}
    sleep   3s

## Expert Trace
Display Most Recent Cases From Expert Enquiries – Trace Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${trace-expert-queue1}
   # Table View

    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Display Most Recent Cases From Inbound 119 Tier 2 - Trace Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${inbound-tier2-queue1}
   # Table View

    Change Date/Time Opened to Descending(if applicable)
    sleep   5s


Open Most Recent Case From Expert Enquiries – Trace Queue
    Display Most Recent Cases From Expert Enquiries – Trace Queue
    Click Element   ${first-list-option}
    sleep   3s

Open Most Recent Case From Inbound 119 Tier 2 - Trace Queue
    Display Most Recent Cases From Inbound 119 Tier 2 - Trace Queue
    Click Element   ${first-list-option}
    sleep   3s


##IA Surge Team
Display Most Recent Cases From MQS IA Team Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${ia-surge-team-queue}
#    Table View
#    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Case From MQS IA Team Queue
    Display Most Recent Cases From IA Surge Team Queue
    Click Element   ${first-list-option}
    sleep   3s

Open Most Recent Case From MQS IA Team Queue1
    Display Most Recent Cases From MQS IA Team Queue
    Click Element   ${first-list-option}
    sleep   3s


##IA Surge Team Exemptions
Display Most Recent Cases From IA Surge Team Exemptions Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${ia-surge-team-exemptions}
   # Table View
#    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Case From IA Surge Team Exemptions Queue
    Display Most Recent Cases From IA Surge Team Exemptions Queue
    Click Element   ${first-list-option}
    sleep   3s


#IA Exemption Queue-Unaccompanied minors
Display Most Recent Cases From IA Surge Team Exemptions unaccompanied minors Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${ia-team-exemptions_Unaccompanied}
   # Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Case From IA Surge Team Exemptions unaccompanied minors Queue
    Display Most Recent Cases From IA Surge Team Exemptions unaccompanied minors Queue
    Click Element   ${first-list-option}
    sleep   3s

#IA Exemptions Team

Display Most Recent Cases From IA Exemptions Team Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${ia-exemptions_team}
   # Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Display Most Recent Cases From MQS Exemptions Mailbox Team Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${MQS-exemptions_Mailbox}
   # Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Display Most Recent Cases From MQS General Enquiries Mailbox Team Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${MQS-Enquiries_Mailbox}
   # Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s
Display Most Recent Cases From MQS IA Team - Exemptions (Case Type) Team Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${MQS-Exemptions_CaseType}
   # Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Display Most Recent Cases From MQS MP Enquiries Mailbox Team Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${MQS-MP_Enquiries}
   # Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Case From IA Exemptions Team Queue
    Display Most Recent Cases From IA Exemptions Team Queue
    Click Element   ${first-list-option}
    sleep   3s


# Test queues

## Generalist Test
Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${test-generalist-queue}
    #Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s


Display Most Recent Cases From inbound tier2 - Test Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${inbound-119-tier2-test}
    #Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   8s

Display Most Recent Cases From inbound tier2 - Trace Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${inbound-119-tier2-trace}
    #Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   8s

Open Most Recent Cases From General Complaints & Enquiries- Test Queue
    Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Click Element   ${first-list-option}
    sleep   3s


Display Most Recent Cases From IANTO - Team Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${IANTO-queue}
    #Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s


Display Knowledge From IANTO - Team Queue
    Reset View (if applicable)
    #Open cases tab and select list view
    Open knowledge tab and select list view
    #Click Element   ${IANTO-queue}
    #Table View
    #Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Cases From IANTO - Team Queue
    Display Most Recent Cases From IANTO - Team Queue
    Click Element   ${first-list-option}
    sleep   3s


Display Reports From IANTO - Team Queue
    Reset View (if applicable)
    #Open cases tab and select list view
    Open Reports tab and select list view
    #Click Element   ${IANTO-queue}
    #Table View
    #Change Date/Time Opened to Descending(if applicable)
    sleep   5s
Display IANTO Reports
  Reset View (if applicable)
  Open IANTO Reports tab
  sleep   5s
Open Most Recent Case From General Complaints & Enquiries- Test Queue
    Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Click Element   ${first-list-option}
    sleep   3s

Open Most Recent Case From inbound 119 tier2 - Test Queue
   # Display Most Recent Cases From General Complaints & Enquiries- Test Queue
   Display Most Recent Cases From inbound tier2 - Test Queue
    Click Element   ${first-list-option}
    sleep   3s

Open Most Recent Case From inbound 119 tier2 - Trace Queue1
   # Display Most Recent Cases From General Complaints & Enquiries- Test Queue
   Display Most Recent Cases From inbound tier2 - Trace Queue
    Click Element   ${first-list-option}
    sleep   3s


## Specialist Test
Display Most Recent Cases From Specialist Complaints & Enquiries- Test Queue

    Reset View (if applicable)
    Open cases tab and select list view
    Sleep  3s
    #Click Element   ${case-list-search}
    #Input Text      ${case-list-search}     Specialist Enquiries - Test
    Click Element   ${test-specialist-queue}
    #Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s


Open Most Recent Case From Specialist Complaints & Enquiries- Test Queue
    Display Most Recent Cases From Specialist Complaints & Enquiries- Test Queue
    Click Element   ${first-list-option}
    sleep   3s

Display Most Recent Cases From Digital Helper and Email Cases - Test Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${dh-email-test-queue}
    #Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   3s

Open Most Recent Case From Digital Helper and Email Cases - Test Queue
    Display Most Recent Cases From Digital Helper and Email Cases - Test Queue
    Click Element   ${first-list-option}
    sleep   3s

## Expert Test
Display Most Recent Cases From Expert Complaints & Enquiries - Test Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${test-expert-queue}
   # Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Case From Expert Complaints & Enquiries- Test Queue
    Display Most Recent Cases From Expert Complaints & Enquiries - Test Queue
    Click Element   ${first-list-option}
    sleep   3s

# EFC Central Team
## EFC Test queue
Display Most Recent Cases From E&C Central Test Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${efc-central-test-queue}
   # Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Case From E&C Central Test Queue
    Display Most Recent Cases From E&C Central Test Queue
    Click Element   ${first-list-option}
    sleep   3s

## EFC Trace queue
Display Most Recent Cases From E&C Central Trace Queue
#    Reset View (if applicable)
#    sleep   10s
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${efc-central-trace-queue}
   # Table View
#    Change Date/Time Opened to Descending(if applicable)
    sleep   5s


Open Most Recent Case From E&C Central Trace Queue
    Display Most Recent Cases From E&C Central Trace Queue
    Click Element   ${first-list-option}
    sleep   3s


Display Most Recent Cases From Complaints Team - Trace Queue
     Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${Complaints-trace-queue}
#    Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Case From Complaints Team - Trace Queue
    Display Most Recent Cases From Complaints Team - Trace Queue
    Click Element   ${first-list-option}
    sleep   3s

Display Most Recent Cases From MP Trace Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Sleep  3s
    #Click Element   ${case-list-search}
    #Input Text      ${case-list-search}     MP Trace
    Click Element    ${MP-queue}

#    Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Case From MP Trace Queue
    Display Most Recent Cases From MP Trace Queue
    Click Element   ${first-list-option}
    sleep   3s
Display Most Recent Cases From RIT Queue
     Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${RIT-queue}
#    Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Case From RIT Queue
    Display Most Recent Cases From RIT Queue
    Click Element   ${first-list-option}
    sleep   3s
Display Most Recent Cases From RIT Queue private view
    Reset View (if applicable)
    Open cases tab and select list view
    Page Should Contain     UKHSA Results Investigation Team Cases
    Page Should Contain     UKHSA Results Investigation Team Closed

Display Most Recent Cases From RTS/LTS Queue - New
     Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${RTSLTS-queue}
   # Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Case From RTS/LTS Queue - New
    Display Most Recent Cases From RTS/LTS Queue - New
    Click Element   ${first-list-option}
    sleep   3s

## Complaints Team Test
Display Most Recent Cases From Complaints Team – Test Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${test-Complaints-queue}
#    Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

Open Most Recent Case From Complaints Team – Test Queue
    Display Most Recent Cases From Complaints Team – Test Queue
    Click Element   ${first-list-option}
    sleep   3s

########### will show closed cases
Display Most Recent Cases From Complaints Team/Test
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${complaints-team-test}
    Sleep   5s
#    Table View
#    Change Date/Time Opened to Descending(if applicable)
    sleep   5s

######################## Short forms recieved

Display Most Recent Cases From Complaints Team – Test Queue CN
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${test-Complaints-queue}
#    Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s
    Click Element   ${search}
    Input Text      ${search}     ${case-number}
    sleep   2s
    PRESS KEYS  None   ENTER
    sleep   2s
    Click Element   ${first-list-option}

Display Most Recent Cases From Digital Helper and Email Cases - Test Queue CN
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${dh-email-test-queue}
    #Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   3s
    Click Element   ${search}
    Input Text      ${search}     ${case-number}
    sleep   2s
    PRESS KEYS  None   ENTER
    sleep   2s
    Click Element   ${first-list-option}

Display Most Recent Cases From Complaints Team - Trace Queue CN
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${Complaints-trace-queue}
#    Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s
    Click Element   ${search}
    Input Text      ${search}     ${case-number}
    sleep   2s
    PRESS KEYS  None   ENTER
    sleep   2s
    Click Element   ${first-list-option}

Display Most Recent Cases From PPAT Contribution Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${Parliamentary-contribution-queue}
#    Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   3s
    #Click Element   ${first-list-option}
#     Click Element   ${search}
#    Input Text      ${search}    03382269
#    sleep   2s
#    PRESS KEYS  None   ENTER
#    sleep   2s
#    Click Element   ${first-list-option}

Display Most Recent Cases From Specialist Enquiries – Trace Queue CN
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${trace-specialist-queue}
   # Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   5s
    Click Element   ${search}
    Input Text      ${search}     ${case-number}
    sleep   5s
    PRESS KEYS  None   ENTER
    sleep   2s
    Click Element   ${first-list-option}

Get Case Number
    Wait Until Element Is Visible     ${case-number-element}
    Sleep  7s
    ${case-number}=     Get Text      ${case-number-element}

Inbound Expert Private List View Check
    Reset View (if applicable)
    Open cases tab and select list view
    #Page Should Contain     Generalist Enquiries - Test
    #Page Should Contain     Generalist Enquiries – Trace
    #Page Should Contain     Specialist Enquiries - Test
    Page Should Contain     Complaints Team – Test & Trace
    Page Should Contain     UKHSA Expert 119 Team

MP Trace Private List View Check
    Reset View (if applicable)
    Open cases tab and select list view
    Page Should Contain     UKHSA MQS Inbound
    Page Should Contain     UKHSA MQS Inbound - Exemptions
    Page Should Contain     MQS Exemptions Mailbox
    Page Should Contain     MQS General Enquiries Mailbox
    Page Should Contain     MQS MP Enquiries Mailbox


MQS Agent Private List View Check
    Reset View (if applicable)
    Open cases tab and select list view
    Page Should Contain     MQS Exemptions Mailbox
    Page Should Contain     MQS General Enquiries Mailbox
    Page Should Contain     UKHSA MQS Inbound
    Page Should Contain     UKHSA MQS Inbound - Exemptions
    Page Should Contain     MQS MP Enquiries Mailbox
    Page Should Contain     IA Exemptions Team
    Page Should Contain     IA Exemptions - Unaccompanied Minors

LTS&RTS Private List View Check
    Reset View (if applicable)
    Open cases tab and select list view
    Page Should Contain     RTS/LTS & MTU Advisors

User selects list view on Knowledge object
    [Arguments]     ${queue-name}
    Go To Knowledge Tab
    Click Element   //button[@title='Select a List View']
    Sleep    2s
    Click Element    //span[text()= '${queue-name}']/ancestor::a

User archives a Knowledge article
     Click Element   (//*[@class="slds-grid slds-grid--align-spread slds-align_absolute-center checkbox-container slds-checkbox uiInput forceVirtualCheckbox uiInput--default"])[4]
     #(//tr//td)[2]
     Click Element    //div[@title='Archive']
     Click Element    //span[text()='Archive']/ancestor::button
     Page Should Contain    article was archived.