*** Settings ***
Library  String
Resource    ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

*** Variables ***
${label-within-table-header}              //span[text()="thv"]/parent::button/parent::h3/parent::div/div/div/slot/records-record-layout-row/slot/records-record-layout-item/div/div/div/span[text()="lhv"]
${search}                                 (//input[@role='combobox'])[1]
${recently-viewed}                        //div[@class="slds-page-header__name-switcher"]
${information-rights-reviewer}            //li//a//span[text()="Information Rights Reviewer"]
${public-enquiries-reviewer}              //li//a//span[text()="Public Enquiries"]
${public-complaints-reviewer}             //li//a//span[text()="Public Complaints Reviewer"]
${search-approver}                        (//div[@role='none']//input[@placeholder='Search Accounts...'])[2]
${comments-text-box}                       //div[@class='slds-rich-text-editor__textarea slds-grid editor ql-container']//div[@role='textbox']
${approval-date-picker}                    //span[@class="slds-day weekday todayDate selectedDate DESKTOP uiDayInMonthCell--default"]
${approval-date-field}                     //div[@class='slds-form-element__control slds-input-has-icon slds-input-has-icon_right']//input[@name='PPAT_Date_of_Approval__c']
${action-tab}                              (//li[@title= 'Actions']//a[@class= 'slds-tabs_default__link'])[1]
${accessibility-note}                       //span[@class='slds-form-element__label']//span[contains(text(),'Accessibility Note')]
${edit-restricted-btn}                     //button[@title="Edit Restricted"]
${account-save}                            //*[@name='SaveEdit']
${email-tab}                               //a[@data-tab-name="FeedItem.TextPost"]
${from-email-content}                       (//div//a[text()="Email To Case- Test <enquiries@test-and-trace.nhs.uk>"])[1]
${to-email-content}                         //span[@class="slds-pill__label"]
${post-text-box}                            //div[@role="textbox"]
${share-btn}                                //div//button[@class="slds-button slds-button_brand cuf-publisherShareButton qe-textPostDesktop SMALL"]
${comment-text-box}                        (//*[@role="textbox"])[2]
${comment-save}                             //button[@class='slds-button slds-button--brand cuf-publisherShareButton SMALL uiButton']//span[text()="Save"]
${search-box}                               //input[@title='Search People']
${information-section}                      //span[@class="test-id__section-header-title"][text()="Information"]
${pq-section}                               //span[@class="test-id__section-header-title"][text()="PQ"]
${birth-certificate-form-id}                xpath: //span[@title="Birth Certificate"]
${driving-licence-form-id}                  xpath: //span[@title="Driving Licence"]
${eea-identity-identity-card}               xpath: //span[@title="EEA Identity Card"]
${national-identity-card}                   xpath: //span[@title="National Identity Card"]
${passport}                                 xpath: //span[@title="Passport"]
${residence-permit}                         xpath: //span[@title="Residence Permit"]
${Information-Rights-Reviewer-queue}        //span[contains(text(), 'Information Rights Reviewer')]/../../a
${move-chosen-right}                        xpath: (//button[@title="Move selection to Chosen"])[2]

*** Keywords ***

Information is present within the section
    [Arguments]  ${table-header}        ${label-header}
    ${element-xpath} =   Replace String   ${label-within-table-header}   thv     ${table-header}
    ${result} =   Replace String   ${element-xpath}   lhv     ${label-header}
    Page Should Contain Element            ${result}

Select the recently viewed list view
    Click Element   ${recently-viewed}

Select information rights reviewer from the list view
    Click Element   ${information-rights-reviewer}

Select public enquiries from the list view
    Click Element   ${public-enquiries-reviewer}

Select public complaints reviewer from the list view
    Click Element   ${public-complaints-reviewer}

Go to Actions tab
    Click Element       ${action-tab}

Check the restricted Case edit button
    Click Element   ${edit-restricted-btn}

Save the edited account
    Click Element    ${account-save}

Check the restricted Case check box
    ${restricted-checkbox}=     Set Variable   //input[contains(@name,'PPATRestricted__c')]
    sleep   3s
    Click Element   ${restricted-checkbox}
    sleep   3s

Click the email tab
    Execute JavaScript    document.querySelector("li.uiTabItem a[title='Post']").click();
    Sleep       2s
    Execute JavaScript    document.querySelector("li.uiTabItem a[title='Email']").click();
    Sleep       10s

Click the post tab
    Execute JavaScript    document.querySelector("li.uiTabItem a[title='Post']").click();
    Sleep       5s

Click the contribution case tab
    Execute JavaScript    document.querySelector("li.uiTabItem a[title='Contribution Case']").click();
    Sleep       5s

Share the posted comments
    Click Element       ${share-btn}

Click the Comment tab
    Sleep  2s
    Execute JavaScript    document.querySelector("li.uiTabItem a[title='Comment']").click();
    Sleep       5s

Save the Comment
    Sleep  2s
    Click Element       ${comment-save}

Search for the team member I want to add
   Click Element        ${search-box}


