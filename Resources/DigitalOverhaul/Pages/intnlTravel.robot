*** Variables ***
${red-list-ctrys}           //h3[@id="red-list-countries-and-territories"]
${trav-abroad}              //h3[@id="travelling-abroad-during-covid-19"]
${trav-rules-scot-wales}    //h3[@id="guidance-for-scotland,-wales-and-northern-ireland"]
${red-list-exp}             //button[@id='red-list-countries-and-territories-header']
${trav-eng-exp}             //summary[@id="travel-from-england-summary"]



*** Keywords ***

Select red list countries and territories
    Click Element   ${red-list-ctrys}

Select travelling abroad during COVID-19
    Click Element   ${trav-abroad}

Select Travel rules for Scotland, Wales and Northern Ireland
    Click Element   ${trav-rules-scot-wales}

Select red list countries and territories expander
    Click Element   ${red-list-exp}
