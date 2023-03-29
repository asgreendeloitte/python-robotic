*** Settings ***
Resource    ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

*** Variables ***
${error-heading}     Review the following errors
${error-text}        Please ensure all the details are filled out in Close Case Tab before closing the case.

${close-case-tab}     xpath://a[contains(text(),'Close Case')]
${details-tab}     xpath://li[@title='Details']

${edit-icon}       xpath:(//button[@title='Edit Status'])[2]
#${edit-icon}       (//button[@title='Edit Case type'])[2]


${edit-icon_c}       xpath://span[contains(text(),'Edit Status')]

${edit-icon_d}       xpath://span[contains(text(),'New')]


${ErrorMessagecapturedC}           xpath://span[@class='genericError uiOutputText']

${ErrorMessageNotifiedC}           Review the following errors


${Cancel}                       xpath://span[contains(text(),'Cancel')]

${Status}                       xpath://span[contains(text(),'Status')]

${Details-tab}                  xpath://a[contains(text(),'Details')]


*** Keywords ***
Click Close Case Tab
    Click Element At Coordinates   ${close-case-tab}   0   0

Click Details Tab
    Click Element At Coordinates   ${details-tab}     0   0

Click Edit Status Icon
    Set Focus To Element    ${edit-icon}
    Sleep  2s
    Press Keys  None  RETURN
    Sleep  3s
    Scroll Tab Into View By Name    Close Case

#    Execute Javascript  const element = await browser.$('${edit-icon}');
#    Execute Javascript  await browser.execute(el => el.dispatchEvent(new MouseEvent('mouseover', {'bubbles': true })), element);

#Check Error Message Content
 #   Page Should Contain        ${error-heading}
#    Page Should Contain        ${error-text}

Select Outcome (if applicable)
    [Documentation]  Outcome only needs to be selected if the case type is complaint
    ...              This Keyword only runs if the case type equals 'Complaint'
    ${case-type}    Set Variable    //span[contains(text(), 'Case type')]/../../div/div/div/div/a
    ${complaint-ind}=  Run Keyword And Return Status    Element Text Should Be    ${case-type}      Complaint
    Run Keyword If    ${complaint-ind}    Click Drop Down By Name     Outcome
    Run Keyword If    ${complaint-ind}    Select Dropdown Option      Upheld

Select Dropdown by Label And Data Value
    [Documentation]     This keyword is for objtype lightning-base-combobox only, please pass the data-value from the tag
    [Arguments]     ${lable}  ${data-value}
    set focus to element        xpath://label[contains(text(),'${lable}')]
    wait until element is visible      xpath://label[contains(text(),'${lable}')]         9s
    click element       xpath://label[contains(text(),'${lable}')]
    sleep       3s
    wait until element is visible     xpath://lightning-base-combobox-item[@data-value='${data-value}']       9s
    click element       xpath://lightning-base-combobox-item[@data-value='${data-value}']

Partially fill out Close Case Tab
    Sleep   2s
    Click Element   ${close-case-tab}
    Sleep  4s

    Click Edit Status Icon

    Click Drop Down By Name (bug fix)   Status
    Select Drop down option (bug fix)   Closed

    Sleep  2s

    Click Drop Down By Name (bug fix)     Category
    Select Dropdown Option (bug fix)      --None--    index=2
    Sleep  2s
    Click Save (bug fix)
    Check Error Message Content
    Sleep  2s
    Click Cancel (bug fix)
     Sleep  4s

Partial Fill out Close Case Tab for a Trace Subcategory left blank
    Sleep  2s
    Click Element   ${close-case-tab}
    Sleep  4s
    Click Edit Status Icon
   Click Drop Down By Name (bug fix)     Status
    Select Dropdown Option (bug fix)      Closed


    Click Drop Down By Name (bug fix)      Case type
   Select Dropdown Option (bug fix)      Feedback


    Sleep  2s
    Click Drop Down By Name (bug fix)      Category
     Select Dropdown Option (bug fix)      Contact Tracing

    Click Drop Down By Name (bug fix)     Subcategory
    Select Dropdown Option (bug fix)       --None--    index=4

    Sleep  2s
    Execute javascript  window.scrollTo(0,200)
    Click Save (bug fix)
    Check Error Message Content
    sleep   2s
     Click Cancel (bug fix)
    Sleep  4s

Partial Fill out Close Case Tab for a Trace Outcome field left blank
    Sleep  2s
   Click Element   ${close-case-tab}

    Click Edit Status Icon
     Click Drop Down By Name (bug fix)     Status
    Select Dropdown Option (bug fix)      Closed


    Click Drop Down By Name (bug fix)     Case type
     Select Dropdown Option (bug fix)       Complaint
    Sleep  2s
    Execute javascript  window.scrollTo(0,200)
     Click Save (bug fix)
    Check Error Message Content
     Click Cancel (bug fix)
    Sleep  4s


Fill out Close Case Tab for a Trace Case
    Sleep  3s
    Click Element   ${close-case-tab}
     Sleep  4s
     Click Edit Status Icon
    Click Drop Down By Name (bug fix)       Status
    Select Dropdown Option (bug fix)      Closed

    Click Drop Down By Name (bug fix)    Case type
    Select Dropdown Option (bug fix)     Feedback

    Click Drop Down By Name (bug fix)    Category
    Select Dropdown Option (bug fix)     Contact Tracing

   Click Drop Down By Name (bug fix)     Subcategory
   Select Dropdown Option (bug fix)      Contact Tracing - Other

    Sleep  2s
    Click Save (bug fix)
    Sleep  4s

    Page Should Contain  Closed

Partial fill out Close Case Tab for a Test Case- Subcategory left blank
   Sleep  3s
   Click Element   ${close-case-tab}
   Sleep  4s
    Click Edit Status Icon

    Click Drop Down By Name (bug fix)     Status
     Select Dropdown Option (bug fix)      Closed

    Click Drop Down By Name (bug fix)     Antigen/Antibody Test
    Select Dropdown Option (bug fix)      I took a blood test to see if I have had coronavirus before ('Antibody' Blood test)


   Click Drop Down By Name (bug fix)    Customer journey friction point
     Select Dropdown Option (bug fix)     Taking test
    Sleep  2s
    Click Drop Down By Name (bug fix)      Category
   Select Dropdown Option (bug fix)       Test - General

   Click Drop Down By Name (bug fix)     Subcategory
   Select Dropdown Option (bug fix)     --None--    index=5

    Click Drop Down By Name (bug fix)     Case type
    Select Dropdown Option (bug fix)       Enquiry

    Input Date Field By Name    Date of Test               20/04/2021
      Click Save (bug fix)
     Check Error Message Content
     sleep  2s
     Click Cancel (bug fix)
    Sleep  4s


Fill out Close Case Tab for a Test Case
     Sleep  3s
     Click Element   ${close-case-tab}
     Sleep  4s
    Click Edit Status Icon

    Click Drop Down By Name (bug fix)      Status
    Select Dropdown Option (bug fix)      Closed
     Execute javascript  window.scrollTo(0,200)
   Click Drop Down By Name (bug fix)     Antigen/Antibody Test
   Select Dropdown Option (bug fix)      I took a blood test to see if I have had coronavirus before ('Antibody' Blood test)

    Click Drop Down By Name (bug fix)      Customer journey friction point
    Select Dropdown Option (bug fix)     Taking test
     Execute javascript  window.scrollTo(0,400)
    Sleep  2s
    Click Drop Down By Name (bug fix)   Category
    Select Dropdown Option (bug fix)       Test - General

    Click Drop Down By Name (bug fix)    Subcategory
    Select Dropdown Option (bug fix)        Test - General - Other

    Click Drop Down By Name (bug fix)     Case type
    Select Dropdown Option (bug fix)        Enquiry
    Input Date Field By Name    Date of Test               20/04/2021
    Click Save (bug fix)
    Sleep  4s
    Page Should Contain  Closed

Partially fill out Close Case Tab -IA exemption Case-Outcome field empty
      Sleep  3s
      Click Element   ${close-case-tab}
      Sleep  4s
     Click Edit Status Icon

    Click Drop Down By Name (bug fix)     Status
    Select Dropdown Option (bug fix)     Closed

    Click Drop Down By Name (bug fix)   Case type
    Select Dropdown Option (bug fix)     International Arrival Exemption Request

    Click Drop Down By Name (bug fix)     Category
    Select Dropdown Option (bug fix)     International arrivals

    Click Drop Down By Name (bug fix)      Subcategory
    Select Dropdown Option (bug fix)       International Arrivals - Exemption - Job

    Sleep  2s
    Click Save (bug fix)
    Check Error Message Content
     Sleep  4s
     Click Cancel (bug fix)
     Sleep  4s


Fill out Close Case Tab -IA exemption Case
       Sleep  3s
       Click Element   ${close-case-tab}
       Sleep  4s
      Click Edit Status Icon

    Click Drop Down By Name (bug fix)      Status
    Select Dropdown Option (bug fix)        Closed

    Click Drop Down By Name (bug fix)     Case type
     Select Dropdown Option (bug fix)       International Arrival Exemption Request

    Click Drop Down By Name (bug fix)     Category
    Select Dropdown Option (bug fix)       International arrivals

    Click Drop Down By Name (bug fix)    Subcategory
    Select Dropdown Option (bug fix)        International Arrivals - Exemption - Job

     Click Drop Down By Name (bug fix)      Outcome
    Select Dropdown Option (bug fix)     No - other

    Sleep  2s
      Click Save (bug fix)
    Sleep  3s
    Page Should Contain  Closed

MP Trace Close Case - Not Genuine Case

       Sleep  4s
        Click Element   ${close-case-tab}
       Sleep  2s
        Click Edit Status Icon

      Click Drop Down By Name (bug fix)      Status
       Select Dropdown Option (bug fix)        Closed
      Click Save (bug fix)
      Sleep  3s
      Page Should Contain  Closed

Test Close if Test Taken is No-Mandatory fields
        Sleep  4s
        Click Element   ${close-case-tab}
        Sleep  3s
        Click Edit Status Icon
         Click Drop Down By Name (bug fix)      Status
         Select Dropdown Option (bug fix)        Closed
         Click Drop Down By Name (bug fix)      Test Taken?
         Select Dropdown Option (bug fix)          No
          Click Drop Down By Name (bug fix)      Case Origin
          Select Dropdown Option (bug fix)        Phone Enquiries
           Click Drop Down By Name (bug fix)      Case type
           Select Dropdown Option (bug fix)        Complaint
           Click Drop Down By Name (bug fix)      Category
            Select Dropdown Option (bug fix)       Test - General
            Sleep  2s
           Click Drop Down By Name (bug fix)      Subcategory
           Select Dropdown Option (bug fix)        Test - General - Other
            Click Drop Down By Name (bug fix)      Outcome
            Select Dropdown Option (bug fix)       Partially upheld

           Click Drop Down By Name (bug fix)      Customer journey friction point
          Select Dropdown Option (bug fix)       Test results
           Click Drop Down By Name (bug fix)      Third Party Contacting?
           Select Dropdown Option (bug fix)       No         index=2
          Click Save (bug fix)
          Sleep  3s
          Page Should Contain  Closed

Test Close if Test Taken is No-Mandatory fields missing
        Sleep  4s
                Click Element   ${close-case-tab}
                Sleep  2s
                Click Edit Status Icon
                 Click Drop Down By Name (bug fix)      Status
                 Select Dropdown Option (bug fix)        Closed
                  Click Drop Down By Name (bug fix)      Case Origin
                  Select Dropdown Option (bug fix)        Phone Enquiries
                   Click Drop Down By Name (bug fix)      Case type
                   Select Dropdown Option (bug fix)        Complaint
                   Click Drop Down By Name (bug fix)      Category
                    Select Dropdown Option (bug fix)       Test - General
                    Sleep  2s
                   Click Drop Down By Name (bug fix)      Subcategory
                   Select Dropdown Option (bug fix)        Test - General - Other
                    Click Drop Down By Name (bug fix)      Outcome
                    Select Dropdown Option (bug fix)       Partially upheld
                   Click Drop Down By Name (bug fix)      Third Party Contacting?
                   Select Dropdown Option (bug fix)       No
                   Click Drop Down By Name (bug fix)      Customer journey friction point
                  Select Dropdown Option (bug fix)       Test results
                  Click Save (bug fix)
                  Sleep  3s
                  Check Error Message Content
                   Sleep  4s
                   Click Cancel (bug fix)
                    Sleep  4s
Test Close if Test Taken is No-Mandatory fields - Details section
        Sleep  4s
        Click Element   ${close-case-tab}
        Sleep  2s
        Click Edit Status Icon
         Click Drop Down By Name (bug fix)      Status
         Select Dropdown Option (bug fix)        Closed
         Click Drop Down By Name (bug fix)      Test Taken?
         Select Dropdown Option (bug fix)          No
          Click Drop Down By Name (bug fix)      Case Origin
          Select Dropdown Option (bug fix)        Phone Enquiries
           Click Drop Down By Name (bug fix)      Case type
           Select Dropdown Option (bug fix)        Complaint
           Click Drop Down By Name (bug fix)      Category
            Select Dropdown Option (bug fix)       Test - General
            Sleep  2s
           Click Drop Down By Name (bug fix)      Subcategory
           Select Dropdown Option (bug fix)        Test - General - Other
            Click Drop Down By Name (bug fix)      Outcome
            Select Dropdown Option (bug fix)       Partially upheld
           Click Drop Down By Name (bug fix)      Third Party Contacting?
           Select Dropdown Option (bug fix)       No
           Click Drop Down By Name (bug fix)      Customer journey friction point
          Select Dropdown Option (bug fix)       Test results
          Click Save (bug fix)
          Check Error Message Content
            Sleep  4s
           Click Cancel (bug fix)
           Sleep  4s
Test Close if Test Taken is Yes-Mandatory fields

        Sleep  4s
        Click Element   ${close-case-tab}
        Sleep  2s
        Click Edit Status Icon
         Click Drop Down By Name (bug fix)      Status
         Select Dropdown Option (bug fix)        Closed
         Click Drop Down By Name (bug fix)      Test Taken?
         Select Dropdown Option (bug fix)          Yes
          Click Drop Down By Name (bug fix)      Case Origin
          Select Dropdown Option (bug fix)        Phone Enquiries
           Click Drop Down By Name (bug fix)      Case type
           Select Dropdown Option (bug fix)        Complaint
           Click Drop Down By Name (bug fix)      Category
            Select Dropdown Option (bug fix)       Test - General
            Sleep  2s
           Click Drop Down By Name (bug fix)      Subcategory
           Select Dropdown Option (bug fix)        Test - General - Other

           Click Drop Down By Name (bug fix)      Third Party Contacting?
           Select Dropdown Option (bug fix)       No     index=2
#              Click Drop Down By Name (bug fix)      Reason for feedback
#              Select Dropdown Option (bug fix)       Availability of testing
#              Click Drop Down By Name (bug fix)      Customer journey friction point
#              Select Dropdown Option (bug fix)       Returning test

#              Click Drop Down By Name (bug fix)      Outcome
#             Select Dropdown Option (bug fix)       Partially upheld

             Click Save (bug fix)
             Sleep  3s
          Page Should Contain  Closed
                    Sleep  4s
Test Close if Test Taken is Yes-Mandatory fields missing
        Sleep  4s
        Click Element   ${close-case-tab}
        Sleep  2s
        Click Edit Status Icon
         Click Drop Down By Name (bug fix)      Status
         Select Dropdown Option (bug fix)        Closed
          Click Drop Down By Name (bug fix)      Case Origin
          Select Dropdown Option (bug fix)        Phone Enquiries
           Click Drop Down By Name (bug fix)      Case type
           Select Dropdown Option (bug fix)        Complaint
           Click Drop Down By Name (bug fix)      Category
            Select Dropdown Option (bug fix)      Test - General
            Sleep  2s
           Click Drop Down By Name (bug fix)      Subcategory
           Select Dropdown Option (bug fix)        Test - General - Other
            Click Drop Down By Name (bug fix)      Outcome
            Select Dropdown Option (bug fix)       Partially upheld
           Click Drop Down By Name (bug fix)      Third Party Contacting?
           Select Dropdown Option (bug fix)       No
           Click Drop Down By Name (bug fix)      Customer journey friction point
          Select Dropdown Option (bug fix)       Test results
          Click Save (bug fix)
          Check Error Message Content
           Sleep  4s
         Click Cancel (bug fix)
          Sleep  4s

Test Close if Test Taken is Yes-Mandatory fields in details section
        Sleep  4s
        Click Element   ${close-case-tab}
        Sleep  2s
        Click Edit Status Icon
         Click Drop Down By Name (bug fix)      Status
         Select Dropdown Option (bug fix)        Closed
         Click Drop Down By Name (bug fix)      Test Taken?
         Select Dropdown Option (bug fix)          Yes
          Click Drop Down By Name (bug fix)      Case Origin
          Select Dropdown Option (bug fix)        Phone Enquiries
           Click Drop Down By Name (bug fix)      Case type
           Select Dropdown Option (bug fix)        Complaint
           Click Drop Down By Name (bug fix)      Category
            Select Dropdown Option (bug fix)       Test - General
            Sleep  2s
           Click Drop Down By Name (bug fix)      Subcategory
           Select Dropdown Option (bug fix)        Test - General - Other
            Click Drop Down By Name (bug fix)      Outcome
            Select Dropdown Option (bug fix)       Partially upheld
           Click Drop Down By Name (bug fix)      Third Party Contacting?
           Select Dropdown Option (bug fix)       No
#           Click Drop Down By Name (bug fix)      Customer journey friction point
#          Select Dropdown Option (bug fix)       Test results
          Click Save (bug fix)
         Check Error Message Content
           Sleep  4s
            Click Cancel (bug fix)
             Sleep  4s

Test Close if Test Taken is Yes-Mandatory fields missing outcome and Friction

        Sleep  4s
        Click Element   ${close-case-tab}
        Sleep  2s
        Click Edit Status Icon
         Click Drop Down By Name (bug fix)      Status
         Select Dropdown Option (bug fix)        Closed
         Click Drop Down By Name (bug fix)      Test Taken?
         Select Dropdown Option (bug fix)          Yes
          Click Drop Down By Name (bug fix)      Case Origin
          Select Dropdown Option (bug fix)        Phone Enquiries
           Click Drop Down By Name (bug fix)      Case type
           Select Dropdown Option (bug fix)        Complaint
           Click Drop Down By Name (bug fix)      Category
            Select Dropdown Option (bug fix)       Test - General
            Sleep  2s
           Click Drop Down By Name (bug fix)      Subcategory
           Select Dropdown Option (bug fix)        Test - General - Other
#            Click Drop Down By Name (bug fix)      Outcome
#            Select Dropdown Option (bug fix)       Partially upheld

#             Click Drop Down By Name (bug fix)      Customer journey friction point
#             Select Dropdown Option (bug fix)       Test results
           Click Drop Down By Name (bug fix)      Third Party Contacting?
           Select Dropdown Option (bug fix)       No     index=2

          Click Save (bug fix)
          Check Error Message Content
           Sleep  4s
           Click Cancel (bug fix)
            Sleep  4s

Trace Close- without mandatory fields
        Sleep  4s
        Click Element   ${close-case-tab}
        Sleep  3s
        Click Edit Status Icon
         Click Drop Down By Name (bug fix)      Status
         Select Dropdown Option (bug fix)        Closed
         Click Save (bug fix)
          Check Error Message Content
          Sleep  4s
          Click Cancel (bug fix)
          Sleep  4s
Trace Close- with mandatory fields
        Sleep  4s
        Click Element   ${close-case-tab}
        Sleep  3s
        Click Edit Status Icon
         Click Drop Down By Name (bug fix)      Status
         Select Dropdown Option (bug fix)        Closed
         Click Save (bug fix)
          Check Error Message Content
          Sleep  4s
          Click Cancel (bug fix)
          Sleep  4s