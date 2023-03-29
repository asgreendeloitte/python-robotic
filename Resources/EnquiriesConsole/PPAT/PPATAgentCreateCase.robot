*** Settings ***
Resource    ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot
Resource    ../GlobalButtons.robot
Library    SeleniumLibrary

*** Variables ***

${new-case-btn}                                          //a[@title='New']
${next-modal-btn}                                        //button/span[contains(text(), 'Next')]
${public-enquiries}                                      //span[contains(text(),'PPAT Public Enquiries')]
${ppat-parliamentary-case-type}                          //label//span[contains(text(),'PPAT Parliamentary')]
${account-name-lookup}                                   //input[@placeholder= 'Search Accounts...']
${account-name-lookup-first-option}                      (//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity'])[1]
${search-contacts-lookup}                                //input[@title='Search Contacts']
#${search-contacts-lookup-first-option}                   (//div[@title="test"])[6]
#(//div[@title="Pablo Test 5445"])
${search-contacts-lookup-first-option}                   (//div[@class='primaryLabel slds-truncate slds-lookup__result-text'])[1]
${web-email}                                             (//input[@inputmode='email'])
${pq-po-number}                                          (//input[contains(@class,'input')])[6]
${pq-po-number-parli-form}                               (//input[contains(@class,'input')])[19]
${Description}                                           //textarea[@class='slds-textarea']
${DescriptionText}                                        Automation testing
${public-complaints}                                      //span[contains(text(),'PPAT Public Complaints')]
${informations-rights}                                    //span[contains(text(),'PPAT Information Rights')]
${live-issues-lookup}                                     //input[@title='Search Live Issues']

${live-issues-lookup-first-option}                        (//ul[contains(@class, 'lookup__list')]/li)[2]
${account-name-gv}                                        (//*[@class=' input'])
${save-contribution}                                      (//span[@dir='ltr' and text()='Save'])[3]
${contribution-case}                                      //span[contains(text(),'PPAT Contribution')]
${pqpo-text-box}                                          //input[@name='PPAT_PQPO_number__c']
${scs-dd-assigned}                                        //input[@name='PPAT_SCSDD_Assigned__c']
${live-issue-name}                                        (//input[contains(@class,'slds-input')])[2]
${live-issue-summary}                                     (//input[contains(@class,'slds-input')])[7]
${live-issue-Desc}                                        (//*[contains(@class,'slds-textarea')])
${save-live-issue}                                        (//button[contains(text(),'Save')])[2]
${Search_LiveIssue}          //input[@placeholder='Search Live Issues...']
${Search_LiveIssue_Val}       automation
${contribution-case-tab}                                  //a[@title='Contribution Case']
${deny_list}                                              //input[contains(@id,'231')]
${new-contribution-activity}                              //button[@name='Case.New_Contribution']
${new-contribution-from-task}                             //div[@title='New Task']

*** Keywords ***

PPAT Enquiries agent creates a case
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Sleep  2s
    Click Element                   ${new-case-btn}
    Sleep  3s
    Page Should Not Contain         PPAT Contribution
    Click Element                   ${public-enquiries}
    Sleep  3s
    Click Element                   ${next-modal-btn}
    Sleep  3s
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s

    Click Drop Down By Name         Case type
    Select Drop down option         Standard
    Click Drop Down By Name         Category
    Select Drop down option         Adult Social Care
  #  Click Drop Down By Name         Subcategory
  #  Select Dropdown Option          Regional Test Sites and Local Test Sites (RTS/LTS)
   # Click Drop Down By Name         ExCo Group
   # Select Drop down option         Clinical and Public Health (CPH)
    Sleep  3s
   #  Click Element                   ${search-contacts-lookup}
   # Click Element                   ${search-contacts-lookup-first-option}
   # Sleep  3s
   # Input Text     ${web-email}   sameera.purini@test-and-trace.nhs.uk
    Sleep   3s
    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

PPAT QA agent creates a case Public Complaints type
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Sleep  2s
    Click Element                   ${new-case-btn}
    Sleep  3s
    Page Should Not Contain         PPAT Contribution
    Click Element                   ${public-complaints}
    Sleep  3s
    Click Element                   ${next-modal-btn}
    Sleep  3s
    Click Element                   ${account-name-lookup}
    Sleep  2s
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Public Complaint
   # Click Drop Down By Name        Case Origin
   # Select Drop down option        Public Complaints Mailbox
#    Input Text                      ${search-contacts-lookup}   test
#    Sleep  3s
#    Click Element                   ${search-contacts-lookup-first-option}
#    Sleep  3s
    Input Text   ${Description}      ${DescriptionText}
    Input Text     ${web-email}   sameera.purini@test-and-trace.nhs.uk
    Sleep   3s
    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s


PPAT QA agent creates a case Public Complaints type without account
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Sleep  2s
    Click Element                   ${new-case-btn}
    Sleep  3s
    Click Element                   ${public-complaints}
    Sleep  3s
    Click Element                   ${next-modal-btn}
    Sleep  3s
    #Click Element                   ${account-name-lookup}
    #Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Public Complaint
   # Click Drop Down By Name        Case Origin
   # Select Drop down option        Public Complaints Mailbox
   # Input Text                      ${search-contacts-lookup}   TEST
    #Sleep  3s
    #Click Element                   ${search-contacts-lookup-first-option}
    #Sleep  3s
    Input Text   ${Description}      ${DescriptionText}
    Input Text     ${web-email}   sameera.purini@test-and-trace.nhs.uk
    Sleep   3s
    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

PPAT QA agent creates a case Information Rights type
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Sleep  2s
    Click Element                   ${new-case-btn}
    Sleep  3s
    Page Should Not Contain         PPAT Contribution
    Click Element                   ${informations-rights}
    Sleep  3s
    Click Element                   ${next-modal-btn}
    Sleep  3s
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s

   #  Click Drop Down By Name         Case Origin
   # Select Drop down option         Information Rights Mailbox
   # Sleep  3s
   # Click Element                   ${search-contacts-lookup}
   # Click Element                   ${search-contacts-lookup-first-option}
   # Sleep  3s
   # Input Text     ${web-email}   sameera.purini@test-and-trace.nhs.uk
    Sleep   3s
    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

PPAT Parliamentary agent creates a case

    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Sleep  2s
    Click Element                   ${new-case-btn}
    Sleep  3s
    Click Element                   ${ppat-parliamentary-case-type}
    Sleep  3s
    Click Element                   ${next-modal-btn}
    Sleep  3s
    Click Element                   ${account-name-lookup}
    Sleep  1s
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         PQ Transfer
    Input text          ${scs-dd-assigned}      Yes
    Click Drop Down By Name         Directorate
    Select Drop down option         (CPH) Clinical & Emerging Infections
    Click Drop Down By Name         PQ or OPB
    Select Drop down option         PQ (Parliamentary Question)
    Input text      //input[@name='PPAT_PQPO_number__c']    12345
#    Input text      ${pqpo-text-box}    12345
    Click Drop Down By Name         Status
    Select Drop down option         Awaiting Information (Internal)
    Click Drop Down By Name         Category
    Select Drop down option         Adult Social Care
    Sleep  2s
    Input Text     ${web-email}   sameera.purini@test-and-trace.nhs.uk
    Sleep  3s
    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s


PPAT Person Account Validation
   [Documentation]  Pre-requiste - Agent must be on the Cases tab
     Click Element                   ${new-case-btn}
    Sleep  3s
    Click Element                   ${public-enquiries}
    Sleep  3s
    Click Element                   ${next-modal-btn}
    Sleep  3s

       Click Element                   ${account-name-lookup}
       Click Element                   ${account-name-New Account}
       Sleep  3s
       #Click Element                   ${next-modal-btn}
       Click Element                    //span[text()='Salutation']/ancestor::div[1]//a
#        Click Drop Down By Name         Salutation
       Click Element                    //a[@title= 'Mr.']
#        Select Drop down option         Mr.
        #${hex}   Generate Random String[NUMBERS]abcdef

         Input Text Field By PersonAccountName      First Name   Geetha2
          Sleep   2s
         Input Text Field By PersonAccountName      Last Name   Karthick123


         Input Text Field By PersonAccountName       Email    gg@gmail.com
         Input Text Field By PersonAccountName       Mobile     98765454646
         Sleep   2s
        # Click Drop Down By Name         Future contact
         #Select Drop down option         Yes - email only
         Execute javascript  window.scrollTo(0,900)
        # Input Text Field By PersonAccountName      Mailing Street     abc street
        # Input Text Field By PersonAccountName      Mailing City      london
        # Input Text Field By PersonAccountName      Mailing Zip/Postal Code     IG1

         Click Element   ${account_mailing_add}
        Input Text     ${account_mailing_add}   abc street
         Sleep   2s
         Click Element   ${account_city}
        Input Text     ${account_city}   London
         Sleep   2s
         Click Element   ${account_zip}
        Input Text     ${account_zip}   IG1
         Sleep   2s

         Click Element              //button[@title= 'Save']
         Wait Until Page Contains   was created



PPAT Person Account Deny List Validation
   [Documentation]  Pre-requiste - Agent must be on the Cases tab
     Click Element                   ${new-case-btn}
    Sleep  3s
    Click Element                   ${informations-rights}
    Sleep  3s
    Click Element                   ${next-modal-btn}
    Sleep  3s

       Click Element                   ${account-name-lookup}
       Click Element                   ${account-name-New Account}
       Sleep  3s
       #Click Element                   ${next-modal-btn}
       Click Element                    //span[text()='Salutation']/ancestor::div[1]//a
#        Click Drop Down By Name         Salutation
       Click Element                    //a[@title= 'Mr.']
#        Select Drop down option         Mr.
        #${hex}   Generate Random String[NUMBERS]abcdef

         Input Text Field By PersonAccountName      First Name   Geetha2
          Sleep   2s
         Input Text Field By PersonAccountName      Last Name   Karthick123


         Input Text Field By PersonAccountName       Email    gg@gmail.com
         Input Text Field By PersonAccountName       Mobile     98765454646
         Sleep   2s
         Click Element    ${deny_list}
        # Click Drop Down By Name         Future contact
         #Select Drop down option         Yes - email only
         Execute javascript  window.scrollTo(0,900)
        # Input Text Field By PersonAccountName      Mailing Street     abc street
        # Input Text Field By PersonAccountName      Mailing City      london
        # Input Text Field By PersonAccountName      Mailing Zip/Postal Code     IG1

        Click Element   ${account_mailing_add}
        Input Text     ${account_mailing_add}   abc street
        Sleep   2s
        Click Element   ${account_city}
        Input Text     ${account_city}   London
         Sleep   2s
         Click Element   ${account_zip}
        Input Text     ${account_zip}   IG1
         Sleep   2s
         Click Element              //button[@title= 'Save']
         Sleep   4s
         Wait Until Page Contains   was created
         Sleep   5s
         Click Save



PPAT Government Account Validation
   [Documentation]  Pre-requiste - Agent must be on the Cases tab
     Click Element                   ${new-case-btn}
    Sleep  3s
    Click Element                   ${public-enquiries}
    Sleep  3s
    Click Element                   ${next-modal-btn}
    Sleep  3s

       Click Element                   ${account-name-lookup}
       Click Element                   ${account-name-New Account}
       Sleep  3s

       Click Element                   ${next-modal-btn}
       Input Text     ${account-name-gv}   automationgovernment
        Click Element               //button[@title='Save']
        Wait Until Page Contains     was created
        Sleep  4s

         Click Drop Down By Name         Case type
         Select Drop down option         Standard

         #Click Drop Down By Name     Whisper Accurate
         #Select Dropdown Option      Yes

         Sleep  3s
         #Click Element                   ${whisper_Ian}
         #Sleep  3s
         #Select Dropdown Option      Test - General      index=2


         Click Save
         Wait Until Page Contains   was created

PPAT Parly Agent creates a contribution case
    [Documentation]  Pre-requiste - Agent must be on the case
    Sleep  4s
    Execute JavaScript    document.querySelector("li.uiTabItem a[title='Contribution Case']").click();
    Execute javascript  window.scrollTo(0,400)
     Click Drop Down By Name (bug fix)         Category
     #Click Drop Down By Name (bug fix)         COVID-19
     Select Drop down option1         COVID-19
     Click Drop Down By Name (bug fix)         Team
     Select Drop down option1        COVID-19 Virology
    Sleep  3s
    Execute JavaScript   document.querySelectorAll('.cuf-publisherShareButton')[0].click()
    Execute javascript  window.scrollTo(0,0)

PPAT Information Rights Agent creates a contribution case
    [Documentation]  Pre-requiste - Agent must be on the case
    Sleep  4s
    Execute JavaScript    document.querySelector("li.uiTabItem a[title='Contribution Case']").click();
    Execute javascript  window.scrollTo(0,400)
     Click Drop Down By Name (bug fix)         Category
     Select Drop down option1         COVID-19
     Click Drop Down By Name (bug fix)         Subcategory
     Select Drop down option1         COVID-19 Virology
    Sleep  3s
    Execute JavaScript   document.querySelectorAll('.cuf-publisherShareButton')[0].click()
    Execute javascript  window.scrollTo(0,0)

Open contribution case created
    Sleep  5s
	Click Related Tab
    Sleep   3s
    Click Element   (//flexipage-tab2[2]//flexipage-component2//div[@class='slds-truncate'])[2]


PPAT Agent creates a contribution case
      Click Element                           ${new-case-btn}
      Sleep  3s
      Click Element                           ${contribution-case}
      Sleep  3s
      Click Element                            ${next-modal-btn}
      Sleep  3s
      Click Drop Down By Name        Category
      Select Drop down option                   COVID-19

      Click Drop Down By Name                    Subcategory
      Select Drop down option                    COVID-19 Virology
      Sleep  3s
      Click Save
      Wait Until Page Has Saved

PPAT Agent creates a liveissue case
      Click Element                           ${new-case-btn}
      Sleep  3s
      Input Text     ${live-issue-name}    automationliveissue
      Sleep  3s
      Input Text for Start Date of Test liveissue    11/10/2022
      Sleep  3s
      Input Text for End Date of Test liveissue      14/12/2022
      Sleep  3s
      Input Text  ${live-issue-summary}     automationsummary
      Input Text  ${live-issue-Desc}        automationdesc
      Click Element     ${save-live-issue}
      Wait Until Page Has Saved




Populate Fields From Passedto Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //span[contains(text(), '${name}')]/../../../div/div/div/div/div/a
    Click Element       (//a[@title="Test and Trace EF&C"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable       "PPAT Parliamentary Team"    "PPAT Information Rights"    "PPAT Public Enquiries"    "Test and Trace EF&C"    "Chief Exec Office"     "NHS England"    "Other"
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        sleep   2s
        Click Element       (//a[@title=${item}])[${index}]
    END

Populate Fields From ID valid Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //span[contains(text(), '${name}')]/../../../div/div/div/div/div/a
    Click Element       (//a[@title="No"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable       "Yes"    "No"    "No ID Received"
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        sleep   2s
        Click Element       (//a[@title=${item}])[${index}]
    END

Populate Fields From Outcome Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //span[contains(text(), '${name}')]/../../../div/div/div/div/div/a
    Click Element       (//a[@title="Information not held"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable       "Information not held"    "Information partially held"   "Invalid request – real name"   "Invalid request – clarification"  "Invalid request – ID"
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        sleep   2s
        Click Element       (//a[@title=${item}])[${index}]
    END

PPAT Person Account Salutation Field picklist validation
   [Documentation]  Pre-requiste - Agent must be on the Cases tab
     Click Element                   ${new-case-btn}
    Sleep  3s
    Click Element                   ${public-enquiries}
    Sleep  3s
    Click Element                   ${next-modal-btn}
    Sleep  3s

       Click Element                   ${account-name-lookup}
       Click Element                   ${account-name-New Account}
       Sleep  3s
       #Click Element                   ${next-modal-btn}
       Click Element                    //span[text()='Salutation']/ancestor::div[1]//a
#        Click Drop Down By Name         Salutation
         Populate Fields From Account Salutation Picklist   Salutation


Populate Fields From Account Salutation Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //span[contains(text(), '${name}')]/../../../div/div/div/div/div/a
    Click Element       (//a[@title="Mrs."])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable       "Mr."    "Mrs."   "Ms."   "Miss."  "Mx."  "Dr."  "Prof."
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        sleep   2s
        Click Element       (//a[@title=${item}])[${index}]
    END


PPAT Live Issue Search Text
    Sleep  3s
    Execute javascript  window.scrollTo(0,900)
    Click Element   ${Search_LiveIssue}
    Input Text     ${Search_LiveIssue}    ${Search_LiveIssue_Val}
    Execute javascript  window.scrollTo(0,900)
    Click Element                   ${account-name-lookup-first-option}
    Sleep  2s


Populate Fields From Not a Geniune Case Reason Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //span[contains(text(), '${name}')]/../../../div/div/div/div/div/a
    Click Element       (//a[@title="Multiple recipients"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable       "Abusive language"    "Auto-acknowledgement"   "Comms and Info"   "Multiple recipients"  "Quarantine email"  "Spam and Marketing"  "Test case"    "No response required"     "Other"
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        sleep   2s
        Click Element       (//a[@title=${item}])[${index}]
    END

PPAT Agent creates a contribution case from a Case Record
      Click the contribution case tab
      Sleep  3s
      Click Drop Down By Name (bug fix)         Category
      Select Drop down option                   COVID-19

      Click Drop Down By Name                    Subcategory
      Select Drop down option                    COVID-19 Virology
      Sleep  3s
      Execute JavaScript               document.querySelectorAll('.cuf-publisherShareButton')[0].click()
      Sleep       2s
      Wait Until Page Has Saved

PPAT QA agent creates an Information Rights case with DSAR case type
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Sleep  2s
    Click Element                   ${new-case-btn}
    Sleep  3s
    Click Element                   ${informations-rights}
    Sleep  3s
    Click Element                   ${next-modal-btn}
    Sleep  3s
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name              Case type
	Select Dropdown Option      Data Subject Access Request
	Click Save

Agent creates a Contribution Activity
    Sleep  2s
    Click Element                   ${new-contribution-activity}
    Sleep  3s
    Click Element    //input[@lightning-basecombobox_basecombobox]
    Click Element    //lightning-base-combobox-item[@data-value='Call']
    Input Text       //div[@class='form-element']//input    16/02/2023
#    Input Text    //div[@class='dateTime-inputDate form-element form-element__control']//input    16/02/2023
    Input Text    //div[@class='uiInput uiInput--default']//input    01/03/2023
    Input Text    //div[@class='uiInput forceSearchInputLookupDesktop uiInput--default']//input    test
    Click Element    //button[@class='slds-button slds-button_brand cuf-publisherShareButton undefined uiButton']
    Page Should Contain    was created
    Sleep  3s

Agent creates a Contribution Activity with Date in the Past
    Sleep  2s
    Click Element                   ${new-contribution-from-task}
    Sleep  3s
    Click Element    //input[@lightning-basecombobox_basecombobox]
    Click Element    //lightning-base-combobox-item[@data-value='Call']
#    Input Text    //div[@class='dateTime-inputDate form-element form-element__control']//input    16/02/2023
    Input Text    //div[@class='uiInput uiInput--default']//input    16/02/2023
    Input Text    //div[@class='uiInput forceSearchInputLookupDesktop uiInput--default']//input    test
    Click Element    //button[@title='Save']
    Page Should Contain    was created
    Sleep  3s