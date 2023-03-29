
*** Variables ***
${Test_Barcode}                   (//label[contains(@class,'label inputLabel uiLabel-left form-element__label uiLabel')][4])
#(//input[contains(@class,' input')][17])
#${RIT_IANTO}   (//a[@title="IA NHS Test Ordering (IANTO)"])[2]
${Date_Test}                        (//label[contains(@class,'label inputLabel uiLabel-left form-element__label uiLabel')][5])
#(//input[contains(@class,' input')][18])
${Date_Test_Today}                 //button[contains(text(),'Today')]
${Description}                      //textarea[contains(@class,' textarea')]
${DescriptionValue}                     Hello Testing
${RIT_Investigator}                      (//input[@placeholder='Search People...'])[1]
${account-name-lookup-first-option_rit_uat}        //div[contains(@title,'Agent RIT')]
${account-name-lookup-first-option_rit_prod}        (//ul/li[@class="slds-listbox__item"]/lightning-base-combobox-item)[1]
${RIT_AssignTestCase}                       (//a[@class='select'])[9]
${RIT_AssignTestCase_Dropdown5}              //a[contains(@title,'Results Investigation Team')]
${RIT_InvestigatorValue}                   Agent RIT
${RIT_Investigator_Returned}                    //input[@type='text'])[13]
${RIT_Investigaton_Date}                    (//input[@type='text'])[12]
${RIT_InvestigatorDateValue}                20/05/2021
${RIT_InvestigatorReturnedValue}            22/05/2021
${RIT_IANTO}   (//a[@title="NHS UKHSA (IANTO)"])[2]
*** Keywords ***
RIT Validations
        Sleep  4s
       Click Edit
        Sleep  2s
        Click Drop Down By Name     Category
        Select Dropdown Option      Test results
        Click Drop Down By Name       Subcategory
        Select Dropdown Option        Missing or delayed result

        Click Drop Down By Name       Assign Test Case
        #Click Drop Down By Name       Assign Test Case
        Select Dropdown Option       UKHSA Results Investigation Team
#        Execute javascript  window.scrollTo(0,200)
#        Click Element At Coordinates   ${RIT_AssignTestCase}    0   0
#        Click Element     ${RIT_AssignTestCase_Dropdown5}
#        Select Dropdown Option         Results Investigation Team

        Sleep  2s
        Click Save
        ${ErrorMessageNotified}=  Get Text    ${ErrorMessagecaptured}
        Log to Console    ${ErrorMessageNotified}
        Should Contain Any   ${ErrorMessageNotified}    ${ErrorMessageNotified}
        Sleep  5s
       # Mouse over   (//*[@data-key='close'])[5]
        #Sleep  5s
        Click element    //lightning-button-icon/button[@title="Close error dialog"]
#        Click Drop Down By Name     Category
#        Select Dropdown Option      Test results
         Click Drop Down By Name       Subcategory
         Select Dropdown Option        Missing or delayed result

        Click Drop Down By Name     Test Type
        Select Dropdown Option      PCR test
        Sleep  2s
        Click Drop Down By Name     Testing Channel
        Select Dropdown Option     Tested at Home
        Sleep  4s
        Input Text for Test Barcode/Antibody ID    1234567abcd
        Input Text for Antibody ID    123455678anti
        Click save
        ${ErrorMessageNotified}=  Get Text    ${ErrorMessagecaptured}
        Log to Console    ${ErrorMessageNotified}
        Should Contain Any   ${ErrorMessageNotified}    ${ErrorMessageNotified}
        Click element    //lightning-button-icon/button[@title="Close error dialog"]
        #Click save
        Input Text for Antibody ID    12345678anti
        #Input Text Field By Label Name   Test Barcode/Antibody ID   123abcd
        Sleep  4s
        Input Text for Date of Test     11/05/2021
     #   Input Date Field By Name    Date of Test      11/05/2021

         #Click Drop Down By Name     Test Provider Type
        #Sleep  4s
        #Select Test Provider Drop down option     IA NHS Test Ordering (IANTO)

        Click Drop Down By Name     Test Provider Type
        Sleep  4s
        #Select Dropdown Option     NHS UKHSA (IANTO)
        #Select Test Provider Drop down option     NHS
        Click Element  (//lightning-base-combobox-item//span[contains(text(),'NHS UKHSA (IANTO)')]/ancestor::span[1])[2]
        #${RIT_IANTO}
        Sleep  2s
        Execute javascript  window.scrollTo(0,900)
#        Click Element     ${Description}
#        Input Text   ${Description}      ${DescriptionValue}
        Sleep  3s
        Click save
        Wait Until Page Has Saved
        #Wait Until Page Contains   saved


#        Sleep   6s
#        Display Field text Should Be    Category        Test - General
#        Case Owner Text Should Be       RIT Cases
        Sleep  3s

RIT Validations1
        Sleep  4s
       Click Edit
        Sleep  2s
        Click Drop Down By Name     Category
        Select Dropdown Option      Test results
        Click Drop Down By Name       Subcategory
        Select Dropdown Option        Missing or delayed result

        Click Drop Down By Name       Assign Test Case
#        Click Drop Down By Name       Assign Test Case
        Select Dropdown Option       UKHSA Results Investigation Team
#        Execute javascript  window.scrollTo(0,200)
#        Click Element At Coordinates   ${RIT_AssignTestCase}    0   0
#        Click Element     ${RIT_AssignTestCase_Dropdown5}
#        Select Dropdown Option         Results Investigation Team

        Sleep  2s
        Click Save
        ${ErrorMessageNotified}=  Get Text    ${ErrorMessagecaptured}
        Log to Console    ${ErrorMessageNotified}
        Should Contain Any   ${ErrorMessageNotified}    ${ErrorMessageNotified}
        Sleep  5s
       # Mouse over   (//*[@data-key='close'])[5]
        #Sleep  5s
        Click element    //lightning-button-icon/button[@title="Close error dialog"]
#        Click Drop Down By Name     Category
#        Select Dropdown Option      Test results
         Click Drop Down By Name       Subcategory
         Select Dropdown Option        Missing or delayed result

        Click Drop Down By Name     Test Type
        Select Dropdown Option      PCR test
        Sleep  2s
        Click Drop Down By Name     Testing Channel
        Select Dropdown Option     Tested at Home
        Sleep  4s
        Input Text     (//input[@class='slds-input'])[9]         1234567abcd
        Input Text     (//input[@class='slds-input'])[10]         123455678anti
        #Input Text for Test Barcode/Antibody ID    1234567abcd
        #Input Text for Antibody ID    123455678anti
        Click save
        ${ErrorMessageNotified}=  Get Text    ${ErrorMessagecaptured}
        Log to Console    ${ErrorMessageNotified}
        Should Contain Any   ${ErrorMessageNotified}    ${ErrorMessageNotified}
        Click element    //lightning-button-icon/button[@title="Close error dialog"]
        #Click save
        #Input Text for Antibody ID    12345678anti
        Input Text     (//input[@class='slds-input'])[10]         12345678anti
        #Input Text Field By Label Name   Test Barcode/Antibody ID   123abcd
        Sleep  4s
        Input Text for Date of Test     11/05/2021
     #   Input Date Field By Name    Date of Test      11/05/2021

         #Click Drop Down By Name     Test Provider Type
        #Sleep  4s
        #Select Test Provider Drop down option     IA NHS Test Ordering (IANTO)

        Click Drop Down By Name     Test Provider Type
        Sleep  4s
        #Select Dropdown Option     NHS UKHSA (IANTO)
        #Select Test Provider Drop down option     NHS
        Click Element  (//lightning-base-combobox-item//span[contains(text(),'NHS UKHSA (IANTO)')]/ancestor::span[1])[2]
        #${RIT_IANTO}
        Sleep  2s
        Execute javascript  window.scrollTo(0,900)
#        Click Element     ${Description}
#        Input Text   ${Description}      ${DescriptionValue}
        Sleep  3s
        Click save
        Wait Until Page Has Saved
        #Wait Until Page Contains   saved


#        Sleep   6s
#        Display Field text Should Be    Category        Test - General
#        Case Owner Text Should Be       RIT Cases
        Sleep  3s

RIT Validations - Assign to Specialist
        Sleep   4s
         Click Edit
         Sleep  3s
         Click Drop Down By Name    Priority Reasons
        Select Dropdown Option      Other

        Click Drop Down By Name     Category
        Select Dropdown Option      Test - General

        Click Drop Down By Name       Subcategory
        Select Dropdown Option        Test - General - Other

        Click Drop Down By Name       Assign Test Case
        Select Dropdown Option       Inbound 119 Tier 2

        Sleep  2s

        Click Drop Down By Name     Test Type
        Select Dropdown Option      PCR test

#
        Sleep  2s
        Click Drop Down By Name     Testing Channel
        Select Dropdown Option     Tested at Home
        Sleep  4s

        Input Text for Test Barcode/Antibody ID    123abcd
        Sleep  2s
        Execute javascript  window.scrollTo(0,800)
        Input Text for Date of Test      11/05/2021


#        Execute Javascript    window.scrollTo(0,600);

         Scroll Element Into View        (//input[@placeholder='Search People...'])[1]//following::lightning-input

         Click Element   ${RIT_Investigator}
         Input Text    ${RIT_Investigator}      RIT
         #${RIT_InvestigatorValue}
#         Wait Until Element is visible     ${account-name-lookup-first-option}      timeout=10s
         Set Focus To Element     ${account-name-lookup-first-option_rit_prod}
         Click Element   ${account-name-lookup-first-option_rit_prod}
        #Execute javascript  window.scrollTo(0,800)
        Scroll Element Into View    //input[@placeholder='Search Live Issues...']
        Sleep  4s
        Click Element     ${Description}
        Input Text   ${Description}      ${DescriptionValue}
        Sleep  3s
        Click save
        Wait Until Page Has Saved
#        Sleep   6s
#        Display Field text Should Be    Category        Test - General
#        Case Owner Text Should Be       Specialist Enquiries - Test
#        Sleep  3s
