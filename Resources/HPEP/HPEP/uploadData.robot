*** Variables ***
${setup}                     //li//div[@data-aura-class="setupGear"]
${setup-drop-down-menu}      //span[@class="Setup"]
${launch-wizard}              //a[text() = "Launch Wizard!"]
${details-tab}                  //a[text()='Details']
*** Keywords ***

Click on setup link
    Click Element   ${setup}

Select the setup menu item
    Click Element   ${setup-drop-down-menu}

Launch the import wizard
    Click Element   ${launch-wizard}

Go to Details tab
    Click Element   ${details-tab}

Close mini tab
    click element       //li/div//button[contains(@title,'Close')]

Close all mini tabs
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   //li/div//button[contains(@title,'Close')]
    Run Keyword If    ${present}    Close mini tab