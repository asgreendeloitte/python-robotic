*** Settings ***
Library    SeleniumLibrary
Resource    ../../EnquiriesConsole/GlobalButtons.robot
Library     String
*** Variables ***
${new-button}                     //a[@title='New']

*** Keywords ***

Create a new Account
    Click Element       ${new-button}
    Sleep    2s
    Input Text    //input[@placeholder="First Name"]    Pablo Test
    ${numbers}=    Generate random string    4    0123456789
    Input Text    //input[@placeholder="Last Name"]   ${numbers}
    Input Text    //input[@name="DEP_Case_Subject__c"]   Testing
    Click Element    //button[@name="SaveEdit"]
    Sleep    3s

Create a new Account asocciated to AvianFluAutumn2022
    Click Element       ${new-button}
    Sleep    2s
    Input Text    //input[@placeholder="First Name"]    Pablo Test
    ${numbers}=    Generate random string    4    0123456789
    Sleep    2s
    Input Text    //input[@placeholder="Last Name"]   ${numbers}
    Input Text    //input[@name="DEP_Case_Subject__c"]   AvianFlu2022Autumn_SMS
    Click Drop Down By Name(HPEP)        HPT Zone
    Select Drop down option(HPEP)         South East London
    Click Element    //button[@name="SaveEdit"]
    Sleep    3s

Create a new Account asocciated to AvianFluAutumn2022 as admin user
    Click Element       ${new-button}
    Sleep    2s
    Click Element     //span[text()='Person Account']/ancestor::label/span
    Click Element     //span[text()='Next']
    Input Text    //input[@placeholder="First Name"]    Pablo Test
    ${numbers}=    Generate random string    4    0123456789
    Sleep    2s
    Input Text    //input[@placeholder="Last Name"]   ${numbers}
    Input Text    //input[@name="DEP_Case_Subject__c"]   AvianFlu2022Autumn_SMS
    Click Drop Down By Name(HPEP)        HPT Zone
    Select Drop down option(HPEP)         South East London
    Click Element    //button[@name="SaveEdit"]
    Sleep    3s

Go to Test Campaign
    Click Element      //a[@title="Test Campaign"]

Go to AvianFlu2022 Campaign
    Click Element      //a[@title="AvianFlu2022Autumn_SMS"]

View all campaigns members
    Click Element   //span[@title="Campaign Members"]

Click quick actions in campaign tab
    Click Element    //a[@title="Show 2 more actions"]

Select All Folders
    Click Element    //a[@title="All Folders"]

Search folder
    [Arguments]     ${folder-name}
    Input Text    //input[@placeholder="Search all folders..."]    ${folder-name}

Select the folder
    Click Element     //lightning-formatted-url

Open the folder
    [Arguments]     ${folder-to-select}
    #Execute JavaScript    document.querySelectorAll("lightning-formatted-url a[title='${folder-to-select}']")[0].click();
    Click Element   //a[text()='${folder-to-select}']/parent::lightning-formatted-url

Open the report
    [Arguments]     ${report-name}
    Click Element   //a[text()="${report-name}"]/parent::lightning-formatted-url

Click on Override Campaign Status
    Click Element    //a[@title="Override Campaign Status"]

Change status to
    [Arguments]     ${status}
    Select Frame    //iframe[@title="accessibility title"]
    Click Element      //lightning-select//select[@name="HPEP_Campaign_Member_Status"]
    Click Element    //option[text()='${status}']
     ${numbers}=    Generate random string    4    0123456789
     ${override_reason} =   Catenate    Test   ${numbers}
    Input Text    //div/textarea   ${override_reason}
    Click element   //button[text()='Finish']

Click quick actions
    Click Element    //li[@data-target-reveals="sfdc:CustomButton.CampaignMember.DEP_Override_Monitoring_Day,sfdc:CustomButton.CampaignMember.DEP_Campaign_Member_History"]

Click on Related tab
    [Arguments]     ${index}=1
    Click Element    (//a[@data-label="Related"])[${index}]

Click on Details tab
    Click Element    //a[@title="Details"]

Click Drop Down By Name(HPEP)
    [Arguments]     ${name}
    sleep   2s
    ${dropdown-box}=     Set Variable       //lightning-combobox//label[contains(text(), '${name}')]/ancestor::lightning-combobox//div
    Click Element At Coordinates       ${dropdown-box}    0   0

Select Drop down option(HPEP)
    [Arguments]     ${option}   ${index}=1
    sleep   2s
    Click Element       (//span[@title="${option}"])[${index}]

Open the campaign member from the account layout
    Click on Related tab
    Sleep   3s
    Click element   (//span[@title="Campaign Members"])[last()]
    Sleep   3s
    Click element   (//span/a[@target="_self"])[2]
    Sleep   3s

Click on Override Monitoring date
    Click element  //a[@title="Override Monitoring Day"]

Click on Finish button
    Click Element    //button[text()='Finish']

Select the campaign member
    [Arguments]     ${name}
    sleep   2s
    Click Element    //a[text()='${name}']

Click on Save button
    Click Element    //button[@name="SaveEdit"]

Click on New button
    Click Element    //button[text()="New"]

Go to the DEP Campaign Member Comms Logs
    Click Element    (//span[text()='Campaign Member Comms Log']//ancestor::div[2]//span)[3]

Open HPEP Comms Logs
    [Documentation]  Pre-requiste - Agent must be on the Campaign member layout
    Click Element   //span[text()='HPEP Comms Log Id']//ancestor::div[2]//a

Open Todays All Outcome report
    Click Element    //div[@title="Today's All Outcomes"]

Open Todays Referrals report
    Click Element    //div[@title="Today's Referrals"]

Open Todays Non Responders report
    Click Element    //div[@title="Today's Non Responders"]

Open Todays New Members report
    Click Element    //li[@data-target-reveals="sfdc:CustomButton.Campaign.HPEP_Todays_New_Members,sfdc:CustomButton.Campaign.HPEP_Todays_Comms_Count"]
    Click Element   //div[@title="Today's New Members"]

Open campaign member
    Click Element     //a[contains(text(),"Pablo Test")]

Click on Override Date of Final SMS
    Click Element    //a[@title="Override Date of Final SMS"]

Date of final SMS
    [Arguments]     ${date-final-sms}
    Select Frame    //iframe[@title="accessibility title"]
    Click Element     //input[@name="HPEP_Date_of_Final_SMS"]
    Input Text      //input[@name="HPEP_Date_of_Final_SMS"]     ${date-final-sms}
     ${numbers}=    Generate random string    4    0123456789
     ${override_reason} =   Catenate    Test   ${numbers}
    Input Text    //div/textarea   ${override_reason}
    Click element   //button[text()='Finish']

Click Edit1
    [Arguments]        ${index}=1
    ${edit-btn}=     Set Variable   (//div[@title='Edit'])[${index}]
    Click Element       ${edit-btn}
    sleep   1s

Select Checkbox By Name - DEP
    [Arguments]     ${name}
    ${checkbox}=     Set Variable       //span[contains(text(), '${name}')]/../../../div/input
    Select Checkbox     ${checkbox}

Execute the flow
#    Go To Salesforce login
#    Login as Admin Agent
#    Sleep   2s
    Go to flow HPEP Desynchronise from MC
    Sleep   3s
    Page should contain     HPEP Desynchronise from MC
    Click element   //builder_platform_interaction-start-node-trigger-button[@tabindex="0"]
    ${current-date}=     Get Current Date      result_format=%d/%m/%Y
    ${time}=     Get Current Date      UTC     result_format=%H:%M:%S
    ${time2}=     Add Time To Time      ${time}     120     timer       exclude_millis=yes
    Log     ${time2}
    Input Text    //input[@name="startDate"]    ${current-date}
    Input Text    //input[@name="startTime"]    ${time2}
    Click element   //button[@title="Done"]
    Sleep   5s
    Click element   //button[@title="Save As"]
    Sleep   5s
    Click element  //div[@class="modal-container slds-modal__container"]/div[@class="modal-footer slds-modal__footer"]//button[@title="Save"]
    Sleep   7s
    Click element   //button[@title="Activate"]
    Sleep   7s
    Click element       //button[@title="Run"]
    Sleep    3s
    Go to Campaigns Tab