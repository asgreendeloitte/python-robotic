*** Variables ***
${when-to-stay-home}                  //button[@id='when-to-stay-at-home-header']
${read-the-guidance}                  //a[@href="https://www.gov.uk/guidance/people-with-symptoms-of-a-respiratory-infection-including-covid-19"]
${when-stay-home-new-window}          //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/self-isolation-and-treatment/when-to-self-isolate-and-what-to-do"]
${gen-stay-home}                      //button[@id='general-stay-at-home-support-header']
${find-local-council}                 //a[@href=" https://www.gov.uk/coronavirus-local-help"]
${mental-supp-wellbeing}              //button[@id='mental-health-and-wellbeing-support-header']
${urgent-help}                        //a[@href="https://www.nhs.uk/mental-health/advice-for-life-situations-and-events/where-to-get-urgent-help-for-mental-health/"]
${stay-at-home-case-number-element}   //div[@id='gov-panel-body']/div
${support-at-home}                    //button[@id='support-at-home-header']
${domestic-violence}                  //a[@href="https://www.nhs.uk/live-well/healthy-body/getting-help-for-domestic-violence/"]
${web-chat}                           //span[@id="helpButtonSpan"]


*** Keywords ***

Click the when to stay at home link
     Click Element   ${when-to-stay-home}

Click on Read the guidance for people with symptoms of respiratory infections including COVID-19 link
     Click Element   ${read-the-guidance}

Click on the When to stay at home if you have COVID-19 link
     Click Element   ${when-stay-home-new-window}

Click the General stay at home support link
     Click Element   ${gen-stay-home}

Click on find your local council link
    Click Element   ${find-local-council}

Click on mental health and wellbeing support
     Click Element   ${mental-supp-wellbeing}

Click on Where to get urgent help for mental health link
    Click Element   ${urgent-help}

Click support at home expander
   Click Element   ${support-at-home}

Click on Find help for domestic violence and abuse
    Click Element   ${domestic-violence}


