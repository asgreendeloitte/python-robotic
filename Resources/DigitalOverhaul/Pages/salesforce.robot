*** Variables ***
${vaccinationstatus}         //lightning-formatted-text[contains(text(),'Fully vaccinated')]
${vaccinationstatus-label}   (//*[@class='test-id__field-label'])[6]
${Test-type}                 //lightning-formatted-text[contains(text(),'PCR test')]
${Test-taken}                (//*[@class='slds-form-element__control'])[30]
${vacc-lightning-help-text}  //span[text()='Vaccination Status']/../../lightning-helptext

*** Keywords ***

Populate Fields From Vaccination Status Dropdown menu
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //span[contains(text(), '${name}')]/../../../div/div/div/div/div/a
    Click Element       (//div[@class="uiMenu"])[7]
    sleep   2s
    @{ITEMS}=     Set Variable       "Not fully vaccinated"       "Fully vaccinated"        "To be determined"
    Click Element       (//a[@title="Not fully vaccinated"])
    FOR    ${item}   IN   @{ITEMS}
        sleep   2s
        Page Should Contain Element      //a[@title=${item}]
    END


