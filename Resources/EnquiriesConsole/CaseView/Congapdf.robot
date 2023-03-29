*** Variables ***
${Search-Conga-Template}                    //input[@title='Search Conga Templates']

${InputTemplate}                            CMT-0000

${account-name-lookup-first-option}         (//ul[contains(@class, 'lookup__list')]/li)[1]

${Dropdown_Icon_Congo}                      //button[contains(@class,'slds-button slds-button_icon-border-filled')]
${Compose_Letter_Test}                       //span[contains(text(),'Compose Letter Trace')]
${Related_Tab}                              //a[contains(text(),'Related')]
${Pdf_select}                                //div[contains(@class,'slds-show_inline-block slds-float_left slds-p-left--x-small slds-truncate slds-m-right_x-small')]
${Pdf_Close}                                  //button[contains(@title,'Close')]
*** Keywords ***
Conga Template selection
        Sleep  4s
        Execute javascript  window.scrollTo(0,1200)
        Click Element      ${Search-Conga-Template}
        Input Text    ${Search-Conga-Template}     ${InputTemplate}
        Mouse Down    ${account-name-lookup-first-option}
        Click Element     ${account-name-lookup-first-option}
        Sleep  2s
        Click Save
        Sleep  2s
        Execute Javascript    window.location.reload(true);
        Sleep   6s
        Click Element    ${Dropdown_Icon_Congo}
        Click Compose Letter
        Sleep  18s
        Click Element  ${Related_Tab}
        Sleep  3s
        Execute javascript  window.scrollTo(0,100)
        Click Element   ${Pdf_select}
        Sleep  4s
        Page Should Contain   NHS Test and Trace Enquiry Service
        Sleep  2s
        Click Element






