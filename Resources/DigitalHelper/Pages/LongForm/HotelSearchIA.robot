*** Variables ***
#Hotel Search Validation -IA - Red list country
${Hotel_Search}         //input[contains(@placeholder,'Search')]
${Hotel_Search_Name}      Premier Inn London
${Hotel_Search_FirstOption}   (//ul[contains(@class, 'slds-listbox slds-listbox_vertical')])[1]
${yes-radio-btn_test}           //input[@value='Yes, I have taken a test']
${error-heading1}               Search for the hotel where you took the test
*** Keywords ***
Hotel Search Validation
    Click Element   ${Hotel_Search}
    Input Text    ${Hotel_Search}    ${Hotel_Search_Name}
    Click Element    ${Hotel_Search_FirstOption}

Select Yes (I have taken test) Radio Button (IA)
    Click Element   ${yes-radio-btn_test}

Check Error Message Content(IA Hotel Search)
    Page Should Contain        ${error-heading1}