*** Settings ***
Library    SeleniumLibrary
Library     String
Resource    ../../../Resources/HPEP/HPEP/GlobalButtons.robot
Resource    ../../../Resources/EnquiriesConsole/GlobalButtons.robot
Resource    ../../EnquiriesConsole/CaseView/Queues.robot

*** Variables ***
${new-button}                     //a[@title='New']

*** Keywords ***

Create Comms Logs Item - Outcome Yes sympthoms
    [Documentation]  Pre-requiste - Agent must be on the DEP Campaign Member Comms Log layout
    Page Should Contain    DEP Campaign Member Comms Log
    ${account-name}=     Get Text      //span[text()='Account']/ancestor::div[2]//force-lookup[@slot="outputField"]//span
    Click on Related tab    2
    Click on New button
    Input Text    //label[text()='Account']/ancestor::lightning-grouped-combobox//input    ${account-name}
    Click Element        //label[text()='Account']/ancestor::lightning-grouped-combobox//ul/li/lightning-base-combobox-item
    Input Text    //input[@name='Campaign_JourneyId__c']   AvianFlu2022Autumn_SMS_Journey
    Click Drop Down By Name(HPEP)       Communication Direction
    Select Drop down option(HPEP)       Inbound
    Input Text    //label[text()='Communication Content MI']/ancestor::lightning-textarea//textarea    Inbound
    Click on Save button
    Sleep    3s
    Go to the DEP Campaign Member Comms Logs
    Click Edit      2
    Sleep  2s
    Click Drop Down By Name(HPEP)    Outcome
    Select Drop down option(HPEP)      Yes Symptoms
    Click on Save button
    Sleep    3s

Create Comms Logs Item - No responders
    [Documentation]  Pre-requiste - Agent must be on the DEP Campaign Member Comms Log layout
    Page Should Contain    DEP Campaign Member Comms Log
    ${account-name}=     Get Text      //span[text()='Account']/ancestor::div[2]//force-lookup[@slot="outputField"]//span
    Click on Related tab    2
    Click on New button
    Input Text    //label[text()='Account']/ancestor::lightning-grouped-combobox//input    ${account-name}
    Click Element        //label[text()='Account']/ancestor::lightning-grouped-combobox//ul/li/lightning-base-combobox-item
    Input Text    //input[@name='Campaign_JourneyId__c']   AvianFlu2022Autumn_SMS_Journey
    Click Drop Down By Name(HPEP)       Communication Direction
    Select Drop down option(HPEP)       Outbound
    Input Text    //label[text()='Communication Content MI']/ancestor::lightning-textarea//textarea    No response
    Click on Save button
    Sleep    3s
    Go to the DEP Campaign Member Comms Logs
    Click Edit      2
    Sleep  2s
    Click Drop Down By Name(HPEP)    Outcome
    Select Drop down option(HPEP)      No Response
    Click on Save button
    Sleep    3s

Create Comms Logs Item - Invalid response
    [Documentation]  Pre-requiste - Agent must be on the DEP Campaign Member Comms Log layout
    Page Should Contain    DEP Campaign Member Comms Log
    ${account-name}=     Get Text      //span[text()='Account']/ancestor::div[2]//force-lookup[@slot="outputField"]//span
    Click on Related tab    2
    Click on New button
    Input Text    //label[text()='Account']/ancestor::lightning-grouped-combobox//input    ${account-name}
    Click Element        //label[text()='Account']/ancestor::lightning-grouped-combobox//ul/li/lightning-base-combobox-item
    Input Text    //input[@name='Campaign_JourneyId__c']   AvianFlu2022Autumn_SMS_Journey
    Click Drop Down By Name(HPEP)       Communication Direction
    Select Drop down option(HPEP)       Outbound
    Input Text    //label[text()='Communication Content MI']/ancestor::lightning-textarea//textarea    invalid
    Click on Save button
    Sleep    3s
    Go to the DEP Campaign Member Comms Logs
    Click Edit      2
    Sleep  2s
    Click Drop Down By Name(HPEP)    Outcome
    Select Drop down option(HPEP)      Invalid Response
    Click on Save button
    Sleep    3s