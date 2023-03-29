*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${stay-home}                      //input[@id="stay-home"]
${international-travel}           //input[@id="international-travel"]
${contact-tracing}                //input[@id="contact-tracing"]
${pcr-test}                       //input[@id = "pcr-test"]
${ctry-eng}                       //input[@id = "england"]
${onsite-service}                 //input[@id="on-site-service-not-satisfactory"]
${results-inconclusive}           //input[@id="results-inconclusive"]
${results-void}                   //input[@id="results-void"]
${test-not-received}              //input[@id="test-not-received-in-a-usable-condition"]
${unable-to-contact}              //input[@id="unable-to-contact-the-provider"]
${unable-to-submit}              //input[@id="unable-to-submit-results"]
${other-option}                  //input[@id="other"]
${full-name}                     //input[@id="full-name"]
${change-complaint-reason}       //div[@id='reason-for-complaint']//a
${complaint-details}             //textarea[@name="complaint-textarea"]
${submit-complaint}              //a[@id="submit-complaint"]
${submit-a-complaint}            //button[@id="submit-complaint"]


*** Keywords ***

Click the complaint main reason as On-site service not satisfactory
    Click Element   ${onsite-service}

Click the complaint main reason as Results inconclusive
    Click Element   ${results-inconclusive}

Click the complaint main reason as Results void
    Click Element   ${results-void}

Click the complaint main reason as Test not received in a usable condition
    Click Element   ${test-not-received}

Click the complaint main reason as Unable to contact the provider
    Click Element   ${unable-to-contact}

Click the complaint main reason as Unable to submit results
    Click Element   ${unable-to-submit}

Click the complaint main reason as Other
    Click Element   ${other-option}

Click topic contact tracing
    Click Element   ${contact-tracing}

Select PCR as the complaint about
    Click Element   ${pcr-test}

Select Englnd as the country the test was delivered to
    Click Element   ${ctry-eng}

Input the booking reference number
    [Arguments]  ${barcode-id}
    Input Text  id:yes-reference-input-text     ${barcode-id}

Enter the details of your complaint
    [Arguments]  ${complaint-details}
    Input Text  id:your-complaint    ${complaint-details}

Input your full name
    [Arguments]  ${text}
    Input Text  ${full-name}    ${text}

Click Change button to change the reason for complaint
    Click Element   ${change-complaint-reason}

Click submit complaint form
    Click Element   ${submit-complaint}

Click Submit a Complaint Form
    Click Element    ${submit-a-complaint}

Click International Travel Complaint radio button
    Click Element    ${international-travel}