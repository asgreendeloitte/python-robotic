*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library    DateTime

*** Keywords ***
Click Views Dropdown
    ${views-dropdown}=     Set Variable      //button[@title='Show Navigation Menu']
    Click Element       ${views-dropdown}

Click Save
    ${save-btn}=     Set Variable   //button[@name='SaveEdit']
    Click Element At Coordinates   ${save-btn}     0   0

Click Save (bug fix)
    ${save-btn}=     Set Variable   //button[@title='Save']
#    Click Element At Coordinates   ${save-btn}     0   0
    sleep   1s
    Set Focus To Element    ${save-btn}
    Sleep  1s
    Press Keys  None  RETURN
    sleep   1s

Click Edit (bug fix)
    ${edit-btn}=     Set Variable   (//button[@name='Edit'])[2]
     sleep   1s
    Set Focus To Element    ${edit-btn}
    Click Element       ${edit-btn}
    sleep   1s
    Press Keys  None  RETURN
    sleep   1s
Click Cancel
    ${cancel-btn}=     Set Variable   //button[@name='CancelEdit']
    #//button[@title='Cancel']
    Click Element At Coordinates   ${cancel-btn}     0   0
    sleep   1s
Click Cancel (bug fix)
    ${cancel-btn}=     Set Variable   //button[@title='Cancel']
#    Click Element At Coordinates   ${cancel-btn}     0   0
    sleep   1s
    Set Focus To Element    ${cancel-btn}
    Sleep  1s
    Press Keys  None  RETURN
    sleep   1s


Click Edit
    [Arguments]        ${index}=1
    ${edit-btn}=     Set Variable   (//button[@name='Edit'])[${index}]
    Click Element       ${edit-btn}
    sleep   1s

Click Help
    ${Help-btn}=     Set Variable   //li[contains(@title,'Help')]
    Click Element         ${Help-btn}
    sleep   1s


Click View Case Hierarchy
    ${case-hierarchy-btn}=     Set Variable   //button[@name='CaseHierarchy']
    Click Element       ${case-hierarchy-btn}
    sleep   1s

Click Compose Letter
    ${compose-letter-btn}=     Set Variable   //a[@name='Conga_Composer_Compose_Letter_Test']
    Click Element       ${compose-letter-btn}
    sleep   1s
Click QA
    ${QA-btn}=     Set Variable   //li[@title='QA']
    Click Element       ${QA-btn}
    sleep   1s

Click Mailing Address
     ${Mailing address-btn}=     Set Variable   //span[contains(text(),'Search Address']
      Click Element       ${Mailing address-btn}
      sleep   1s

Click Comment Box

      sleep   2s
     ${Comment-btn}=     Set Variable   //textarea[contains(@class,'textarea')]
     Set Focus To Element     ${Comment-btn}
       Sleep  1s
         Press Keys  None  RETURN

        Input Text    ${Comment-btn}      Area
         sleep   1s
#     Click Element      ${Comment-btn}
      sleep   1s


Click Drop Down By Name
    [Arguments]     ${name}
    sleep   2s
    Scroll Element Into View    //label[text()='${name}']/following::records-record-layout-item[2]
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    # //span[contains(text(), '${name}')]/../../../div/div/div/div/div/a
    Click Element At Coordinates       ${dropdown-box}    0   0

Populate Fields From Assign Trace Case Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element       //lightning-base-combobox-item//span[contains(text(),'IA Exemptions Team')]
    #(//a[@title="IA Exemptions Team"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable       UKHSA Expert 119 Team     UKHSA MQS Inbound     IA Exemptions Team     IA Data Deletion Team     MP Trace Team     Complaints Team - Test & Trace    Elective Care Team   Inbound 119 Tier 2
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END

Populate Fields From Assign Test Case Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element       //lightning-base-combobox-item//span[contains(text(),'UKHSA MQS Inbound')]
    sleep   2s
    @{ITEMS}=     Set Variable         UKHSA Expert 119 Team   UKHSA Results Investigation Team   UKHSA MQS Inbound    Complaints Team - Test & Trace    Elective Care Team    Inbound 119 Tier 2
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END

Populate Fields From Call reason Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //span[contains(text(), '${name}')]/../../../div/div/div/div/div/a
    Click Element        (//a[@title="No email address provided"])[${index}]
        sleep   2s
    @{ITEMS}=     Set Variable         Further information required (from Citizen)   No email address provided   Follow-up call    Inbound call dropped
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View     (//a[@title="${item}"])[${index}]
        sleep   2s
        Click Element        (//a[@title="${item}"])[${index}]
    END

Populate Fields From Call Outcome Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //span[contains(text(), '${name}')]/../../../div/div/div/div/div/a
    Click Element      (//a[@title="Contact Made - No Escalation Required"])[${index}]

    sleep   2s
    @{ITEMS}=     Set Variable         No Contact Made - No Escalation Required    Contact Made - No Escalation Required    Contact Made - Escalation Required    Information gathered (for further investigation)    Citizen referred externally    Guidance provided    Test (re)booked     Call terminated
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//a[@title="${item}"])[${index}]
        sleep   2s
        Click Element       (//a[@title="${item}"])[${index}]
    END


Populate Fields From Case Topic Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element       //lightning-base-combobox-item//span[contains(text(),'I want to know how to use the app')]
    sleep   2s
    @{ITEMS}=     Set Variable         I want to know what the app does   I want to know how to use the app    I want to know how the app works    I want to know who can use the app     I have a question about troubleshooting or technical information about the app    I want to download and set up the app    I want to know about data and privacy   My enquiry is not listed here
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END


Populate Fields From subcategory Picklist in IANTO
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element      //lightning-base-combobox-item//span[contains(text(),'Refund process failed - eligible')]
    #(//a[@title="Refund process failed - eligible"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        Refund process failed - eligible    Refund request denied   Refund Successful - Worldpay     Refund Successful - other      Refund Successful - cancel order     Refund Successful - ordered wrong test package      Refund Successful - amend order details      Refund Successful - after travel
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END

Populate Fields From subcategory Picklist in Vaccination
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element      //lightning-base-combobox-item//span[contains(text(),'IT/System Issue')]
    #(//a[@title="Refund process failed - eligible"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        Appointment Booking    Clinical Advice   Communications  Delays  IT/System Issue  Information Governance  Call Agent Attitude   Site Experience
          FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END


Populate Fields From subcategory Picklist in Other
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element      //lightning-base-combobox-item//span[contains(text(),'Legal')]
    #(//a[@title="Refund process failed - eligible"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        Data and Information    Legal   Other - Other  Policy  Public Health  Scam calls/messages  T&T providers
          FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END



Populate Fields From category Picklist in MPCase
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable     //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    #//span[contains(text(), '${name}')]/../../../div/div/div/div/div/a
    Click Element       //lightning-base-combobox-item//span[contains(text(),'Test - General')]
    #(//a[@title="Test - General"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        Test - General   Book/order a test  Test/Kit Equipment    Register a test    Elective Care    Test results    Contact Tracing    Business, organisation, or workplace   International arrivals   International arrivals - Exemption  International Arrivals - MQS   Self-Isolation Dispute   Self-Isolation Dispute    App    Other
      FOR    ${item}   IN   @{ITEMS}

        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element   (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
            #(//a[@title=${item}])[${index}]
    END

Populate Fields From Outcome Picklist in Trace Case
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element       //lightning-base-combobox-item//span[contains(text(),'Isolation rescinded')]
    #(//a[@title="Isolation rescinded"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        Isolation rescinded    Isolation amended   Isolation dispute not upheld
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END


Populate Fields From RIT Resend Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element       //lightning-base-combobox-item//span[contains(text(),'Letter')]
    #(//a[@title="Letter"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        Letter   SMS
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END

Populate Fields From Priority Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element       //lightning-base-combobox-item//span[contains(text(),'Medium')]
    #(//a[@title="Medium"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        Medium   High
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END

Populate Fields From PQ or OPB Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element       //lightning-base-combobox-item//span[contains(text(),'PQ')]
    #(//a[@title="PQ"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        PQ   OPB
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END
Populate Fields From Case Origin Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element       //lightning-base-combobox-item//span[contains(text(),'COVID-19 Helpline Mailbox')]
    #(//a[@title="COVID-19 Helpline Mailbox"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        COVID-19 Helpline Mailbox   Parliamentary Mailbox  Consultations Mailbox
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END

Populate Fields From IR origin demographic Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element       //lightning-base-combobox-item//span[contains(text(),'NHS')]
    #(//a[@title="COVID-19 Helpline Mailbox"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        Public   Legal  Commercial   Internal  Media  NHS  Pressure Groups  Govt department   Academic  Local Authority  Police
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END
Populate Fields From Case Status Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element       //lightning-base-combobox-item//span[contains(text(),'Awaiting Information (Internal)')]
    #(//a[@title="Awaiting Information (Internal)"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable         Awaiting Information (Internal)   Awaiting Information (External)   Draft   Clearance   On Hold   Review   Closed
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element      (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END
Populate Fields From Case Type Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element      //lightning-base-combobox-item//span[contains(text(),'PQ Lead')]
     #(//a[@title="PQ Lead"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        PQ Lead   PQ Contribution   Redraft   Multiple redrafts    Comments   Committee   Consultation   Data Request   Debate / Speech   Event / Meeting   Letter (MP)   Letter (Non-MP)   Ministerial Briefing   Minute   Other Briefing   Other / Ad hoc   Query   Reporting   Request for Lines  MP / Peer Letter: Helplines   MP / Peer Letter: via CEX   MP / Peer Letter: via Enq   MP / Peer Letter: via Official   Redirected PO   PO Contri   TO Contri    Citizen enquiry: via CEX   PMQ   HoC OPQ   HoL OPQ  UQ (HoC)   PNQ (HoL)
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END

Populate Fields From Reason for late return Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element      //lightning-base-combobox-item//span[contains(text(),'Info not available')]
    #(//a[@title="Info not available"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        Info not available    Internal deadline not met    Late allocation   Late transfer   Ownership not clear   Parly influx   PPAT lack of resource   SCS availability  SHERs lack of resource
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END

Populate Fields From compliant-noncompliant Picklist
    [Arguments]     ${name}   ${index}=1
    sleep   2s
    ${dropdown-box}=     Set Variable       //label[text()='${name}']/ancestor::lightning-combobox//lightning-base-combobox//button/span
    Click Element       //lightning-base-combobox-item//span[contains(text(),'Compliant')]
    #(//a[@title="Compliant"])[${index}]
    sleep   2s
    @{ITEMS}=     Set Variable        Compliant   Non-Compliant
      FOR    ${item}   IN   @{ITEMS}
        Click Element At Coordinates       ${dropdown-box}    0   0
        Scroll Element Into View    (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
        sleep   2s
        Click Element       (//lightning-base-combobox-item//span[contains(text(),'${item}')])[${index}]
    END

Click Drop Down By Name1
    [Arguments]     ${name}
    sleep   2s
    ${dropdown-box}=     Set Variable       //span[contains(text(), '${name}')]/../../../div/div/div/div/div/a
    Click Element At Coordinates       ${dropdown-box}    0   0

Click Drop Down By Name2
    [Arguments]     ${name}
    sleep   2s
    ${dropdown-box}=     Set Variable       (//span[contains(text(), '${name}')]/../../../div/div/div/div/div/a)[1]
    Click Element At Coordinates       ${dropdown-box}    0   0

Click Drop Down By Name (bug fix)
    [Arguments]     ${name}
    sleep   2s
    ${dropdown-box}=     Set Variable       //span[contains(text(), '${name}')]/../../../div/div/div/div/div/a
#    Click Element At Coordinates       ${dropdown-box}    0   0
    Set Focus To Element    ${dropdown-box}
    Sleep  1s
    Press Keys  None  RETURN
    sleep   1s

Select Test Provider Drop down option
    [Arguments]     ${option}
    sleep   2s
    Click Element       //a[@title="${option}"]

Select Drop down option
    [Arguments]     ${option}   ${index}=1
    sleep   2s
    Scroll Element Into View    //lightning-base-combobox-item//span[contains(text(),'${option}')]/ancestor::span[1]
    #Click Element    (//lightning-base-combobox-item[@data-value="${option}"])[${index}]
    Click Element       //lightning-base-combobox-item//span[contains(text(),'${option}')]/ancestor::span[1]
    #//lightning-base-combobox-item//span[contains(text(),'${option}')]
    #(//a[@title="${option}"])[${index}]




Select Drop down option1
    [Arguments]     ${option}   ${index}=1
    sleep   2s
    Scroll Element Into View    (//a[@title="${option}"])[${index}]
    Click Element       (//a[@title="${option}"])[${index}]
    #//lightning-base-combobox-item//span[contains(text(),'${option}')]
    #(//a[@title="${option}"])[${index}]



#//label[text()='Origin Demographics']/ancestor::lightning-combobox//div[@class="slds-listbox slds-listbox_vertical slds-dropdown slds-dropdown_fluid slds-dropdown_left"]//lightning-base-combobox-item[@data-value="MP"]
Select Drop down option MP
   # [Arguments]     ${option}   ${index}=1
    sleep   2s

   Click Element   //lightning-base-combobox-item[@data-value='MP']
    #//lightning-base-combobox-item//span[contains(text(),'${option}')]
    #(//a[@title="${option}"])[${index}]


Select Drop down option salutation
   # [Arguments]     ${option}   ${index}=1
    sleep   2s

   Click Element   (//a[@title="Mr."])
   #//lightning-base-combobox-item[@data-value='Mr.']


Select Drop down option complaints
   # [Arguments]     ${option}   ${index}=1
    sleep   2s

   Click Element   (//lightning-base-combobox-item[@data-value='Complaint'])

Select Drop down option Vaccinations
   # [Arguments]     ${option}   ${index}=1
    sleep   2s

   Click Element   (//lightning-base-combobox-item[@data-value='Vaccinations'])[2]
    #//lightning-base-combobox-item//span[contains(text(),'${option}')]
    #(//a[@title="${option}"])[${index}]


Select Drop down option Vaccinations data
   # [Arguments]     ${option}   ${index}=1
    sleep   2s

   Click Element   (//lightning-base-combobox-item[@data-value='Vaccine data incorrect'])[1]
    #//lightning-base-combobox-item//span[contains(text(),'${option}')]
    #(//a[@title="${option}"])[${index}]


Select Drop down option Other
   # [Arguments]     ${option}   ${index}=1
    sleep   2s

   Click Element   (//lightning-base-combobox-item[@data-value='Other'])[2]
    #//lightning-base-combobox-item//span[contains(text(),'${option}')]
    #(//a[@title="${option}"])[${index}]
Select Drop down option - UK
#    [Arguments]     ${index}=1
    sleep  3s
    Click Element   (//*[@data-value='United Kingdom'])[2]
    #(//a[@title="United Kingdom"])[1]



Select Drop down option (bug fix)
    [Arguments]     ${option}   ${index}=1
    sleep   2s
#    Click Element       (//a[@title="${option}"])[${index}]

    Set Focus To Element    (//a[@title="${option}"])[${index}]
    Sleep  1s
    Press Keys  None  RETURN
    Sleep  1s



Select Checkbox By Name
    [Arguments]     ${name}
    Scroll Element Into View        (//span[contains(text(), '${name}')]/ancestor::lightning-input//input)[2]
    ${checkbox}=     Set Variable       (//span[contains(text(), '${name}')]/ancestor::lightning-input//input)[2]
    #//span[contains(text(), '${name}')]/../../../div/input
    Select Checkbox     ${checkbox}

Select Checkbox By Name1
    [Arguments]     ${name}
    Scroll Element Into View        (//span[text()='${name}']/following::records-record-layout-item[2])[2]
    ${checkbox}=     Set Variable       //span[contains(text(), '${name}')]/ancestor::lightning-input[@variant="label-stacked"]//input
    Select Checkbox     ${checkbox}


Scroll Drop Down Into View
    [Documentation]  Pass in the name of the Drop down to scroll into view and optionally the amount of extra pixel to scroll down (default is 300px)
    [Arguments]     ${name}     ${y-axis-offset}=300
    Scroll Element Into View       //label[text()='${name}']/following::records-record-layout-item[2]
    Execute javascript  window.scrollTo(0,${y-axis-offset})
    sleep   2s

Input Date Field By Name
    [Arguments]     ${name}     ${text}=01/01/2021
    ${date-field}=      Set Variable   //label[contains(text(), '${name}')]/../../div//input
    #//span[contains(text(), '${name}')]/../../div/input
    #(//input[@name='ECDTravel_Date_to_UK__c'])
    #
    Input Text       ${date-field}      ${text}


Input Text for Test Barcode/Antibody ID
     [Arguments]     ${BarcodeValue}   ${index}=7
     ${Barcode}=        Set Variable    (//input[@class='slds-input'])[${index}]
     #(//input[@class=' input'])[${index}]
     Input Text    ${Barcode}        ${BarcodeValue}

Input Text for Antibody ID
    [Arguments]     ${AntibodyValue}   ${index}=8
     ${AntibodySpecimenID}=        Set Variable    (//input[@class='slds-input'])[${index}]
     #(//input[@class=' input'])[${index}]
     Input Text    ${AntibodySpecimenID}        ${AntibodyValue}

Input Text Field By Label Name
    [Arguments]     ${name}     ${text}=placeholder-string
    ${inputfield}=      Set Variable    (//span[contains(text(),'${name}')])[3]
    Input Text       ${inputfield}      ${text}


Input Text Field By Name
    [Arguments]     ${name}     ${text}=placeholder-string
    ${input-field}=      Set Variable    //label[contains(text(), '${name}')]/../div/input
    #//span[contains(text(), '${name}')]/../../../div/input
    Input Text       ${input-field}      ${text}

Input Text Field PTM
    [Arguments]     ${name}     ${text}=placeholder-string
   ${input-field}=   Set Variable   //*[contains(text(), '${name}')]/../div/input
   Input Text   ${input-field}      ${text}

Input Date Field By Name in PTM
    [Arguments]     ${name}     ${text}=01/01/2021
    ${date-field}=      Set Variable    //*[contains(text(), '${name}')]/../div/input
    Input Text       ${date-field}      ${text}

Input Text Field By PersonAccountName
    [Arguments]     ${name}     ${text}=placeholder-string
    ${input-field}=      Set Variable    //span[contains(text(), '${name}')]/../../input
    Input Text       ${input-field}      ${text}

Input Text for Date of Test
     [Arguments]     ${DatePickerValue}   ${index}=6
     ${DatePicker}=        Set Variable     (//input[@name="ECDIncidentDate__c"])[1]
     #(//input[@class=' input'])[${index}]
     Input Text   ${DatePicker}       ${DatePickerValue}

Input Text for Start Date of Test liveissue
     [Arguments]     ${DatePickerValue}   ${index}=3
     ${DatePicker}=        Set Variable     (//input[contains(@class,'slds-input')])[${index}]
     Input Text   ${DatePicker}       ${DatePickerValue}

Input Text for End Date of Test liveissue
     [Arguments]     ${DatePickerValue}   ${index}=5
     ${DatePicker}=        Set Variable     (//input[contains(@class,'slds-input')])[${index}]
     Input Text   ${DatePicker}       ${DatePickerValue}

Input Text for RIT Investigation Date
     [Arguments]     ${DatePickerValue}   ${index}=6
     ${DatePicker}=        Set Variable     (//input[@class=' input'])[${index}]
     Input Text   ${DatePicker}       ${DatePickerValue}

Input Text for RIT Date Returned
     [Arguments]     ${DatePickerValue}   ${index}=7
     ${DatePicker}=        Set Variable     (//input[@class=' input'])[${index}]
     Input Text   ${DatePicker}       ${DatePickerValue}



Input Text Area By Name
    [Arguments]     ${name}     ${text}=placeholder-string
    ${input-field}=      Set Variable    //span[contains(text(), '${name}')]/../../textarea
    Input Text       ${input-field}      ${text}

Input Text Area for CommentBox
    [Arguments]     ${name}     ${text}=value
    ${input-field}=      Set Variable    //textarea[@class='textarea']
    Set Focus To Element     ${input-field}
     Sleep  1s
     Press Keys  None  RETURN
     sleep   1s

    Input Text       ${input-field}      ${text}

Case Owner Text Should Be
    [Arguments]     ${text}
    #${case-owner}=   Set Variable    (//*[@class='slds-form-element__control'])[1]
    #${case-owner}=   Set Variable    (//span[contains(text(), 'Case Owner')]/../../div/span/slot/slot/force-owner-lookup/div/span/force-lookup/div/span/slot)
    ${case-owner}=   Set Variable     (//span[contains(text(), 'Case Owner')]/../../div/span/slot/force-owner-lookup/div/span/force-lookup/div/span/slot)
    Element Text Should Be      ${case-owner}    ${text}

Not A Genuine Case Text Should Be
    [Arguments]     ${text}
    ${Genuine-Case}=   Set Variable    //span[contains(text(), 'Not A Genuine Case')]
     Element Text Should Be       ${Genuine-Case}   ${text}

# This can be made genric
Case Status Text Should Be
    [Arguments]     ${text}
    #${status}=   Set Variable    //span[contains(text(), 'Status')]/../../span/slot/slot/lightning-formatted-text
    ${status}=   Set Variable    //span[contains(text(), 'Status')]/../../span/slot/lightning-formatted-text
    Element Text Should Be      ${status}    ${text}

MP Case Status Text Should Be
    [Arguments]     ${text}
    #${status}=   Set Variable    //span[contains(text(), 'Status')]/../../span/slot/slot/lightning-formatted-text
    ${status}=   Set Variable    (//span[contains(text(), 'Status')]/../../span/slot/lightning-formatted-text)[3]
    Element Text Should Be      ${status}    ${text}


Third Party Contact Text Should Be
    [Arguments]     ${text}
    #${status}=   Set Variable    //span[contains(text(), 'Status')]/../../span/slot/slot/lightning-formatted-text
    ${status}=   Set Variable    (//span[contains(text(), 'Third Party Contacting?')]/../../span/slot/lightning-formatted-text)
    Element Text Should Be      ${status}    ${text}

Affected Person Contact name Text Should Be
    [Arguments]     ${text}
    #${status}=   Set Variable    //span[contains(text(), 'Web Name of affected person')]/../../span/slot/lightning-formatted-text
    ${status}=   Set Variable    //span[contains(text(), 'Web Name of affected person')]/ancestor::div[2]/div[2]/span/slot/lightning-formatted-text
    Element Text Should Be      ${status}    ${text}

Reassign to Test / Trace Text Should Be
     [Arguments]     ${text}
    ${status}=   Set Variable    //span[contains(text(), 'Reassign to Test / Trace')]
    Element Text Should Be      ${status}    ${text}


Priority Reason Text Should Be
       [Arguments]     ${text}
    ${status}=   Set Variable    //span[contains(text(), 'Priority Reasons')]
    Element Text Should Be      ${status}    ${text}

Case Record Type Text Should Be
    [Arguments]  ${text}
    ${record-type}=     Set Variable    //p[@title='Case Record Type']/../p/slot/records-record-type/div/div/span
    Element Text Should Be      ${record-type}    ${text}

Display Field text Should Be
    [Arguments]     ${name}     ${text}
    ${display-field}=   Set Variable    //span[contains(text(), '${name}')]/../../span/slot/lightning-formatted-text
    Element Text Should Be      ${display-field}    ${text}

Display Field text Should be1
    [Arguments]     ${name}     ${text}
    ${display-field}=   Set Variable    (//span[contains(text(), '${name}')]/../../span/slot/lightning-formatted-text)[2]
    Element Text Should Be      ${display-field}    ${text}

Navigate to Tab By Name
    [Arguments]  ${tab-name}
    ${tab}=     Set Variable        //li[@title='${tab-name}']
    Click Element At Coordinates   ${tab}     0   0

Scroll Tab Into View By Name
    [Documentation]  Pass in the name of the tab to scroll into view and optionally the amount of extra pixel to scroll down (default is 0px)
    [Arguments]     ${tab-name}     ${y-axis-offset}=0
    Scroll Element Into View            //li[@title='${tab-name}']
    Execute javascript  window.scrollTo(0,${y-axis-offset})
    sleep   2s

Wait Until Page Has Saved
    Wait Until Page Contains   was saved.  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   10s

Wait Until Case Owner Has Saved
    Wait Until Page Contains   owns the record  # try and get the html, it disappears so quickly i cant get the element yet
    sleep   10s

Change Owner To
    [Arguments]  ${queue-name}
    ${change-owner}=     Set Variable      //button[@title='Change Owner']
    ${people-icon}=     Set Variable      //img[@title='Users']
    ${queue-field}=     Set Variable      //input[@title='Search Queues']
    ${queue-option}=     Set Variable      //ul/li/a[@title="Queues"]
    ${result-option}=     Set Variable    //div[@title='${queue-name}']
#    ${change-owner-btn}=     Set Variable   //button[@name='change owner']

    Click Element       ${change-owner}
    Sleep  2s
    Click Element       ${people-icon}
    Sleep  2s
    #Select Drop down option     Queues
    Click Element    ${queue-option}
    Sleep  2s
    Input Text       ${queue-field}  ${queue-name}
    Click Element   ${result-option}
    Sleep  2s
    Click Change Owner (bug fix)
    sleep   4s
    ${success-message}=     Set Variable      //span[@class='toastMessage slds-text-heading--small forceActionsText']
    Wait Until Page Contains Element    ${success-message}
    sleep   4s

Change Owner To multiple cases
    [Arguments]  ${queue-name}
    ${change-owner}=     Set Variable      //div[@title='Change Owner']
    ${people-icon}=     Set Variable      //img[@title='Users']
    ${queue-field}=     Set Variable      //input[@title='Search Queues']
    ${result-option}=     Set Variable    //div[@title='${queue-name}']
#    ${change-owner-btn}=     Set Variable   //button[@name='change owner']
    ${change-owner-btn}=     Set Variable   //span[contains(text(),'Submit')]

    Click Element       ${change-owner}
    Sleep  2s
    Click Element       ${people-icon}
    Sleep  2s
    Click Element        //ul/li/a[@title='Queues']
    Sleep  2s
    Input Text       ${queue-field}  ${queue-name}
    Click Element   ${result-option}
    Sleep  4s
    #Click Change Owner (bug fix)
    sleep   4s
    Click Element   ${change-owner-btn}
    sleep  3s
    #${success-message}=     Set Variable      //span[@class='toastMessage slds-text-heading--small forceActionsText']
    #Wait Until Page Contains Element    ${success-message}
    Wait Until Page Contains   owners have been changed

    sleep   4s

Click Change Owner (bug fix)
     #${change-owner-btn}=     Set Variable   //span[contains(text(),'Submit')]
    ${change-owner-btn}=     Set Variable   //button[@name='change owner']
    sleep   1s
    Set Focus To Element     ${change-owner-btn}
    Sleep  5s
    Press Keys  None  RETURN
    sleep   1s

Change Owner To User
    [Arguments]  ${queue-name}
    ${change-owner}=     Set Variable      //button[@title='Change Owner']
    ${people-icon}=     Set Variable      //img[@title='Users']
    ${User-field}=     Set Variable      //input[@title='Search Users']
    ${result-option}=     Set Variable    //div[@title='${queue-name}']
    ${change-owner-btn}=     Set Variable   //button[@name='change owner']

   # Click Element       ${change-owner}
    Sleep  2s
    Click Element       ${people-icon}
    Sleep  2s
    Select Drop down option     Users
    Sleep  2s
    Input Text       ${User-field}  George Central Team
    Click Element   ${result-option}
    Sleep  2s
    Click Element At Coordinates   ${change-owner-btn}     0   0
    sleep   4s
    ${success-message}=     Set Variable      //span[@class='toastMessage slds-text-heading--small forceActionsText']
    Wait Until Page Contains Element    ${success-message}
    sleep   4s

Date of Arrival Checkbox tick

    ${DateArrival}=     Set Variable   (//input[contains(@type,'checkbox')])[6]
    Click Element       ${DateArrival}
    sleep   1s

First Record Checkbox validation
    Sleep  2s
    ${FirstRescordCheckbox}=     Set Variable   (//*[@class='slds-grid slds-grid--align-spread slds-align_absolute-center checkbox-container slds-checkbox uiInput forceVirtualCheckbox uiInput--default'])[1]
    #(//span[contains(@class,'slds-checkbox--faux')])[2]
#    Set Focus to Element    ${FirstRescordCheckbox}
    Click Element       ${FirstRescordCheckbox}
    sleep   1s

Accept the Case in Case list view
     Sleep  3s
     ${AcceptCaseCheckbox}=     Set Variable   (//div[contains(@title,'Accept')])[1]
    Click Element        ${AcceptCaseCheckbox}
     sleep   1s
     Wait Until Page Contains   You have accepted Cases from the queue and are now their owner

Select the Subcase Record
    Sleep  2s
        ${ClickSubcase}=     Set Variable   (//a[contains(@data-refid,'recordId')])[27]
        Click Element         ${ClickSubcase}
         sleep   1s

Select FAQ document
    Sleep  2s
    ${ClickFAQ}=     Set Variable   //b[contains(text(), 'here')]
    Click Element At Coordinates     ${ClickFAQ}     0   0
    Sleep  2s



GetDate
     ${Date}=  Get Current Date  result_format=%d/%m/%Y
     [Return]     ${Date}
     Log To Console   ${Date}
     Set global variable   ${Date}

GetDate1
     ${Date}=  Get Current Date  result_format=%dd/%mm/%YYYY
     [Return]     ${Date}
     Log To Console   ${Date}
     Set global variable   ${Date}


Get DateTime
     ${date1}=  Get Current Date  result_format=%Y-%m-%d %H-%M-%S
     [Return]     ${date1}

Click Save & New
    ${save-and-new-btn}=     Set Variable   //button[@name='SaveAndNew']
    Click Element At Coordinates   ${save-and-new-btn}     0   0

Input Text Field By PersonAccount creation
    [Arguments]     ${name}     ${text}=placeholder-string
    ${input-field}=      Set Variable    //label[contains(text(), '${name}')]/following::div[1]/input
    Input Text       ${input-field}      ${text}

Get Date & Time on Banner
    [Arguments]      ${addb_days}
    ${date_var}=  Set Variable    datetime.date.today()
    log    ${date_var}    console=yes
    ${time}    Get Time    NOW
    ${plus}    Add Time To Date    ${time}    ${addb_days}
    ${convert}    Convert Date    ${plus}    result_format=%Y-%m-%d %H:%M
    log    ${convert}    console=yes
    #Should Be Equal    ${date_var}    ${convert}    ELSE    Log    console=yes
    [Return]  ${convert}



Get Date & Time on Banner2
    [Arguments]      ${addb_days}
    ${date_var}=  Set Variable    datetime.date.today()
    ${addb_days}   BuiltIn.Convert To Integer  ${addb_days}
    ${extra}=  Set Variable  ${8}
    ${addb_days1}=  Evaluate   ${addb_days} + ${extra}
    ${addb_days1}   BuiltIn.Convert To String  ${addb_days1}
    ${da}=  Set Variable     days
    ${addb_days2}=  Set Variable   ${addb_days1}${da}
    log    ${date_var}    console=yes
    ${time}    Get Time    NOW
    ${plus}    Add Time To Date    ${time}    ${addb_days2}
    ${convert}    Convert Date    ${plus}    result_format=%d/%m/%Y
    #result_format=%Y-%m-%d
    #%H:%M
    log    ${convert}    console=yes
    #Should Be Equal    ${date_var}    ${convert}    ELSE    Log    console=yes
    [Return]  ${convert}

Get Date & Time on Banner calendardays
    [Arguments]      ${addb_days}
    ${date_var}=  Set Variable    datetime.date.today()
    ${addb_days}   BuiltIn.Convert To Integer  ${addb_days}
    ${extra}=  Set Variable  ${1}
    ${addb_days1}=  Evaluate   ${addb_days} - ${extra}
    ${addb_days1}   BuiltIn.Convert To String  ${addb_days1}
    ${da}=  Set Variable     days
    ${addb_days2}=  Set Variable   ${addb_days1}${da}
    log    ${date_var}    console=yes
    ${time}    Get Time    NOW
    ${plus}    Add Time To Date    ${time}    ${addb_days2}
    ${convert}    Convert Date    ${plus}    result_format=%d/%m/%Y
    #result_format=%Y-%m-%d
    #%H:%M
    log    ${convert}    console=yes
    #Should Be Equal    ${date_var}    ${convert}    ELSE    Log    console=yes
    [Return]  ${convert}





add_business_days # to be updated later
        [Arguments]     ${business_days_to_add_str}
    ${current_date} =  Set Variable    datetime.date.today()
    #datetime.datetime.strptime(current_date_str, '%Y-%m-%d %H:%M')
    ${business_days_to_add} =  Set Variable   int(${business_days_to_add_str})
    ${num_whole_weeks} =  Set Variable  ${business_days_to_add}  / 5
    ${extra_days} =  Set Variable  ${num_whole_weeks} * 2

    ${first_weekday} =  Set Variable  int(${current_date}.weekday())
    ${remainder_days} =  Set Variable  int(${business_days_to_add} % 5)

    ${natural_day} =  Set Variable  int((${first_weekday})+(${remainder_days}))
    IF  ${natural_day} > 4
        IF  ${first_weekday} == 5
            ${extra_days} + = 1
        END
        ELSE IF  ${first_weekday} != 6
            ${extra_days} + =  2
        END
    [Return]   ${current_date} + datetime.timedelta(${business_days_to_add} + ${extra_days})
    END
