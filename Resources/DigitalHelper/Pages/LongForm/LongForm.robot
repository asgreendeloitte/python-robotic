*** Variables ***

# Note the contact name and description form fields do not have any label or name attributes (heading are used instead)
# so I have used field types as a work around, but a defect should be raised to fix this
${name-field}         //input[@name='Full name']

${email-field}        //input[@name='Email']

${phone-number-field}        //input[@name='telephone-number']

# Are you contacting us on behalf of someone else?
${myself-radio-btn}           //input[@value='Myself']
${someone-else-radio-btn}            //input[@value='Someone else']

${hotel-not-listed-link}           //a[contains(text(), 'My hotel is not listed here')]
${hotel-name-field}                 //input[@name='hotel-name']
${hotel-street-field}               //input[@name='address-line-1']
${hotel-town-field}                 //input[@name='address-town']
${hotel-postcode-field}             //input[@name='address-postcode']

# Date of test?
${day-field}                 //input[@name='Day']
${month-field}               //input[@name='Month']
${year-field}                //input[@name='Year']

${test-barcode-field}         (//input[@type='text'])[5]
#${test-barcode-ia-field}     //input[@name='Test barcode']

${yes-ia-barcode-radio-btn}           //input[@value='Yes, I know the test barcode']
${ia-barcode-field}            //input[@name='Yes, I know the test barcode']

${message-field}         //textarea[@class='nhsuk-textarea']

${Submit Form IA}       //button[contains(text(),'Submit a form')]

${Enquiry}             //input[@value='Enquiry']
${ContactTracing}       //input[@value='Contact tracing']
${stayingathome}             //input[@value='Stay at home support']
${home-support-myself-or-someone}        //input[@value='I need stay at home support for myself or someone I care for']
${support-not-safe-at-home}     //input[@value='I need support because I do not feel safe at home']

#Home Address
${HouseNumber}  //input[@name="House number or name"]
${StreetName}   //input[@name="Street name"]
${TownOrCity}   //input[@name="Town or City"]
${Postcode}     //input[@name="address-search"]
${Postcode_lookup}  (//ul[contains(@class, 'nhsuk-list nhsc-disable-margin_bottom nhsc-prediction-pane')]/li)[1]

*** Keywords ***
Input Contact Name (Long Form)
    [Arguments]  ${name}
    Input Text  ${name-field}     ${name}

Input Email Address (Long Form)
    [Arguments]  ${email}
    Input Text  ${email-field}     ${email}

Input Phone Number (Long Form)
    [Arguments]  ${number}
    Input Text  ${phone-number-field}     ${number}

Select Someone Else Radio Button (Long Form)
    Click Element   ${someone-else-radio-btn}

Select Myself Radio Button (Long Form)
    Click Element   ${myself-radio-btn}

Input Test Barcode (Long Form)
    [Arguments]  ${test-barcode}
    Input Text  ${test-barcode-field}     ${test-barcode}

Input Test Barcode (IA Form)
    [Arguments]  ${ia-barcode}
    Click Element   ${yes-ia-barcode-radio-btn}
    Input Text  ${ia-barcode-field}     ${ia-barcode}

Input Day (Long Form)
    [Arguments]  ${day}
    Input Text  ${day-field}     ${day}

Input Month (Long Form)
    [Arguments]  ${month}
    Input Text  ${month-field}     ${month}

Input Year (Long Form)
    [Arguments]  ${year}
    Input Text  ${year-field}     ${year}

Input Message (Long Form)
    [Arguments]  ${message}
    Input Text  ${message-field}     ${message}

Click My hotel is not listed here
    Click Element   ${hotel-not-listed-link}

Input Hotel Name
    [Arguments]  ${name}
    Input Text  ${hotel-name-field}     ${name}

Input Hotel Street
    [Arguments]  ${street}
    Input Text  ${hotel-street-field}     ${street}

Input Hotel Town
    [Arguments]  ${town}
    Input Text  ${hotel-town-field}     ${town}

Input Hotel Postcode
    [Arguments]  ${postcode}
    Input Text  ${hotel-postcode-field}     ${postcode}

Input All Long Form Fields
    Input Contact Name (Long Form)     Robot Reeta
    Input Email Address (Long Form)    reeta@test.com
    Select No (Myself) Radio Button (Long Form)
    Input Day (Long Form)               25
    Input Month (Long Form)             12
    Input Year (Long Form)              2020
    Input Test Barcode (Long Form)      123abc
    Input Message (Long Form)       The quick brown fox jumps over the lazy dog.

Submit Form
        Click Element  ${Submit Form IA}
        Sleep  2s

Click Enquiry Button
    Sleep  2s
    Click Element   ${Enquiry}
    Sleep  2s

Click Contact Tracing button
    Sleep  2s
    Click Element    ${ContactTracing}
    Sleep  2s

Click staying at home button
    Sleep  2s
    Click Element    ${stayingathome}
    Sleep  2s

Click staying at home support for myself or someone button
    Sleep  2s
    Click Element    ${home-support-myself-or-someone}
    Sleep  2s


Input Home Address of person who took the test
    Sleep   2s
    #Input Text  ${HouseNumber}   1
    #Input Text  ${StreetName}    Test Street
    #Input Text  ${TownOrCity}    London
    Input Text  ${Postcode}      LD1
    Sleep   6s
    Click Element  ${Postcode_lookup}
