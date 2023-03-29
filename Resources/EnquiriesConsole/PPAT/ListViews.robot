*** Settings ***
Resource    ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

*** Variables ***
${Parliamentary-queue}             //span[contains(text(), 'PPAT Parliamentary')]/../../a
${first-list-option}               (//a[@data-refid='recordId'])[2]
${parly-review-list}               //span[contains(text(), 'PPAT Parliamentary Review')]/../../a
${search-box}                      //div//div//input[@role="combobox"]
${ppat-covid19-helpline}           //span//mark[text()="PPAT COVID-19 Helpline"]
${ppat-parly-review}               //span//mark[text()="PPAT Parliamentary Review"]
${ppat-consultations-list-view}    //span//mark[text()="PPAT Consultations"]
${ppat-parliamentary-view}        //span//mark[text()="PPAT Parliamentary"]
${ppat-parly-open-cases}          //span//mark[text()="PPAT Parly (All Open Cases)"]
${ppat-parly-closed-cases}        //span//mark[text()="PPAT Parly (All Closed Cases)"]
${ppat-parly-pqs}                 //span//mark[text()="PPAT PQs"]
${ppat-parly-pos}                 //span//mark[text()="PPAT POs"]
${no-results-mess}                //div[text()="No results found."]
${public-enq-review-list-view}    //span[text()='Public Enquiries Reviewer']
${public-enq-triage-list-view}    //span[text()='Public Enquiries - Triage']
${public-comp-triage-list-view}   //span[text()='Public Complaints - Triage']
${info-rights-triage-list-view}   //span[text()='Information Rights - Triage']
${fliter-icon}                     xpath: //button[@class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_last"]
${public-info-list-view}          //span[contains(text(), 'Information Rights Reviewer')]/../../a
${public-enq-list-view}          //span[contains(text(), 'Public Enquiries Reviewer')]/../../a
${public-complaints-list-view}    //span[contains(text(), 'Public Complaints Reviewer')]/../../a
${PPAT-Parly-reviewer}            (//span[contains(text(), 'PPAT Parliamentary Review')]/../../a)[1]
${list-view-controls}             //button[@title='List View Controls']
${new-list-view}                  //li[@class='slds-dropdown__item listViewSettingsMenuNew']
${new-list-input-box}             //input[@Type='text'][@name='title']
${save-new-listview}              //button[@class='slds-button slds-button--neutral test-confirmButton uiButton--default uiButton--brand uiButton']
${rename-list-view}               //li[@class='slds-dropdown__item listViewSettingsMenuRename']
${close-list-filter}              //button[@title='Close Filters']
${mp-trace-list-view}             (//span[contains(text(), 'MP Trace')]/../../a)[1]
${from-email-dropdown}            //a[@class='select']
${mqs-mp-enquiries-mailbox-list-view}             (//span[contains(text(), 'MQS MP Enquiries Mailbox')]/../../a)[1]

*** Keywords ***

Select the public enquiries list view
    Click Element       ${public-enq-list-view}

Superuser creates new list view
    Click Element           ${list-view-controls}
    Click Element       ${new-list-view}
    Input Text          ${new-list-input-box}  Automation Test List
    Click Element       ${save-new-listview}
    Sleep   3s
    Click Element       ${close-list-filter}

Superuser renames list view
    Click Element       ${list-view-controls}
    Click Element       ${rename-list-view}
    Input Text          ${new-list-input-box}  Edit list view name
    Click Element       ${save-new-listview}

Parli user selects MQS MP trace mailbox from option
    Execute JavaScript    document.querySelector("div.uiPopupTrigger a[class='select']").click();
    Click Element         //a[contains(@title,'MQS MP Enquiries')]
    Capture page screenshot

Display Most Recent Cases From info-rights-triage-list-view Queue
    Reset View (if applicable)
    Open cases tab and select list view
    Click Element   ${info-rights-triage-list-view}
    #Table View
    Change Date/Time Opened to Descending(if applicable)
    sleep   8s

Open Most Recent Case From info-rights-triage-list Queue

   Display Most Recent Cases From info-rights-triage-list-view Queue
    Click Element   ${first-list-option}
    sleep   3s
