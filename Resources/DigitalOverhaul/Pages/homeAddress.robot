*** Variables ***
${cant-find-addresss}            //a[@href="../../../../../find-a-test-result/enquiry/someone-else/home-address/manual"]
${house-number-name}              //input[@id="house-number-or-name"]
${street-name}                   //input[@id="street-name"]
${town-city-name}                //input[@id="town-or-city"]
${postcode}                      //input[@id="postcode"]


*** Keywords ***

Click I can't find my address in the list - someoneelse
    Click Element   ${cant-find-addresss}

Input the House number or name
    [Arguments]  ${house-name}
    Input Text  ${house-number-name}    ${house-name}

Input the Street name
    [Arguments]  ${street}
    Input Text  ${street-name}     ${street}

Input the Town or city
    [Arguments]  ${town}
    Input Text  ${town-city-name}     ${town}

Input the postcode into the field
    [Arguments]  ${pin}
    Input Text  ${postcode}     ${pin}