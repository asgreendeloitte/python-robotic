*** Settings ***
Resource    ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot
Resource    ../GlobalButtons.robot
Library    SeleniumLibrary

*** Variables ***
${Complaints&EnquiriesTrace}            //span[contains(text(),'Complaints and Enquiries(Trace)')]
${error-heading}                        Review the errors on this page.
${error-text1}                           Case status cannot be Closed when creating a case.
${error-text2}                          Whisper field is required when logging phone cases.
${error-text3}                          IANTO EFC users can only create and edit 'NHS UKHSA (IANTO)' (Category) cases
${error-text4}                          Only IANTO EFC users can create ‘NHS UKHSA (IANTO)' (Category) cases
${error-text6}                          Please ensure all the details are filled out in Close Case Tab before closing the case.
${error-text7}                          Case Type must equal 'Complaint' when Case Origin is 'Complaints mailbox'
${error-text8}                          Please enter a reason for extending the deadline
${error-text9}                          Please update the mandatory fields on the case before saving. The mandatory fields are Outcome, Disclosure Position & Exemptions Applied
${error-text10}                         Please update the mandatory fields on the case before saving. The mandatory fields are Case Type, Account Name, Account Email, Web Email, ExCo Group, Category & Subcategory
#Please ensure all the details are filled out in the Close Case Tab before closing the case.
${error-text5}                          insufficient access rights on object id
${new-case-btn}                    //a[@title='New']
${new-account-btn}                 //a[@title='New']

${next-modal-btn}                  //button/span[contains(text(), 'Next')]

${account-name-lookup}              (//input[@placeholder='Search Accounts...'])[1]
 #//input[@title='Search Accounts']

${Constituent-name-lookup}             (//input[@placeholder='Search Accounts...'])[1]

${PrivateProvider-lookup}               //input[@title='Search Test Providers']

#${private-provider-option}     //a[@title='Medplus Test']
${private-provider-option}      //table[contains(@class,'forceRecordLayout')]/tbody/tr[1]/td[1]/a

${New_PrivateProvider}                 //div[contains(@class,'undefined lookup__menu showEmptyContent uiAbstractList uiAutocompleteList uiInput uiAutocomplete uiInput--default uiInput--lookup')]
#//span[contains(text(),'New Test Provider')]
${TestProviderName}                       (//input[contains(@class,'input')])[13]
${TestProviderValue}                        GeethaTest
${account-name-lookup-first-option}        (//div/ul[@aria-label="Recent Accounts"]/li)[2]
${account-name-lookup-first-option1}        //lightning-base-combobox-item[@data-value="actionCreateNew"]
#(//ul[contains(@class, 'lookup__list')]/li)[1]

${account-name-New Account}                //span[contains(@title,'New Account')]

${ErrorMessagecaptured}           //ul[@class='errorsList slds-list_dotted slds-m-left_medium']

#xpath://span[@class='genericError uiOutputText']

${ErrorMessageNotified}           Review the errors on this page.


${new-case-btn_Trace}          (//span[contains(text(),'Complaints and Enquiries(Trace)')])
${new-case-btn_Trace1}                           (//span[contains(text(),'Complaints and Enquiries(Trace)')])[2]
${new-sub-case-btn}           //span[contains(text(),'Sub Case')]

${ComplaintEnquiryType}

${MP_Reference}             //label[contains(text(),'Please provide the MP Trace Case Reference Number')]

${MP_Referencevalue}        675678


${SelectedPerson-name-lookup}       (//input[@placeholder='Search Accounts...'])[1]
${Add_New_Account}                  //span[contains(text(),'New Account')]
${Next}                             //span[contains(text(),'Next')]

#${First_Name_SP}                        //input[contains(@placeholder,'First Name')]
#${First_Name_Val_SP}                    GeethaAutomation
${Last_Name_SP}                       //input[contains(@placeholder,'Last Name')]
${Last_Name_Val_SP}                    Testing
${First_Name}                        (//input[contains(@class,'input')])[19]
${First_Name_Val}                   Regression
${Last_Name}                      (//input[contains(@class,'input')])[20]
${Last_Name_Val}                    Testing

${BirthDate}                    (//input[contains(@class,'input')])[21]
${BirthDate_Val}                23/07/1990
${Email}                    (//input[contains(@class,'input')])[23]
${web-email}                 (//input[contains(@class,'input')])[15]
${Description}               (//*[@class='slds-textarea'])[1]
#//textarea[contains(@class,' textarea')]
${DescriptionText}                    Automation testing
${Email_Val}                gg@gmail.com
${Phone}                    (//input[contains(@class,'input')])[22]
${Phone_Val}                +447667878789
${Save_pc}                  (//button[@title='Save'])[2]
${CaseTypeVal}               //lightning-formatted-text[contains(text(),'Feedback')]
${Email-btn}                //a[contains(@title,'Email')]
${Search_LiveIssue}          //input[@placeholder='Search Live Issues...']
#//input[contains(@title,'Search Live Issues')]
${Search_LiveIssue_Val}       The sky is falling

${search_Hospitals}            //input[@placeholder='Search Hospitals...']
#//input[@title='Search Hospitals']
${whisper_general}             (//a[@title="Test - General"])[1]
${whisper_Ian}             (//span[contains(text(), 'Whisper')]/../../../div/div/div/div/div/a)[1]
#(//span[contains(text(), 'Whisper')]/../../../div/div/div/div/div/a)[2]
${account_mailing_add}     //*[@class='street compoundTLRadius compoundTRRadius compoundBorderBottom textarea']
${account_city}             //*[@class='city compoundBorderBottom compoundBorderRight input']
${account_zip}              //*[@class='postalCode compoundBLRadius compoundBorderRight input']
${app_launcher}          //*[@class='slds-icon-waffle']
${app_launcher_search}   //*[@class='slds-input' and @placeholder='Search apps and items...']
${data_pop}              //*[@class='al-menu-dropdown-list' and @aria-label='Items']/p
${text}
${text_data}             No results
${ptm_save}             //button[text()='Save']
${caller-id}        (//*[@name='Call_Logger_ID__c'])
#(//*[@class=' input'])[1]
${public-enquiries}      //span[contains(text(),'PPAT Public Enquiries')]
${public-complaints}      //span[contains(text(),'PPAT Public Complaints')]
${informations-rights}      //span[contains(text(),'PPAT Information Rights')]
${search-contacts-lookup}                   //input[@title='Search Contacts']
${search-contacts-lookup-first-option}       (//ul[contains(@class, 'lookup__list')]/li)[2]
${live-issues-lookup}        //input[@title='Search Live Issues']
${live-issues-lookup-first-option}       (//ul[contains(@class, 'lookup__list')]/li)[2]
${service-console}      //*[@class='al-menu-dropdown-list'][1]
${person-account}       //span[text()='Person Account']/ancestor::label/span[1]
${next-button-new-account}        //span[text()='Next']/ancestor::button
${category-dropdown}      //select[@name= 'Category']
${whisper-heard-dropdown}      //select[@name= 'Whisper_heard']
${whisper-accurate-dropdown}      //select[@name= 'Whisper_accurate']
${outcome-tier1}                //select[@name='Outcome_Other']
${testtype-tier1}                //select[@name='Test_Type_Other']
${status-tier1}                //select[@name='Status_Other']
${assigntrace-tier1}                //select[@name='Assign_Trace_Case_Other']
${callertype-tier1}                //select[@name='Caller_Type_Other']
${Country-tier1}                //select[@name='Country_Other']
${sub-category-elective}        //select[@name='Subcategory_Elective_Care']
${sub-category-antivir}         //select[@name='Subcategory_Antiviral']
${sub-category-bookorder}        //select[@name='Subcategory_Book_Order_test']
${sub-category-register}        //select[@name='Subcategory_Register_Test']
${sub-category-chase}        //select[@name='Subcategory_Chase_Results']
${sub-category-Trace-isol}        //select[@name='Subcategory_Trace_Isolation']
${sub-category-intl-tvl}        //select[@name='Subcategory_International_Travel']
${sub-category-other}        //select[@name='Subcategory_Other']




*** Keywords ***
Click Email
#    Press Keys  NONE  ARROW_DOWN
#    Click Element  ${Email-btn}
  Execute JavaScript    window.document.evaluate('${Email-btn}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
Person Account Selection
   Click Element        ${SelectedPerson-name-lookup}

   Click Element        ${account-name-lookup-first-option}
Add New Account-Consent details
    Click Element     ${SelectedPerson-name-lookup}
    Click Element        ${Add_New_Account}
    Sleep  2s
    Click Element       ${Next}
    Sleep   4s

    Click Drop Down By Name         Salutation
    Select Drop down option         Mrs.
    Sleep  2s
   Input Text Field By PersonAccountName      First Name   Geetha
    Sleep   2s
    Input Text Field By PersonAccountName      Last Name   Karthick

    Input Date Field By Name         Birthdate    23/07/1990

      Click Drop Down By Name         Sex
      Select Drop down option         Female
      Input Text Field By PersonAccountName      Phone      +447889889898
      Input Text Field By PersonAccountName       Email    gg@gmail.com
       Sleep  2s
    Click Element  ${Save_pc}
    Wait Until Page Contains   was created
Name of the Selected Person validation
    Sleep  2s
    Click Drop Down By Name         Test Provider Type
    Click Drop Down By Name         Test Provider Type
    Sleep  2s
    Select Drop down option         To be determined

    Click Drop Down By Name         Third Party Contacting?
    Select Drop down option         Yes

app launcher check
  [Arguments]  ${search_name}
        Click Element   ${app_launcher}
        Sleep  4S
        Click Element   ${app_launcher_search}
        Sleep  2s
        input text   ${app_launcher_search}   ${search_name}
        Sleep  2s
        ${text}=  Get Text    ${data_pop}
        Log to Console    ${text}
        Should Contain   ${text}    ${text_data}
        Sleep  2s
        Click Element  ${service-console}

Agent Creates Case with Case Type Complaint
        [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    #Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
    Select Drop down option         Test - General


     Click Drop Down By Name         Subcategory
     Select Drop down option         Test - General - Other

    Click Drop Down By Name         Case type
    #Select Drop down option         Complaint
    Select Drop down option complaints
    Sleep  3s

    #Click Drop Down By Name     Whisper
    #Sleep  3s
    #Select Dropdown Option      Test - General      index=2

     #Click Drop Down By Name     Whisper Accurate
     #Select Dropdown Option      Yes

     Sleep  3s
#     Click Element                   ${whisper_Ian}
 #   Sleep  3s
  #  Select Dropdown Option      Test - General      index=2

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

Central Agent Creates Case with Case Type Complaint
        [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    Click Element                   ${next-modal-btn}

      Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
    Select Drop down option         Test - General


     Click Drop Down By Name         Subcategory
     Select Drop down option         Test - General - Other

    Click Drop Down By Name         Case type
    #Select Drop down option         Complaint
    Select Drop down option complaints
    Sleep  3s

    #Click Drop Down By Name     Whisper
    #Sleep  3s
    #Select Dropdown Option      Test - General      index=2

     #Click Drop Down By Name     Whisper Accurate
     #Select Dropdown Option      Yes

 #    Sleep  3s
#     Click Element                   ${whisper_Ian}
    Sleep  3s
  #  Select Dropdown Option      Test - General      index=2

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

Agent Creates Case without whisper
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

   # Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries



     Click Drop Down By Name         Category
     Select Drop down option         Test - General


     Click Drop Down By Name         Subcategory
    Select Drop down option         Test - General - Other

    Click Drop Down By Name         Case type
    Select Drop down option         Feedback

    Click Save
    #Check Error Message Content for whisperfield
    #Click Drop Down By Name         Case type
    #Select Drop down option         Feedback
    Sleep  2s

    #Click Element                   ${whisper_Ian}
    Sleep  3s
   # Select Dropdown Option      Test - General      index=2
    #Click Element   ${whisper_general}
    #Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
    Log To Console   \n
    ${Casetype}=     Get Value    ${CaseTypeVal}
     Log to Console        ${Casetype}

Agent Creates Case
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}


  #  Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries



     Click Drop Down By Name         Category
     Select Drop down option         Test - General


     Click Drop Down By Name         Subcategory
    Select Drop down option         Test - General - Other
     sleep  3s
     Click Drop Down By Name         Case type
    Select Drop down option         Feedback
    sleep  3s

    #Click Drop Down By Name     Whisper
    #Sleep  3s
    #Select Dropdown Option      Test - General   index=2

    #Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes

     Sleep  3s
     #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General      index=2

    Execute javascript  window.scrollTo(0,800)
    Sleep  3s
#    Click Element     ${Description}
#    Input Text   ${Description}      ${DescriptionValue}

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
    Log To Console   \n
    ${Casetype}=     Get Value    ${CaseTypeVal}
     Log to Console        ${Casetype}

Central Agent Creates Case
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    Click Element                   ${next-modal-btn}

    Input Text   ${caller-id}      12345678
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
     Select Drop down option         Test - General
    Sleep  3s
     Click Drop Down By Name         Subcategory
    Select Drop down option         Test - General - Other
     sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback
    sleep  3s

    #Click Drop Down By Name     Whisper
    #Sleep  3s
    #Select Dropdown Option      Test - General   index=2

   # Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes

     #Sleep  3s
     #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General     index=2

    #Execute javascript  window.scrollTo(0,800)
   # Sleep  3s
#    Click Element     ${Description}
#    Input Text   ${Description}      ${DescriptionValue}

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
    Log To Console   \n
    ${Casetype}=     Get Value    ${CaseTypeVal}
     Log to Console        ${Casetype}


Central Agent Creates Case1
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    Click Element                   ${next-modal-btn}

    #Input Text   ${caller-id}      12345678
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
     Select Drop down option         Test - General
    Sleep  3s
     Click Drop Down By Name         Subcategory
    Select Drop down option         Test - General - Other
     sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback
    sleep  3s

    #Click Drop Down By Name     Whisper
    #Sleep  3s
    #Select Dropdown Option      Test - General   index=2

   # Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes

     #Sleep  3s
     #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General     index=2

    #Execute javascript  window.scrollTo(0,800)
   # Sleep  3s
#    Click Element     ${Description}
#    Input Text   ${Description}      ${DescriptionValue}

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
    Log To Console   \n
    ${Casetype}=     Get Value    ${CaseTypeVal}
     Log to Console        ${Casetype}


Agent Creates Sub Case
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    sleep  4s
    page should contain element     ${new-sub-case-btn}
    Click Element                   ${new-sub-case-btn}
    Click Element                   ${next-modal-btn}

Agent Creates Case - IANTO
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    #Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
    # Select Drop down option         IA NHS Test Ordering (IANTO)
      Select Drop down option         NHS UKHSA (IANTO)

     #Click Drop Down By Name         Subcategory
     #Select Drop down option         Test - General - Other


 #   Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback
    Sleep  3s
    #Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes
    Sleep  3s
   # Click Drop Down By Name2     Whisper
   #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General      index=2


    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
    Log To Console   \n
    ${Casetype}=     Get Value    ${CaseTypeVal}
     Log to Console        ${Casetype}


Agent Creates Case - NON-IANTO
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

   # Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
     Select Drop down option         Test - General


     #Click Drop Down By Name         Subcategory
     #Select Drop down option         Test - General - Other


    #Click Element                   ${account-name-lookup}
    #Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback
    Sleep  3s
    #Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes
    Sleep  3s
   # Click Drop Down By Name2     Whisper
   #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General      index=2


    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
   # Log To Console   \n
    #${Casetype}=     Get Value    ${CaseTypeVal}
    # Log to Console        ${Casetype}

Agent Creates Trace Case - NON-IANTO
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

   # Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
     Select Drop down option         Contact Tracing


     Click Drop Down By Name         Subcategory
     Select Drop down option         Contact Tracing - Other


#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Complaint
    Sleep  3s
    #Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes
    Sleep  3s
   # Click Drop Down By Name2     Whisper
   #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General      index=2

    Click Save
    #Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s



Non-Ianto Agent Creates Case - IANTO
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

   # Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
     Select Drop down option         NHS UKHSA (IANTO)


#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Complaint
    Sleep  3s
#    Click Drop Down By Name     Whisper Accurate
 #   Select Dropdown Option      Yes
    Sleep  3s
   # Click Drop Down By Name2     Whisper
  # Click Element                   ${whisper_Ian}
    Sleep  3s
   # Select Dropdown Option      Test - General      index=2

    Click Save
    #Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

MPTrace Non-Ianto Agent Creates Case - IANTO
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
     Select Drop down option         NHS UKHSA (IANTO)


#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Complaint
    Sleep  3s
    #Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes
    Sleep  3s
   # Click Drop Down By Name2     Whisper
    #Click Element                   ${whisper_Ian}
    Sleep  3s
    #Select Dropdown Option      Test - General      index=2

    Click Save
    #Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
Central Non-Ianto Agent Creates Case - IANTO
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    Click Element                   ${next-modal-btn}

    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
     Select Drop down option         NHS UKHSA (IANTO)


#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Complaint
    Sleep  3s
    Click Drop Down By Name     Whisper Accurate
    Select Dropdown Option      Yes
    Sleep  3s
   # Click Drop Down By Name2     Whisper
   Click Element                   ${whisper_Ian}
    Sleep  3s
    Select Dropdown Option      Test - General      index=2

    Click Save
    #Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s



Agent Creates Case - Trace
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    Click Element                 ${new-case-btn_Trace}

    #Click Element                   ${next-modal-btn}

    Click Drop Down By Name         Case Origin
    Select Drop down option         Online-Email
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Priority Reasons
   Select Drop down option         Other

     Click Drop Down By Name         Category
    Select Drop down option         Contact Tracing



     Click Drop Down By Name         Subcategory
    Select Drop down option         Contact Tracing - Other

#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback

   # Click Drop Down By Name     Whisper
   #Select Dropdown Option      Test - General
     #Click Element                   ${whisper_Ian}
    #Sleep  3s
   # Select Dropdown Option      Test - General      index=2
#
#    Click Drop Down By Name     Whisper Accurate
#    Select Dropdown Option      Yes

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

Agent Creates Case - Trace1
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    #Click Element                 ${new-case-btn_Trace}

    #Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Online-Email

    Click Drop Down By Name         Priority Reasons
   Select Drop down option         Other

     Click Drop Down By Name         Category
    Select Drop down option         Contact Tracing



    Click Drop Down By Name         Subcategory
    Select Drop down option         Contact Tracing - Other

#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback

   #Click Drop Down By Name     Whisper
   #Select Dropdown Option      Test - General

   #  Click Element                   ${whisper_Ian}
   # Sleep  3s
    #Select Dropdown Option      Test - General      index=2
#
#    Click Drop Down By Name     Whisper Accurate
#    Select Dropdown Option      Yes

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s


Central Agent Creates Case - Trace
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    Click Element                 ${new-case-btn_Trace}

    Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s

    Click Drop Down By Name         Case Origin
    Select Drop down option         Online-Email

    Click Drop Down By Name         Priority Reasons
   Select Drop down option         Other

     Click Drop Down By Name         Category
    Select Drop down option         Contact Tracing



     Click Drop Down By Name         Subcategory
    Select Drop down option         Contact Tracing - Other

    Click Drop Down By Name         Case type
    Select Drop down option         Feedback

    #Click Drop Down By Name     Whisper
   #Select Dropdown Option      Test - General

    # Click Element                   ${whisper_Ian}
   # Sleep  3s
    #Select Dropdown Option      Test - General      index=2
#
#    Click Drop Down By Name     Whisper Accurate
#    Select Dropdown Option      Yes

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s




Agent Creates Case - Trace - Complaint
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    Click Element                 ${new-case-btn_Trace}

   # Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
    Select Drop down option         Contact Tracing

     Click Drop Down By Name         Subcategory
    Select Drop down option         Contact Tracing - Other

#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Complaint

#    Click Drop Down By Name     Whisper
#    Select Dropdown Option      Test - General
#
#    Click Drop Down By Name     Whisper Accurate
#    Select Dropdown Option      Yes

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

Agent Creates Case - Trace - Complaint1
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    #Click Element                 ${new-case-btn_Trace}

   # Click Element                   ${next-modal-btn}
    Sleep  3s
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
    Select Drop down option         Contact Tracing

     Click Drop Down By Name         Subcategory
    Select Drop down option         Contact Tracing - Other

#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Scroll Element Into View       (//*[contains(text(),'Case type')])[1]
    Sleep  3s
    Click Drop Down By Name         Case type
    Sleep  4s
    #Select Drop down option         Complaint
    Select Drop down option complaints

#    Click Drop Down By Name     Whisper
#    Select Dropdown Option      Test - General
#
#    Click Drop Down By Name     Whisper Accurate
#    Select Dropdown Option      Yes

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s



Agent Creates Case for RTSLTS Agent
    [Documentation]  Pre-requiste - Agent must be on the Cases tab

    Click Element                   ${new-case-btn}

#    Click Element                   ${next-modal-btn}

    Click Drop Down By Name            Case Origin
    GlobalButtons.Select Drop down option         Phone Enquiries

     Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  2s
    Click Drop Down By Name            Category
    GlobalButtons.Select Drop down option       Test - General

    Sleep  3s
    Click Drop Down By Name         Subcategory
    GlobalButtons.Select Drop down option          Regional Test Sites and Local Test Sites (RTS/LTS)
    Sleep  4s
    Click Drop Down By Name         Case type
    GlobalButtons.Select Drop down option         Feedback

    #Click Drop Down By Name     Whisper
    Sleep  3s
    #Select Dropdown Option      Test - General   index=2

    #Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes
    Sleep  3s
    #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General      index=2
    Sleep  3s


    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

Agent Creates Case without Case Type
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    Sleep  3s
   # Click Element                   ${next-modal-btn}

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s

    Click Save
    ${ErrorMessageNotified}=  Get Text    ${ErrorMessagecaptured}
      Log to Console    ${ErrorMessageNotified}
     Should Contain Any  ${ErrorMessageNotified}    ${ErrorMessageNotified}
    Sleep  2s

    Click element    //lightning-button-icon/button[@title="Close error dialog"]
    Sleep  2s
     Click Drop Down By Name         Case type
    GlobalButtons.Select Drop down option         Feedback

     Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    Sleep  8s


Agent Creates Case for Specialist
    [Documentation]  Pre-requiste - Agent must be on the Cases tab

    Click Element                   ${new-case-btn}

    Click Element                   ${next-modal-btn}

    Click Drop Down By Name            Case Origin
    GlobalButtons.Select Drop down option         Phone Enquiries

     Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  2s
    Click Drop Down By Name            Category
    GlobalButtons.Select Drop down option          Test - General

    Input Text   ${caller-id}      12345678

     Click Drop Down By Name            Subcategory
    GlobalButtons.Select Drop down option          Test - General - Other
    Sleep  3s


    Click Drop Down By Name         Case type
    GlobalButtons.Select Drop down option         Feedback

   #Click Drop Down By Name     Whisper
   Sleep  3s
    #Select Dropdown Option      Test - General   index=2

    #Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes
    Sleep  3s
    #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General      index=2
    Sleep  3s

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   8s
Agent Creates Case for Specialist1
    [Documentation]  Pre-requiste - Agent must be on the Cases tab

    Click Element                   ${new-case-btn}

    #Click Element                   ${next-modal-btn}

    Click Drop Down By Name            Case Origin
    GlobalButtons.Select Drop down option         Phone Enquiries

     Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  2s
    Click Drop Down By Name            Category
    GlobalButtons.Select Drop down option          Test - General

     Click Drop Down By Name            Subcategory
    GlobalButtons.Select Drop down option          Test - General - Other
    Sleep  3s


    Click Drop Down By Name         Case type
    GlobalButtons.Select Drop down option         Feedback

   #Click Drop Down By Name     Whisper
   Sleep  3s
    #Select Dropdown Option      Test - General   index=2

    #Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes
    Sleep  3s
    #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General      index=2
    Sleep  3s

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   8s


Agent Creates Not a Genunine Case - Test
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

   # Click Element                   ${next-modal-btn}

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries
    Sleep   3s
    Click Drop Down By Name         Category
    Select Drop down option         Test - General

     Click Drop Down By Name         Subcategory
    Select Drop down option         Test - General - Other

      Click Drop Down By Name         Case type
    GlobalButtons.Select Drop down option         Feedback

   Click Drop Down By Name         Not A Genuine Case
    Select Drop down option        Yes

    #Click Drop Down By Name     Whisper
    Sleep  3s
    #Select Dropdown Option      Test - General   index=2

     #Click Drop Down By Name     Whisper Accurate
     #Select Dropdown Option      Yes        index=2
     Sleep  3s
     #Click Element                   ${whisper_Ian}
    Sleep  3s
    #Select Dropdown Option      Test - General      index=2
    Sleep  3s
    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

Central Agent Creates Not a Genunine Case - Test
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    Click Element                   ${next-modal-btn}

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries
    Sleep   3s
    Click Drop Down By Name         Category
    Select Drop down option         Test - General

     Click Drop Down By Name         Subcategory
    Select Drop down option         Test - General - Other

      Click Drop Down By Name         Case type
    GlobalButtons.Select Drop down option         Feedback

   Click Drop Down By Name         Not A Genuine Case
    Select Drop down option        Yes

    #Click Drop Down By Name     Whisper
    Sleep  3s
    #Select Dropdown Option      Test - General   index=2

     #Click Drop Down By Name     Whisper Accurate
     #Select Dropdown Option      Yes        index=2
     #Sleep  3s
     #Click Element                   ${whisper_Ian}
    Sleep  3s
    #Select Dropdown Option      Test - General      index=2
    Sleep  3s
    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s


Agent Creates Not a Genunine Case - Trace
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    Click Element                   ${new-case-btn_Trace}
    Click Element                   ${next-modal-btn}

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries
    Sleep   3s
     Click Drop Down By Name            Category
    GlobalButtons.Select Drop down option          Contact Tracing

     Click Drop Down By Name            Subcategory
    GlobalButtons.Select Drop down option          Contact Tracing - Other

      Click Drop Down By Name         Case type
    GlobalButtons.Select Drop down option         Feedback

   Click Drop Down By Name         Not A Genuine Case
    Select Drop down option        Yes

   # Click Drop Down By Name     Whisper
    Sleep  3s
   # Select Dropdown Option      Test - General

   # Click Drop Down By Name     Whisper Accurate
   #  Select Dropdown Option      Yes    index=2

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

Agent Creates Case for IA Surge Team - without Consent Required field
    [Documentation]  Pre-requiste - Agent must be on the Cases tab

    Click Element                   ${new-case-btn}

#    Click Element                   ${next-modal-btn}

    Click Drop Down By Name            Case Origin
    GlobalButtons.Select Drop down option         Phone Enquiries

    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  2s
    Click Drop Down By Name            Category
    GlobalButtons.Select Drop down option          International arrivals

     Click Drop Down By Name            Subcategory
    GlobalButtons.Select Drop down option          International Arrivals - Exemptions
    Sleep  3s


    Click Drop Down By Name         Case type
    GlobalButtons.Select Drop down option         International Arrival Exemption Request

    Click Drop Down By Name         Relationship
    GlobalButtons.Select Drop down option        Relative

#    Click Drop Down By Name     Whisper
#    Select Dropdown Option      Test - General
#
#        Click Drop Down By Name     Whisper Accurate
#        Select Dropdown Option      Yes
    Click Save
#    ${ErrorMessageNotified}=  Get Text    ${ErrorMessagecaptured}
#      Log to Console    ${ErrorMessageNotified}
#     Should Contain Any  ${ErrorMessageNotified}    ${ErrorMessageNotified}
#    Sleep  2s
#    Click Drop Down By Name         Consent Required
#    GlobalButtons.Select Drop down option         Yes

#    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   8s

Agent Creates Case - IA
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    Sleep  2s
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

    Click Drop Down By Name     Case type
    Select Dropdown Option      International Arrival Exemption Request

    Click Drop Down By Name     Category
    Select Dropdown Option      International Arrival

    Click Drop Down By Name     Subcategory
    Select Dropdown Option      International Arrivals - Exemption - Job

    #Click Drop Down By Name     Whisper
    #Sleep  3s
       # Select Dropdown Option      Test - General

     #   Click Drop Down By Name     Whisper Accurate
      #  Select Dropdown Option      Yes
    Sleep  3s

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

Agent Creates Case -RIT
        [Documentation]  Pre-requiste - Agent must be on the Cases tab

        Click Element                   ${new-case-btn}
    #Click Element                   ${new-casAgent Creates Casee-btn}


    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
        Click Drop Down By Name         Category
         Select Drop down option         Test - General

          Click Drop Down By Name         Subcategory
         Select Drop down option         Test - General - Other

#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback
    #Click Drop Down By Name     Whisper
    Sleep  3s
    #Select Dropdown Option      Test - General     index=2
     #Click Drop Down By Name     Whisper Accurate
     #Select Dropdown Option      Yes
     Sleep  3s
    #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General      index=2


    Input Date Field By Name     RIT Investigation Date     01/01/2021
    Input Date Field By Name     RIT Date Returned          02/03/2021

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
Agent Creates Case - MP Complaints
        [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    Click Element                 ${new-case-btn_Trace}
    Run Keyword And Ignore Error       Click Next Button
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         MP Trace Mailbox

     Click Drop Down By Name        Origin Demographics
    Select Drop down option MP

     Click Drop Down By Name         Category
    Select Drop down option         Test - General

     Click Drop Down By Name         Subcategory
    Select Drop down option        Test - General - Other


#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback

   Execute javascript  window.scrollTo(0,800)
#
#   Click Element     ${MP_Reference}
#   Input Text      ${MP_Reference}      ${MP_Referencevalue}

    Input Text Field By Name      MP Case Reference     6565656


     Click Drop Down By Name         MP Case Status
    Select Drop down option         Ready to Send




    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
    #Display Field text Should Be    Category        MP Trace

Agent Creates Case - MP Complaints without Demographics selected
        [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    Click Element                 ${new-case-btn_Trace}
    Click Element                   ${next-modal-btn}

    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         MP Trace Mailbox

     #Click Drop Down By Name        Origin Demographics
    #Select Drop down option         MP

     Click Drop Down By Name         Category
    Select Drop down option         Test - General

     Click Drop Down By Name         Subcategory
    Select Drop down option        Test - General - Other


#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback

   Execute javascript  window.scrollTo(0,800)
#
#   Click Element     ${MP_Reference}
#   Input Text      ${MP_Reference}      ${MP_Referencevalue}

    Input Text Field By Name      MP Case Reference     6565656


     Click Drop Down By Name         MP Case Status
    Select Drop down option         Ready to Send




    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
    #Display Field text Should Be    Category        MP Trace


Agent Creates Not a Genunine Case - MP Trace
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Sleep  2s
    Click Element                   ${new-case-btn}
    Click Element                   ${new-case-btn_Trace}
    Click Element                   ${next-modal-btn}

    Click Drop Down By Name         Case Origin
    Select Drop down option         MP Trace Mailbox
    Sleep   3s
#     Click Drop Down By Name            Category
#    GlobalButtons.Select Drop down option          Contact Tracing
#
#     Click Drop Down By Name            Subcategory
#    GlobalButtons.Select Drop down option          Contact Tracing - Other

      Click Drop Down By Name         Case type
    GlobalButtons.Select Drop down option         Feedback

   Click Drop Down By Name         Not A Genuine Case
    Select Drop down option        Yes

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

MP Trace agent creates a case
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Sleep  2s
    Click Element                   ${new-case-btn}
    Click Element                   ${new-case-btn_Trace}
    Click Element                   ${next-modal-btn}
    Click Drop Down By Name         Case Origin
    Select Drop down option         MP Trace Mailbox
    Sleep   3s

    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case type
    Click Element                   //lightning-base-combobox-item[@data-value= 'Complaint']
#    Select Drop down option         Complaint
#    Execute javascript  window.scrollTo(0,600)
#    Execute javascript  window.scrollTo(0,600)
# fields below have been removed as part of 3960
#    Input Text Field By Name      MP Case Reference     6565656
#    sleep  5s
#    Click Drop Down By Name         MP Case Status
#    sleep  3s
    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

PTM Advisor creates a test provider
    [Documentation]  Pre-requiste - Agent must be Test Providers tab
    Sleep  2s
    Click Element                   ${new-case-btn}
    Sleep  2s
    Input Text Field PTM                 Test Provider Name     automation_test
    Input Text Field PTM                 Provider Code          abc1234
    Input Date Field By Name in PTM      Start Date             18/03/2022
    Click Element       ${ptm_save}
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s


Agent Creates Case - MQS IA Team
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    #Click Element                   ${next-modal-btn}
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries
    Sleep  2s
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep   3s
     #Click Drop Down By Name            Priority Reasons
     #GlobalButtons.Select Drop down option          Media/PR Interest
     Click Drop Down By Name            Category
    GlobalButtons.Select Drop down option     International Arrivals - MQS

     #Click Drop Down By Name            Subcategory
    #GlobalButtons.Select Drop down option          International Arrivals - Exemptions


     Sleep  3s
    Click Drop Down By Name         Case type
   Select Drop down option         Feedback
#
#      Click Drop Down By Name     Whisper
#           Select Dropdown Option      Test - General
#
#           Click Drop Down By Name     Whisper Accurate
#           Select Dropdown Option      Yes



    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

MP Trace Constituent name added
      Sleep  2s
     Click Edit
     Click Drop Down By Name     MP Case Status
    Select Dropdown Option      Further investigation required

    Click Element                   ${Constituent-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Click Save
    Wait Until Page Has Saved
    Sleep  3s

   # Display Field text Should Be    Category        MP Trace

Agent Creates Case - IA Surge Team -Unaccompanied Minors
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
#    Click Element                   ${new-case-btn_Trace}
#    Click Element                   ${next-modal-btn}
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries
    Sleep  2s
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep   3s
     Click Drop Down By Name            Priority Reasons
     GlobalButtons.Select Drop down option          Media/PR Interest
     Click Drop Down By Name            Category
    GlobalButtons.Select Drop down option     International arrivals

     Click Drop Down By Name            Subcategory
    GlobalButtons.Select Drop down option          International Arrivals - Exemptions


     Sleep  3s
    Click Drop Down By Name         Case type
   Select Drop down option          International Arrival Exemption Request
#
#      Click Drop Down By Name     Whisper
#           Select Dropdown Option      Test - General
#
#           Click Drop Down By Name     Whisper Accurate
#           Select Dropdown Option      Yes



    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

Agent Creates Case - IA Exemptions Team
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
#    Click Element                   ${new-case-btn_Trace}
#    Click Element                   ${next-modal-btn}
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries
    Sleep  2s
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep   3s
     Click Drop Down By Name            Priority Reasons
     GlobalButtons.Select Drop down option          Media/PR Interest
     Click Drop Down By Name            Category
    GlobalButtons.Select Drop down option     International arrivals

     Click Drop Down By Name            Subcategory
    GlobalButtons.Select Drop down option        International Arrivals - Exemptions


     Sleep  3s
    Click Drop Down By Name         Case type
   Select Drop down option          International Arrival Exemption Request

#      Click Drop Down By Name     Whisper
#           Select Dropdown Option      Test - General
#
#           Click Drop Down By Name     Whisper Accurate
#           Select Dropdown Option      Yes



    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s



Agent Creates a Closed Case
        [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    #Click Element                   ${next-modal-btn}

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s

    Click Drop Down By Name         Status
    Select Drop down option         Closed

    Click Save

Central Agent Creates a Closed Case
        [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    Click Element                   ${next-modal-btn}

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s

    Click Drop Down By Name         Status
    Select Drop down option         Closed

    Click Save
Check Error Message Content for whisperfield
    Page Should Contain        ${error-heading}
    Page Should Contain        ${error-text2}
    Capture Page Screenshot

Check Error Message Content for CloseCase
    Page Should Contain        ${error-heading}
    Page Should Contain        ${error-text1}
    Capture Page Screenshot

Check Error Message Content for PPAT IR CloseCase
    Page Should Contain        ${error-heading}
    Page Should Contain        ${error-text9}
    Page Should Contain        ${error-text10}
    Capture Page Screenshot

Check Error Message Content for PPAT IR CloseCase1
    Page Should Contain        ${error-heading}
    Page Should Contain        ${error-text9}
    #Page Should Contain        ${error-text10}
    Capture Page Screenshot

Check Content for PPAT IR CloseCase Data subject Rights
    Page Should Contain Element         //*[contains(text(),'S21 Information already accessible')]
    Page Should Contain Element         //*[contains(text(),'S22 Information intended for future publication')]
    Page Should Contain Element         //*[contains(text(),'S23 Information supplied by, or relating to, bodies dealing with security matters')]
    Page Should Contain Element       //*[contains(text(),'S24 National security')]
    Page Should Contain Element         //*[contains(text(),'S26 Defence')]
    Page Should Contain Element         //*[contains(text(),'S27(1) International relations -prejudice')]
    Page Should Contain Element         //*[contains(text(),'S27(2) International relations – information provided in confidence by other states or international organisations or courts')]
    Page Should Contain Element         //*[contains(text(),'S28 Relations within the UK')]
    Page Should Contain Element         //*[contains(text(),'S29 The economy')]
    Page Should Contain Element         //*[contains(text(),'S30(1) Criminal investigations and proceedings conducted by the authority')]
    Page Should Contain Element         //*[contains(text(),'S30(2) Relating to civil or criminal investigations and proceedings which use confidential sources')]
    Page Should Contain Element         //*[contains(text(),'S31 Law enforcement')]
    Page Should Contain Element         //*[contains(text(),'S32 Court records etc.')]
    Page Should Contain Element         //*[contains(text(),'S33 Audit functions')]
    Page Should Contain Element         //*[contains(text(),'S34 Parliamentary privilege')]
    Page Should Contain Element         //*[contains(text(),'S35(1)(a) Formulation of government policy')]
    Page Should Contain Element         //*[contains(text(),'S35(1)(b) Ministerial communications')]
    Page Should Contain Element         //*[contains(text(),"S35(1)(c) Law Officers' advice")]
    Page Should Contain Element         //*[contains(text(),'S35(1)(d) Operation of Ministerial Private Office')]
    Page Should Contain Element         //*[contains(text(),'S36 Prejudice to effective conduct of public affairs')]
    Page Should Contain Element         //*[contains(text(),'S37(1)(a) Communications with Royal Family and Household (Sovereign and person who is, or becomes, heir and second heir)')]
    Page Should Contain Element         //*[contains(text(),'S37(1)(a-a) Communications with other members of the Royal Family')]
    Page Should Contain Element         //*[contains(text(),'S37(1)(b) Honours')]
    Page Should Contain Element         //*[contains(text(),'S38 Health and safety')]
    Page Should Contain Element         //*[contains(text(),'S39 Environmental information')]
    Page Should Contain Element         //*[contains(text(),'S40(1) Personal information where the applicant is data subject')]
    Page Should Contain Element         //*[contains(text(),'S40(2) Personal information where the applicant is a third party')]
    Page Should Contain Element         //*[contains(text(),'S41 Information provided in confidence')]
    Page Should Contain Element         //*[contains(text(),'S42 Legal professional privilege')]
    Page Should Contain Element         //*[contains(text(),'S43(1) Trade secret')]
    Page Should Contain Element         //*[contains(text(),'S43 (2) Commercial interests')]
    Page Should Contain Element         //*[contains(text(),'S44 Prohibitions on disclosure: (a) acts (b) community obligations (c) contempt of court')]
    Page Should Contain Element         //*[contains(text(),'S12 Cost of compliance exceeds appropriate limit')]
    Page Should Contain Element         //*[contains(text(),'S14 Vexatious or repeated request')]


Check Content for PPAT IR CloseCase Information rights
    Page Should Contain Element         //*[contains(text(),'S21 Information already accessible')]
    Page Should Contain Element         //*[contains(text(),'S22 Information intended for future publication')]
    Page Should Contain Element         //*[contains(text(),'S23 Information supplied by, or relating to, bodies dealing with security matters')]
    Page Should Contain Element         //*[contains(text(),'S24 National security')]
    Page Should Contain Element         //*[contains(text(),'S26 Defence')]
    Page Should Contain Element         //*[contains(text(),'S27(1) International relations -prejudice')]
    Page Should Contain Element         //*[contains(text(),'S27(2) International relations – information provided in confidence by other states or international organisations or courts')]
    Page Should Contain Element         //*[contains(text(),'S28 Relations within the UK')]
    Page Should Contain Element         //*[contains(text(),'S29 The economy')]
    Page Should Contain Element         //*[contains(text(),'S30(1) Criminal investigations and proceedings conducted by the authority')]
    Page Should Contain Element         //*[contains(text(),'S30(2) Relating to civil or criminal investigations and proceedings which use confidential sources')]
    Page Should Contain Element         //*[contains(text(),'S31 Law enforcement')]
    Page Should Contain Element         //*[contains(text(),'S32 Court records etc.')]
    Page Should Contain Element         //*[contains(text(),'S33 Audit functions')]
    Page Should Contain Element         //*[contains(text(),'S34 Parliamentary privilege')]
    Page Should Contain Element         //*[contains(text(),'S35(1)(a) Formulation of government policy')]
    Page Should Contain Element         //*[contains(text(),'S35(1)(b) Ministerial communications')]
    Page Should Contain Element         //*[contains(text(),"S35(1)(c) Law Officers' advice")]
    Page Should Contain Element         //*[contains(text(),'S35(1)(d) Operation of Ministerial Private Office')]
    Page Should Contain Element         //*[contains(text(),'S36 Prejudice to effective conduct of public affairs')]
    Page Should Contain Element         //*[contains(text(),'S37(1)(a) Communications with Royal Family and Household (Sovereign and person who is, or becomes, heir and second heir)')]
    Page Should Contain Element         //*[contains(text(),'S37(1)(a-a) Communications with other members of the Royal Family')]
    Page Should Contain Element         //*[contains(text(),'S37(1)(b) Honours')]
    Page Should Contain Element         //*[contains(text(),'S38 Health and safety')]
    Page Should Contain Element         //*[contains(text(),'S39 Environmental information')]
    Page Should Contain Element         //*[contains(text(),'S40(1) Personal information where the applicant is data subject')]
    Page Should Contain Element         //*[contains(text(),'S40(2) Personal information where the applicant is a third party')]
    Page Should Contain Element         //*[contains(text(),'S41 Information provided in confidence')]
    Page Should Contain Element         //*[contains(text(),'S42 Legal professional privilege')]
    Page Should Contain Element         //*[contains(text(),'S43(1) Trade secret')]
    Page Should Contain Element         //*[contains(text(),'S43 (2) Commercial interests')]
    Page Should Contain Element         //*[contains(text(),'S44 Prohibitions on disclosure: (a) acts (b) community obligations (c) contempt of court')]
    Page Should Contain Element         //*[contains(text(),'S12 Cost of compliance exceeds appropriate limit')]
    Page Should Contain Element         //*[contains(text(),'S14 Vexatious or repeated request')]
    Page Should Contain Element         //*[contains(text(),'R13 Personal data')]
    Page Should Contain Element         //*[contains(text(),'R12(3) Personal data of someone other than the applicant')]
    Page Should Contain Element         //*[contains(text(),'R12(4)(b) Manifestly unreasonable')]
    Page Should Contain Element         //*[contains(text(),'S12(5)(a) International relations, defence, national security or public safety')]
    Page Should Contain Element         //*[contains(text(),'S12(5)(a) International relations, defence, national security or public safety')]
    Page Should Contain Element         //*[contains(text(),'R12(5)(b) Course of justice, ability of a person to receive a fair trial or ability of a public authority to conduct a criminal or disciplinary inquiry')]
    Page Should Contain Element         //*[contains(text(),'R12(5)(c) Intellectual property rights')]
    Page Should Contain Element         //*[contains(text(),'R12(5)(d) Confidentiality of proceedings of that or any other authority where such confidentiality is provided by law')]
    Page Should Contain Element         //*[contains(text(),'R12(5)(e) Confidentiality of commercial or industrial information where such confidentiality is provided by law to protect a legitimate economic interest')]
    Page Should Contain Element         //*[contains(text(),'R12(5)(f) Interests of person who provided information')]
    Page Should Contain Element         //*[contains(text(),'R12(5)(g) The protection of the environment to which the information relates')]



Check Error Message Content for ExtendedDeadline
    Page Should Contain        ${error-heading}
    Page Should Contain        ${error-text8}
    Capture Page Screenshot

Check Error Message Content for Complaintsmailbox
    Page Should Contain        ${error-heading}
    Page Should Contain        ${error-text7}
    Capture Page Screenshot

Check Error Message Content for NON-IANTOCase
    Page Should Contain        ${error-heading}
    Page Should Contain        ${error-text3}
    Capture Page Screenshot

Check Error Message Content for IANTOCase creation from non-ianto agent
    Page Should Contain        ${error-heading}
    Page Should Contain        ${error-text4}
    Capture Page Screenshot

Check Error Message Content for IANTOCase edit from non-ianto agent
    Page Should Contain        ${error-heading}
    Page Should Contain        ${error-text5}
    Capture Page Screenshot



Check Error Message Content for IANTOCase close without sub-category
    Page Should Contain        ${error-heading}
    Page Should Contain        ${error-text6}
    Capture Page Screenshot

Check Error Message Content
    Page Should Contain        ${error-heading}
    Capture Page Screenshot

EFC Central Agent Creates a Trace Closed Case
        [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    Click Element                   ${Complaints&EnquiriesTrace}

    Click Element                   ${next-modal-btn}

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s

    Click Drop Down By Name         Status
    Select Drop down option         Closed

    Click Save
    Sleep  2s
    Capture Page Screenshot

Agent Creates Case -Priority Reason validation
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    #Click Element                   ${next-modal-btn}

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}

    Click Drop Down By Name         Priority
    Select Drop down option         High

     Click Drop Down By Name         Category
    Select Drop down option         Test - General

     Click Drop Down By Name         Subcategory
    Select Drop down option         Test - General - Other
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback

    #Click Drop Down By Name     Whisper
     #Select Dropdown Option      Test - General   index=2
     Sleep  3s
    Click Drop Down By Name     Whisper Accurate
    Select Dropdown Option      Yes
    Sleep  3s
    Click Element                   ${whisper_Ian}
    Sleep  3s
    Select Dropdown Option      Test - General  index=2
    Click Save

    ${ErrorMessageNotified}=  Get Text    ${ErrorMessagecaptured}
     Log to Console    ${ErrorMessageNotified}
    Should Contain Any  ${ErrorMessageNotified}    ${ErrorMessageNotified}

    Sleep  2s

     Click Drop Down By Name         Priority Reasons
     Select Drop down option         Severe Financial Hardship

    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

Central Agent Creates Case -Priority Reason validation
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    Click Element                   ${next-modal-btn}

    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}

    Click Drop Down By Name         Priority
    Select Drop down option         High

     Click Drop Down By Name         Category
    Select Drop down option         Test - General

     Click Drop Down By Name         Subcategory
    Select Drop down option         Test - General - Other
    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback

    #Click Drop Down By Name     Whisper
     #Select Dropdown Option      Test - General   index=2
     Sleep  3s
   # Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes
    #Sleep  3s
    #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General  index=2
    Click Save

    ${ErrorMessageNotified}=  Get Text    ${ErrorMessagecaptured}
     Log to Console    ${ErrorMessageNotified}
    Should Contain Any  ${ErrorMessageNotified}    ${ErrorMessageNotified}

    Sleep  2s

     Click Drop Down By Name         Priority Reasons
     Select Drop down option         Severe Financial Hardship

    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s


Agent Creates Case - MP Complaints without mandatory fields
        [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    Click Element                 ${new-case-btn_Trace}
     Click Element                   ${next-modal-btn}

    Click Drop Down By Name         Case Origin
    Select Drop down option         MP Trace Mailbox

    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s

     Click Drop Down By Name         Origin Demographics
     Select Drop down option MP

     #Click Drop Down By Name         Subcategory
    #Select Drop down option        School, Business or Organisation

      Click Drop Down By Name         Category
    Select Drop down option         Test - General

     Click Drop Down By Name         Subcategory
    Select Drop down option         Test - General - Other

#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback
    Click Save
    ${ErrorMessageNotified}=  Get Text    ${ErrorMessagecaptured}
    Log to Console    ${ErrorMessageNotified}
    Should Contain Any  ${ErrorMessageNotified}    ${ErrorMessageNotified}
    Sleep  2s
    Click Drop Down By Name         Case type
    Select Drop down option         Complaint
   Execute javascript  window.scrollTo(0,800)
    Input Text Field By Name      MP Case Reference     6565656
    Click Drop Down By Name         MP Case Status
    Select Drop down option         Ready to Send
    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
    #Display Field text Should Be    Category        MP Trace

Agent Creates Case - MP Complaints test case without mandatory fields
        [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
   # Click Element                 ${new-case-btn_Trace}
     Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

    Click Drop Down By Name         Origin Demographics
    Select Drop down option MP

     #Click Drop Down By Name         Subcategory
    #Select Drop down option        School, Business or Organisation

#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Complaint

   #Click Drop Down By Name     Whisper
    Sleep  3s
    #Select Dropdown Option      Test - General
    #Sleep   2s
    #Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes
    #Sleep  3s
    #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General

    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
Agent Creates Case - MP Complaints test case without mandatory fields1
        [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
   # Click Element                 ${new-case-btn_Trace}
     Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

    Click Drop Down By Name         Origin Demographics
    Select Drop down option MP

     #Click Drop Down By Name         Subcategory
    #Select Drop down option        School, Business or Organisation

#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    #Select Drop down option         Complaint
    Select Drop down option complaints
   #Click Drop Down By Name     Whisper
    Sleep  3s

    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s

New Account Selection
        Sleep  2s
        Click Element                   ${account-name-lookup}
       Click Element                   ${account-name-New Account}


Person Account Validation
   [Documentation]  Pre-requiste - Agent must be on the Cases tab
       Click Element                   ${new-case-btn}

       #Click Element                   ${next-modal-btn}
        Click Element                   ${account-name-lookup}
        Click Element                   ${account-name-lookup-first-option1}
        Sleep  3s


#       Click Element                   ${account-name-lookup}
#       Click Element                   ${account-name-New Account}
#       Sleep  3s
       #Click Element                   ${next-modal-btn}
        #Click Drop Down By Name         Salutation
        Click Element       //span[text()='Salutation']/ancestor::div[1]//a
        #Select Drop down option         Mr.
        #Select Drop down option salutation
        Select Drop down option (bug fix)    Mr.
        #${hex}   Generate Random String[NUMBERS]abcdef

         Input Text Field By PersonAccountName      First Name   Geetha2
          Sleep   2s
         Input Text Field By PersonAccountName      Last Name   Karthick1234


         Input Text Field By PersonAccountName       Email    ggd@gmail.com
         Input Text Field By PersonAccountName       Mobile     98765454647
         Sleep   2s
         #Click Drop Down By Name         Future contact
         Click Element   //span[text()='Future contact']/ancestor::div[1]//a
         #Select Drop down option         Yes - email only
         Select Drop down option (bug fix)  Yes - email only
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
         Click Element   (//span[contains(text(), 'Save')])[3]
        Wait Until Page Contains     was created
        Sleep  4s

         Click Drop Down By Name         Case Origin
       Select Drop down option         Phone Enquiries

        Click Drop Down By Name         Category
       Select Drop down option         Test - General

        Click Drop Down By Name         Subcategory
       Select Drop down option         Test - General - Other

         Click Drop Down By Name         Case type
         Select Drop down option         Feedback

         #Click Drop Down By Name     Whisper Accurate
         #Select Dropdown Option      Yes

         Sleep  3s
         #Click Element                   ${whisper_Ian}
         #Sleep  3s
         #Select Dropdown Option      Test - General      index=2


         Click Save
         Wait Until Page Contains   was created

Live Issue Search Text
    Sleep  3s
    Execute javascript  window.scrollTo(0,1200)
    Scroll Element Into View    (//*[contains(text(),'Web Email')])[2]
    Click Element   ${Search_LiveIssue}
    Input Text     ${Search_LiveIssue}    ${Search_LiveIssue_Val}
    Execute javascript  window.scrollTo(0,900)
    Click Element       //lightning-base-combobox-item//span[contains(text(),'The sky is falling')]/ancestor::span//ul/li[1]
    Sleep  2s

Live Issue Search Text test
    Sleep  3s
    Execute javascript  window.scrollTo(0,1200)
    Scroll Element Into View    ${search_Hospitals}
    Click Element   ${Search_LiveIssue}
    Input Text     ${Search_LiveIssue}    ${Search_LiveIssue_Val}
    Execute javascript  window.scrollTo(0,900)
    Click Element       //lightning-base-combobox-item//span[contains(text(),'The sky is falling')]/ancestor::span//ul/li[1]
    Sleep  2s



Live Issue Search Text Inbound Expert Agent
    Sleep  3s
    Execute javascript  window.scrollTo(0,900)
    Scroll Element Into View        //*[@name="ECDElective_Care_Order_ID__c"]
    Click Element   ${Search_LiveIssue}
    Input Text     ${Search_LiveIssue}    ${Search_LiveIssue_Val}
    Execute javascript  window.scrollTo(0,900)
    Click Element        //lightning-base-combobox-item//span[contains(text(),'The sky is falling')]/ancestor::span//ul/li[1]
    #${account-name-lookup-first-option}
    Sleep  2s

Agent Creates Case IA
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}
    Click Drop Down By Name         Case Origin
    Select Drop down option         Online-Email
     Click Drop Down By Name        Case type
     Select Drop down option        Complaint
     Click Element                   ${account-name-lookup}
     Click Element                   ${account-name-lookup-first-option}
     sleep   2s
     Click Save
     Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
     sleep   4s

Agent Creates Case RIT Validation
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

   # Click Element                   ${next-modal-btn}
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
     Select Drop down option         Test - General

     Click Drop Down By Name         Subcategory
    Select Drop down option         Test - General - Other
     sleep  3s

#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback
    sleep  3s

    #Click Drop Down By Name     Whisper
    #Sleep  3s
    #Select Dropdown Option      Test - General   index=2

   # Click Drop Down By Name     Whisper Accurate
    #Select Dropdown Option      Yes

     Sleep  3s
     #Click Element                   ${whisper_Ian}
    #Sleep  3s
    #Select Dropdown Option      Test - General      index=2

    Execute javascript  window.scrollTo(0,800)
    Sleep  3s
    Scroll Element Into View    //input[@placeholder='Search Live Issues...']
    Click Element     ${Description}
    Input Text   ${Description}      ${DescriptionValue}

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
    Log To Console   \n
    ${Casetype}=     Get Value    ${CaseTypeVal}
    Log to Console        ${Casetype}

Click Next Button
    Click Element       ${next-modal-btn}
    Sleep   2s


Specialist Agent Creates Case RIT Validation
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Click Element                   ${new-case-btn}

    Click Element                   ${next-modal-btn}

    Input Text   ${caller-id}      12345678
    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case Origin
    Select Drop down option         Phone Enquiries

     Click Drop Down By Name         Category
     Select Drop down option         Test - General

     Click Drop Down By Name         Subcategory
    Select Drop down option         Test - General - Other
     sleep  3s

#    Click Element                   ${account-name-lookup}
#    Click Element                   ${account-name-lookup-first-option}
#    Sleep  3s
    Click Drop Down By Name         Case type
    Select Drop down option         Feedback
    sleep  3s

    #Click Drop Down By Name     Whisper
    #Sleep  3s
    #Select Dropdown Option      Test - General   index=2

#    Click Drop Down By Name     Whisper Accurate
 #   Select Dropdown Option      Yes

     Sleep  3s
  #   Click Element                   ${whisper_Ian}
   # Sleep  3s
    #Select Dropdown Option      Test - General      index=2

    Execute javascript  window.scrollTo(0,1200)
    Sleep  3s
    Scroll Element Into View    //input[@placeholder='Search Live Issues...']
    Click Element     ${Description}
    Input Text   ${Description}      ${DescriptionValue}

    Click Save

    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s
    Log To Console   \n
    ${Casetype}=     Get Value    ${CaseTypeVal}
    Log to Console        ${Casetype}

Person Account Creation
    [Arguments]     ${First-Name}   ${Last Name}    ${Mobile}   ${Email}
#    Click Element                   ${person-account}
#    Click Next Button

    Click Drop Down By Name         Salutation
    Select Drop down option         Mr.
    Input Text Field By PersonAccount creation  First Name  ${First-Name}
    Input Text Field By PersonAccount creation  Last Name   ${Last Name}
    Input Text Field By PersonAccount creation  Mobile      ${Mobile}
    Input Text Field By PersonAccount creation  Email       ${Email}
    Sleep   2s
    
Populate Category picklist from Home Page    
    Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Elective_Care']
    Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Anti_Viral']
    Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Book_Order_a_test']
    Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Register_Test_Report_Result']
    Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Chase_Results']
    Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Trace_Isolation']
    Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Other']

Populate Whisper heard picklist from Home Page
    Click Element    ${whisper-heard-dropdown}
    Click Element    (//option[@value= 'Yes'])[1]
    Click Element    ${whisper-heard-dropdown}
    Click Element    (//option[@value= 'No'])[1]

Populate Whisper accurate picklist from Home Page
    Click Element    ${whisper-accurate-dropdown}
    Click Element    (//option[@value= 'Yes'])[2]
    Click Element    ${whisper-heard-dropdown}
    Click Element    (//option[@value= 'No'])[2]


Populate Subcategory elective-care field on Case form

    #Click Drop Down By Name         Outcome
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Courier booked to collect')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Courier not arrived to collect')][1]
    Click Element     ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Priority Postbox Query')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Missed Courier to collect')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Report Result_PCR_Neg')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Report Result_PCR_Pos')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Report Result_LFD_Neg')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Report Result_LFD_Pos')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Book Test')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Order Test')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Not Eligible')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Test not arrived/late delivery')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Missing part/instructions/damaged')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Enquiry_General')][1]
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Data Protection Issue')][1]


Populate Subcategory anti-viral field on Case form

    #Click Drop Down By Name         Outcome
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Courier booked to collect')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Courier not arrived to collect')][1]
    Click Element     ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Priority Postbox Query')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Report Result_PCR_Neg')][1]
    Click Element      ${sub-category-antivir}
       Click Element    //option[contains(text(),'AV_Report Result_PCR_Pos')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Report Result_LFD_Neg')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Report Result_LFD_Pos')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Referral for treatment request')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_No contact NHS treatment >24 hours after result')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Query need for PCR after LFD result')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Book Test')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Order Test')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Not Eligible')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Test not arrived/late delivery')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Missing part/instructions/damaged')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV-Test Kits unexpected')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Enquiry_General')][1]
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Data Protection Issue')][1]

Populate Subcategory book-ordertest field on Case form

    #Click Drop Down By Name         Outcome
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Book Test_date time_PCR_LTS')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Book Test_date time_PCR_RTS')][1]
    Click Element     ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Pharmacy Collect code enquiry')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Private Provider Issue')][1]
    Click Element      ${sub-category-bookorder}
       Click Element    //option[contains(text(),'BT_Regional/Local test site enquiry')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_OLT Call to Specialist Team')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Order Test_NHS Staff')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Order Test_GP or 111 Referral')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_No Tests available')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Order Test')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Order Test_alternative format instructions')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Not Eligible')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Test not arrived/late delivery')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Missing part/instructions/damaged')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Advise on screen readers')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Enquiry_General')][1]
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Data Protection Issue')][1]




Populate Subcategory register test field on Case form

    #Click Drop Down By Name         Outcome
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Courier booked to collect')][1]
    Click Element     ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Courier not arrived to collect')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Priority Postbox Query')][1]
    Click Element      ${sub-category-register}
       Click Element    //option[contains(text(),'RRT_Missed Courier to collect')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Report Result_PCR_Neg')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Report Result_PCR_Pos')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Report Result_PCR_Void')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Report Result_LFD_Neg')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Report Result_LFD_Pos')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Report Result_LFD_Void')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Report Result_Private Provider')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Register - PCR')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Lab Publication')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Advise on screen readers')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Enquiry _General')][1]
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Data Protection Issue')][1]


Populate Subcategory chase field on Case form

    #Click Drop Down By Name         Outcome
    Click Element      ${sub-category-chase}
    Click Element    //option[contains(text(),'CR _Chase Result_Resend letter request')][1]
    Click Element     ${sub-category-chase}
    Click Element    //option[contains(text(),'CR _Chase Result _Resend SMS request')][1]
    Click Element      ${sub-category-chase}
    Click Element    //option[contains(text(),'AV_Chase Result_Missing')][1]
    Click Element      ${sub-category-chase}
       Click Element    //option[contains(text(),'EC_Chase Result_Missing')][1]
    Click Element      ${sub-category-chase}
    Click Element    //option[contains(text(),'CR _Chase Result_Missing')][1]
    Click Element      ${sub-category-chase}
    Click Element    //option[contains(text(),'AV_Chase Result_< 48 hours')][1]
    Click Element      ${sub-category-chase}
    Click Element    //option[contains(text(),'EC_Chase Result_< 48 hours')][1]
    Click Element      ${sub-category-chase}
    Click Element    //option[contains(text(),'CR _Chase Result _< 72 hrs')][1]
    Click Element      ${sub-category-chase}
    Click Element    //option[contains(text(),'CR _Digital Issue logged')][1]
    Click Element      ${sub-category-chase}
    Click Element    //option[contains(text(),'CR _Advise on screen readers')][1]
    Click Element      ${sub-category-chase}
    Click Element    //option[contains(text(),'CR_ Enquiry _General')][1]
    Click Element      ${sub-category-chase}
    Click Element    //option[contains(text(),'CR_Data Protection Issue')][1]



Populate Subcategory Trace isolation field on Case form

    #Click Drop Down By Name         Outcome
    Click Element      ${sub-category-Trace-isol}
    Click Element    //option[contains(text(),'TI_Enquiry_Isolation')][1]
    Click Element     ${sub-category-Trace-isol}
    Click Element    //option[contains(text(),'TI_Enquiry_Trace')][1]
    Click Element      ${sub-category-Trace-isol}
    Click Element    //option[contains(text(),'TI_Enquiry_Payment')][1]
    Click Element      ${sub-category-Trace-isol}
       Click Element    //option[contains(text(),'TI_ Enquiry_NHS Covid App')][1]
    Click Element     ${sub-category-Trace-isol}
    Click Element    //option[contains(text(),'TI_Enquiry_Covid Pass')][1]
    Click Element      ${sub-category-Trace-isol}
    Click Element    //option[contains(text(),'TI_Dispute_Contact')][1]
    Click Element      ${sub-category-Trace-isol}
    Click Element    //option[contains(text(),'TI_Dispute_Positive')][1]
    Click Element      ${sub-category-Trace-isol}
    Click Element    //option[contains(text(),'TI_Dispute_Negative')][1]
    Click Element      ${sub-category-Trace-isol}
    Click Element    //option[contains(text(),'TI_Dispute_Iso Period/Dates')][1]
    Click Element      ${sub-category-Trace-isol}
    Click Element    //option[contains(text(),'TI_Dispute_Had PPE')][1]
    Click Element      ${sub-category-Trace-isol}
    Click Element    //option[contains(text(),'TI_Dispute_Other')][1]
    Click Element      ${sub-category-Trace-isol}
    Click Element    //option[contains(text(),'TI_Data Protection Issue')][1]



Populate Subcategory International travel field on Case form

    #Click Drop Down By Name         Outcome
    Click Element     ${sub-category-intl-tvl}
    Click Element    //option[contains(text(),'IT_Enquiry_Isolation')][1]
    Click Element      ${sub-category-intl-tvl}
    Click Element    //option[contains(text(),'IT - Enquiry_Testing')][1]
    Click Element      ${sub-category-intl-tvl}
       Click Element    //option[contains(text(),'IT_ Enquiry_Travel')][1]
    Click Element     ${sub-category-intl-tvl}
    Click Element    //option[contains(text(),'IT_Enquiry_Covid Pass')][1]
    Click Element      ${sub-category-intl-tvl}
    Click Element    //option[contains(text(),'IT_Exempt request_for work')][1]
    Click Element      ${sub-category-intl-tvl}
    Click Element    //option[contains(text(),'IT_Exempt request_for health')][1]
    Click Element      ${sub-category-intl-tvl}
    Click Element    //option[contains(text(),'IT_Exempt request_for other')][1]
    Click Element      ${sub-category-intl-tvl}
    Click Element    //option[contains(text(),'IT_Private Provider_Test not arrived/late')][1]
    Click Element      ${sub-category-intl-tvl}
    Click Element    //option[contains(text(),'IT_Private Provider_Cannot contact')][1]
    Click Element      ${sub-category-intl-tvl}
    Click Element    //option[contains(text(),'IT_China_Arrivals Testing')][1]
    Click Element      ${sub-category-intl-tvl}
    Click Element    //option[contains(text(),'IT_Data Protection Issue')][1]



Populate Subcategory other field on Case form

    #Click Drop Down By Name         Outcome
    Click Element     ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Workplace_Safety Advice')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Workplace_Report Case')][1]
    Click Element     ${sub-category-other}
       Click Element    //option[contains(text(),'OT_Workplace_Testing')][1]
    Click Element     ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Debt_Recovery')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Safeguarding Concern')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_System Test Call')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Nuisance caller')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Call dropped')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Wrong number/Key Press')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Website issues')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Report a Scam')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Enquiry_Covid Pass')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Enquiry_Vaccines')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Enquiry_Strep A')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Other')][1]
    Click Element      ${sub-category-other}
    Click Element    //option[contains(text(),'OT_Data Protection Issue')][1]



Populate Outcome field on Case form

    #Click Drop Down By Name         Outcome
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'T1 Closed_referred to HCP')][1]
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'T1 Closed_test (re) booked')][1]
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'T1 Closed_info provided and referred to web')][1]
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'T1 Closed_referred to private provider')][1]
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'T1 Closed_referred to LA')][1]
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'T1 Closed_referred to HCP')][1]
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'T1 Closed_referred to RNIB')][1]
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'T1 Closed_result recorded')][1]
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'T1 Trfr_CMT')][1]
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'T1 Trfr_OLT (specialist)')][1]
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'Terminated Call')][1]
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'T1 Closed - Pharmacy code issued')][1]
    Click Element      ${outcome-tier1}
    Click Element    //option[contains(text(),'T1 Closed - Pharmacy code not issued')][1]

Populate Test type field on Case form

    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'PCR_Child')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'PCR_Adult')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'PCR_Private Provider')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'PCR_Priority AV')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'PCR_with alt instr')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'LFD_Private Provider')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'LFD_Home')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'LFD_Priority AV')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'LFD_with alt instr')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'Not applicable')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'PCR_Sample Project')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'LFD_Pharmacy Collect')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'Antibody Test')][1]

Populate Status field on Case form
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'New')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'Escalated')][1]
    Click Element      ${testtype-tier1}
    Click Element    //option[contains(text(),'Closed')][1]

Populate Assign Trace Case field on Case form
     Click Element      ${assigntrace-tier1}
    Click Element    //option[contains(text(),'Complaints Team - Test & Trace')][1]
    Click Element      ${assigntrace-tier1}
    Click Element    //option[contains(text(),'Inbound 119 Tier 2')][1]
    Click Element      ${assigntrace-tier1}
    Click Element    //option[contains(text(),'MP Trace Team')][1]
    Click Element      ${assigntrace-tier1}
    Click Element    //option[contains(text(),'UKHSA Expert 119 Team')][1]


Populate Caller Type field on Case form
     Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'Citizen_Person')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'Citizen_Person_< 18')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'Citizen_Person_Vulnerable >= 18')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'Be My Eyes')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'British Sign Language')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'Business Organisation')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'Healthcare_Org_Other')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'Healthcare _Org_Care Home')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'School_University')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'Local Authority')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'MP_Politician')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'Police')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'Journalist')][1]
    Click Element      ${callertype-tier1}
    Click Element    //option[contains(text(),'Prison')][1]




Populate Country field on Case form
     Click Element      ${Country-tier1}
    Click Element    //option[contains(text(),'England')][1]
    Click Element      ${Country-tier1}
    Click Element    //option[contains(text(),'Scotland')][1]
    Click Element      ${Country-tier1}
    Click Element    //option[contains(text(),'Wales')][1]
    Click Element      ${Country-tier1}
    Click Element    //option[contains(text(),'Northern Ireland')][1]
    Click Element      ${Country-tier1}
    Click Element    //option[contains(text(),'Non UK Resident')][1]
    Click Element      ${Country-tier1}
    Click Element    //option[contains(text(),'Unknown')][1]
Tier 1 Agent creates a case with Test record type
    [Documentation]  Pre-requiste - Agent must be on the Cases tab
    Sleep  2s
    Click Element                   ${new-case-btn}
    Click Element                   ${next-modal-btn}
    Click Drop Down By Name         Case Origin
    Select Drop down option         Online-Email
    Sleep   3s

    Click Element                   ${account-name-lookup}
    Click Element                   ${account-name-lookup-first-option}
    Sleep  3s
    Click Drop Down By Name         Case type
    Click Element                   //lightning-base-combobox-item[@data-value= 'Complaint']
    Click Save
    Wait Until Page Contains   was created  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   4s