*** Variables ***
${nhs-covid19-app}               //h4[@id="the-nhs-covid-19-app"]
${data-privacy}                  //h3[@id="data-and-privacy"]
${data-privacy-expander}         //button[@id='data-and-privacy-header']
${data-privacy-info}             //a[@href="https://www.gov.uk/guidance/nhs-covid-19-app-your-data-and-privacy"]
${nhs-app-link}                  //a[@href="https://www.nhs.uk/nhs-app/"]
${nhs-app-info-link}              //a[@href="https://www.nhs.uk/nhs-app//"]
${contact-nhs-app-team}          //a[@href="https://www.nhs.uk/contact-us/nhs-app-contact-us"]
${nhs-covid19-header}            //a[@href="../../nhs-covid-19-app"]
${use-setting-app}               //h3[@id="using-and-setting-up-the-app"]
${use-setting-app-expander}      //button[@id='using-and-setting-up-the-app-header']
${wht-the-app-does}              //button[@id='what-the-app-does-and-how-it-works-header']
${wht-the-app-does-tile}         //h3[@id='what-the-app-does-and-how-it-works']
${app-does-how-it-works-link}    //button[@id='what-the-app-does-and-how-it-works-header']
${trble-shooting-tech-info}      //h3[@id="troubleshooting-and-technical-information"]
${trble-shooting-tech-link}      //button[@id='troubleshooting-and-technical-information-header']
${get-trouble-shooting-link}     //a[@href="https://www.gov.uk/government/publications/nhs-covid-19-app-user-guide/nhs-covid-19-app-troubleshooting-and-technical-information"]
${what-the-app-does-link}        //a[@href="https://www.gov.uk/government/publications/nhs-covid-19-app-user-guide/nhs-covid-19-app-what-the-app-does"]
${how-the-app-works-link}        //a[@href="https://www.gov.uk/government/publications/nhs-covid-19-app-user-guide/nhs-covid-19-app-how-the-app-works"]
${who-can-use-the-app}           //a[@href="https://www.gov.uk/government/publications/nhs-covid-19-app-user-guide/nhs-covid-19-app-who-can-use-the-app"]
${how-to-use-the-app}            //a[@href="https://www.gov.uk/government/publications/nhs-covid-19-app-user-guide/nhs-covid-19-app-how-to-use-the-app"]
${how-to-download}               //a[@href="https://www.gov.uk/guidance/nhs-covid-19-app-download-and-set-up-guide"]

*** Keywords ***

Click the nhs covid-19 app link
     Click Element   ${nhs-covid19-app}

Click the data and privacy link
     Click Element   ${data-privacy}

Click the data and privacy expander
     Click Element   ${data-privacy-expander}

Click the data and privacy information link
     Click Element   ${data-privacy-info}

Click the nhs app information link
     Click Element   ${nhs-app-link}

Click the nhs app information hyperlink
     Click Element   ${nhs-app-info-link}

Click the contact the nhs app team link
    Click Element   ${contact-nhs-app-team}

Click the nhs covid-19 app header link
    Click Element   ${nhs-covid19-header}

Click using and setting up the app tile
    Click Element   ${use-setting-app}

Click using and setting up the app expander
    Click Element   ${use-setting-app-expander}

Click what the app does and how it works tile
    Click Element   ${wht-the-app-does-tile}

Click trouble shooting and technical information tile in NHS Covid19 app
    Click Element   ${trble-shooting-tech-info}

Click trouble shooting and technical information link
    Click Element   ${trble-shooting-tech-link}

Click on get help trouble shooting and techincal information link that opens in a new window
    Click Element   ${get-trouble-shooting-link}

Click on what the app does and how it works expander
    Click Element   ${app-does-how-it-works-link}

Click on find out what the app does that opens in a new window
    Click Element   ${what-the-app-does-link}

Click on find out how the app works that opens in a new window
    Click Element   ${how-the-app-works-link}

Click on find out who can use the app works that opens in a new window
    Click Element   ${who-can-use-the-app}

Click on how to use the app works that opens in a new window
    Click Element  ${how-to-use-the-app}

Click on how to download and set up the app that opens in a new window
    Click Element  ${how-to-download}
