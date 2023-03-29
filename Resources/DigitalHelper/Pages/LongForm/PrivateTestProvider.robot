*** Variables ***
${Day2-radiobutton}         //input[@id='option-value-Day-2-105']
${private-test-provider-radio-btn}   xpath://input[@value='Private test provider']
${private-test-provider-name}    //a[contains(text(), "I can't find the private test provider I'm looking for" )]
${private-test-provider-Auto}     //input[contains(@placeholder,'Search')]
${private-test-provider-AutoValue}    //h4[contains(text(), 'Randox Health LiverpoolONE')]
${private-test-provider-value}      Randox
${private-test-provider-search}   //input[@name='hotel-name']
${Booking-Reference-number}         (//input[@name='radio-input-undefined'][1])
${Booking-Reference-numberNo}         //input[@value=' No, I do not know the booking reference']
${Booking-Reference-number_Value}   //input[contains(@class,'nhsuk-input')]
${Booking-Reference-number_Value1}  ABCDE1234567
${Booking-Reference-number_Value2}  ABCDE12345678
${Reason-for-complaint}         //input[@value='Other']
${test-Complaint_About}         //input[@value='PCR Test']
${test-Complaint_About_rapid}    //input[@value='Rapid lateral flow test']
${country-test-delivered-to-england}    //input[@value='England']
${country-test-delivered-to-scotland}   //input[@value='Scotland']
${country-test-delivered-to-wales}      //input[@value='Wales']
${country-test-delivered-to-northern-ireland}   //input[@value='Northern Ireland']

*** Keywords ***
Select Type of Test complaint Day2 Radio button
    Click Element  ${Day2-radiobutton}

Select Private Test Provider Radio Button
        Click Element   ${private-test-provider-radio-btn}

Private Test Provider Name
        Click Element   ${private-test-provider-name}
        Sleep  3s
        Input Text   ${private-test-provider-search}   ${private-test-provider-value}
Private Test Provider Name AutoSearch
        Click Element     ${private-test-provider-Auto}
        Input Text     ${private-test-provider-Auto}      ${private-test-provider-value}
        Click Element    ${private-test-provider-AutoValue}

Select Yes Radio button booking reference number
        Click Element   ${Booking-Reference-number}
        Click Element   ${Booking-Reference-number_Value}
        Input Text   ${Booking-Reference-number_Value}   ${Booking-Reference-number_Value1}

Select Yes Radio button 13 character booking reference number
        Click Element   ${Booking-Reference-number}
        Click Element   ${Booking-Reference-number_Value}
        Input Text   ${Booking-Reference-number_Value}   ${Booking-Reference-number_Value2}

Select No Radio button booking reference number
        Click Element    ${Booking-Reference-number_No}
Select Other Radio button Reason for Complaint
        Click Element   ${Reason-for-complaint}


Select What test is your complaint about PCR Test
    Click Element     ${test-Complaint_About}
Select What test is your complaint about Rapid Lateral Flow
    Click Element    ${test-Complaint_About_rapid}

Select Country test delivered to as England
    Click Element  ${country-test-delivered-to-england}

Select Country test delivered to as Scotland
    Click Element  ${country-test-delivered-to-scotland}

Select Country test delivered to as Wales
    Click Element  ${country-test-delivered-to-wales}

Select Country test delivered to as Northern Ireland
    Click Element  ${country-test-delivered-to-northern-ireland}
