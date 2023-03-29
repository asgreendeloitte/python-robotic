*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/EnvLoginsAndDHSetup.robot
Resource     ${EXECDIR}/Resources/DigitalHelper/Utilities/AddDates.robot
Resource     ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

# DigitalHelper Pages
Resource     ${EXECDIR}/Resources/DigitalHelper/Flows/GenerateDHForm.robot

# Agent pages
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/Queues.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/Teardown/FinishTest.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/QAdetails.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot
#Resource    ../../../../Resources/EnquiriesConsole/AgentLogins/comptest_AgentLogins.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${new}                      //a[@title='New']
${next-button}              //button[contains(text(), 'Next')]
${escalation-not-req}       //span[contains(text(),'Not Required')]
${escalation-req}           //span[contains(text(),'Required')]
${escalation-tog}           //span[@class="slds-checkbox_faux"]
${finish-btn}               //button[contains(text(),'Finish')]


*** Test Cases ***
Tier 1 - Case Fields & Values - Existing Fields - Trace
    [Tags]  TTCS20-5900  TTCS20-5899
    Login as Tier 1 Test & Trace Agent
    Sleep   2s
    Reset View (if applicable)
    Go To Home Tab
    Populate Whisper heard picklist from Home Page
    Populate Whisper accurate picklist from Home Page
    Populate Category picklist from Home Page
    Sleep  3s
    Click Element    ${next-button}
    Sleep  5s
    Populate Caller Type field on Case form
    Sleep  3s
    Populate Country field on Case form
    Sleep  3s
    Populate Outcome field on Case form
    Sleep  3s
    Populate Test type field on Case form
    Sleep  3s
    Populate Status field on Case form
    page should contain element  ${escalation-not-req}
    Click Element   ${escalation-tog}
    page should contain element  ${escalation-req}
    Sleep  5s
    Populate Assign Trace Case field on Case form
    Sleep  5s
    Input Text       //input[@placeholder='Search undefined...']      TEST
    Sleep  5s
    Click Element    (//li[@class='slds-listbox__item'])[1]

Tier 1 - Case Fields & Values - Subcategory Fields - Trace
    [Tags]  TTCS20-5892
    Login as Tier 1 Test & Trace Agent
    Sleep   2s
    Reset View (if applicable)
    Go To Home Tab
    Click Element    ${whisper-heard-dropdown}
    Click Element    (//option[@value= 'Yes'])[1]
     Click Element    ${whisper-accurate-dropdown}
    Click Element    (//option[@value= 'Yes'])[2]
    Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Elective_Care']
    Sleep  3s
    Click Element    ${next-button}
    Sleep  5s
    Populate Subcategory elective-care field on Case form
    Sleep  5s
    Click Element      ${sub-category-elective}
    Click Element    //option[contains(text(),'EC_Courier booked to collect')][1]
    Execute javascript   window.scrollTo(0,3000)
    SCROLL ELEMENT INTO VIEW    //*[@title='My Cases']
    Click Element     //button[contains(text(),'Previous')]
    Sleep  3s
     Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Anti_Viral']
    Sleep  3s
    Click Element    ${next-button}
    Sleep  5s
    Populate Subcategory anti-viral field on Case form
    Sleep  5s
    Click Element      ${sub-category-antivir}
    Click Element    //option[contains(text(),'AV_Courier booked to collect')][1]
    Click Element    //option[contains(text(),'AV_Courier booked to collect')][1]
    Sleep  5s
     Execute javascript   window.scrollTo(0,3500)
    SCROLL ELEMENT INTO VIEW    //*[@title='My Cases']
    Click Element     //button[contains(text(),'Previous')]
    Sleep  3s
     Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Book_Order_a_test']
    Sleep  3s
    Click Element    ${next-button}
    Sleep  5s
    Populate Subcategory book-ordertest field on Case form
    Sleep  5s
    Click Element      ${sub-category-bookorder}
    Click Element    //option[contains(text(),'BT_Book Test_date time_PCR_LTS')][1]
    Sleep  5s
     Execute javascript   window.scrollTo(0,3000)
    SCROLL ELEMENT INTO VIEW    //*[@title='My Cases']
    Click Element     //button[contains(text(),'Previous')]
    Sleep  3s
     Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Register_Test_Report_Result']
    Sleep  3s
    Click Element    ${next-button}
    Sleep  5s
    Populate Subcategory register test field on Case form
    Sleep  5s
    Click Element      ${sub-category-register}
    Click Element    //option[contains(text(),'RRT_Courier booked to collect')][1]
    Execute javascript   window.scrollTo(0,3000)
    SCROLL ELEMENT INTO VIEW    //*[@title='My Cases']
    Click Element     //button[contains(text(),'Previous')]
    Sleep  3s
     Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Chase_Results']
    Sleep  3s
    Click Element    ${next-button}
    Sleep  5s
    Populate Subcategory chase field on Case form
    Sleep  5s
    Click Element      ${sub-category-chase}
    Click Element    //option[contains(text(),'CR _Chase Result_Resend letter request')][1]
    Sleep  5s
    SCROLL ELEMENT INTO VIEW    //*[@title='My Cases']
    Click Element     //button[contains(text(),'Previous')]
    Sleep  3s
     Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Trace_Isolation']
    Sleep  3s
    Click Element    ${next-button}
    Sleep  5s
    Populate Subcategory Trace isolation field on Case form
    Click Element      ${sub-category-Trace-isol}
    Click Element    //option[contains(text(),'TI_Enquiry_Isolation')][1]
    Sleep  5s
    Execute javascript   window.scrollTo(0,3000)
    SCROLL ELEMENT INTO VIEW    //*[@title='My Cases']
    Click Element     //button[contains(text(),'Previous')]
    Sleep  3s
    Sleep  3s
     Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_International_Travel']
    Sleep  3s
    Click Element    ${next-button}
    Sleep  5s
    Populate Subcategory International travel field on Case form
    Sleep  5s
    Click Element     ${sub-category-intl-tvl}
    Click Element    //option[contains(text(),'IT_Enquiry_Isolation')][1]
    Execute javascript   window.scrollTo(0,3000)
    SCROLL ELEMENT INTO VIEW    //*[@title='My Cases']
    Click Element     //button[contains(text(),'Previous')]
    Sleep  3s
     Click Element    ${category-dropdown}
    Click Element    //option[@value= 'Category_Other']
    Sleep  3s
    Click Element    ${next-button}
    Sleep  5s
    Populate Subcategory other field on Case form