*** Settings ***
Library  AxeLibrary

*** Variables ***
${accessibility-statement}               //a[@href="https://dhqa-dho.cs110.force.com/accessibility-statement"]
${enquiries-accessibility-statement}     //a[@href="https://enquiries.test-and-trace.nhs.uk/s/"]
${ability-net}                           //a[@href="https://mcmw.abilitynet.org.uk/"]
${efc-accessibility-mail}                //a[@href="mailto:efc-accessibility@test-and-trace.nhs.uk"]
${its-accessibility-statement}           //a[@href="https://itstest-dho.cs80.force.com/accessibility-statement"]
${uat-accessibility-statement}           (//a[contains(text(),'Accessibility statement')])

*** Keywords ***

Click on accessibility statement link in the footer
    Click Element   ${accessibility-statement}

Click on its accessibility statement link in the footer
    Click Element   ${its-accessibility-statement}

Click on uat accessibility statement link in the footer
    Click Element   ${uat-accessibility-statement}

Click on the get help with coronavirus (COVID-19) enquiries and complaints service
    Click Element   ${enquiries-accessibility-statement}

Click on ability net hyperlink
    Click Element   ${ability-net}

Click on efc accessibility email address
    Click Element   ${efc-accessibility-mail}





