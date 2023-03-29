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

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.
${new}                      //a[@title='New']
${new-Report}               //a[@title='New Report']
${new-folder}               //*[@title='New Folder']
${test-text}            test text
${outcome}      (//span[contains(text(), 'Outcome')]/../../div/div/div/div/div/div/div/div/div/div/div)[1]
#${reason-for-feedback-helper}                   //span[text()='Reason for feedback']/../../div[2]
${reason-for-feedback-helper}       //span[text()='Reason for feedback']/../../lightning-helptext
${customer-journey-friction-point-helper}       //span[text()='Customer journey friction point']/../../lightning-helptext
${improvement-to-be-actioned-helper}            //span[text()='Improvement to be actioned']/../../lightning-helptext
${improvement-to-be-actioned}       (//span[contains(text(), 'Improvement to be actioned')])[4]/../../textarea




*** Test Cases ***
MP Trace Agent Origin Demographics is MP - Enquiry
    [Tags]  TTCS20-3366-01
    Login as MP Trace Lead Agent
    Sleep   2s
    Reset View (if applicable)
    Open cases tab and select list view
    Sleep  2s

    Agent Creates Case - MP Complaints

    Click Edit
    Click Drop Down By Name         Case type
    Select Drop down option         Enquiry
    Click Drop Down By Name         Category
    Select Drop down option         Test - General
    Click Drop Down By Name         Subcategory
    Select Drop down option         MP Test

    Click Save
    Wait Until Page Has Saved
    Sleep  3s

    Click Edit
    Click Drop Down By Name         Status
    Select Drop down option         Closed
    Click Save
    Wait Until Page Has Saved
    Sleep  3s

    Page Should Contain     When Case Origin = MP Trace Mailbox, ensure the following fields are populated; Reason for feedback, Improvement to be actioned and Customer journey friction point
    Click Save

MP Trace Agent Origin Demographics is MP - Feedback
    [Tags]  TTCS20-3366-02
    Login as MP Trace Lead Agent
    Sleep   2s
    Reset View (if applicable)
    Open cases tab and select list view
    Sleep  2s
    Agent Creates Case - MP Complaints

    Click Edit
    Click Drop Down By Name         Category
    Select Drop down option         Test - General
    Click Drop Down By Name         Subcategory
    Select Drop down option         MP Test
    Click Save
    Wait Until Page Has Saved
    Sleep  3s

    Click Edit
    Click Drop Down By Name         Status
    Select Drop down option         Closed
    Click Save
    Wait Until Page Has Saved
    Sleep  3s

    Page Should Contain     Closed
    Click Save

#Trace Generalist Agent - Case Type not Complaint
#    [Tags]  TTCS20-3366-03
#
#    Login as Generalist Trace Agent
#    Sleep   2s
#    Reset View (if applicable)
#    Open cases tab and select list view
#    Sleep  2s
#    Agent Creates Case - MP Complaints
#
#    Sleep   3s
#    Click Edit
#    Click Drop Down By Name         Case type
#    Select Drop down option         Enquiry
#    Click Drop Down By Name         Origin Demographics
#    Select Drop down option         Citizen
#    Click Save
#    Sleep   3s
#
#    Click Edit
#
#    Scroll Element Into View        ${outcome}
#    Sleep   5s
#    Click Element       ${outcome}
#    capture page screenshot
#    Sleep   5s
#    #Element Should Be Disabled      ${outcome}
#
#    Click Drop Down By Name         Reason for feedback
#    Select Drop down option         Results
#    Input Text      ${improvement-to-be-actioned}       Test Text
#    Click Drop Down By Name         Customer journey friction point
#    Select Drop down option         Taking test
#    Click Save
#
#    Page Should Contain         Review the errors on this page.
#    Page Should Contain         Reason for feedback, Improvement to be actioned, Customer journey friction point can only be populated where Case Type = Complaint OR Origin Demographic = MP


Trace Generalist Agent - Complaint Outcome Details section
    [Tags]  TTCS20-3366-04

    Login as MP Trace Lead Agent
    Sleep   2s
    Reset View (if applicable)
    Open cases tab and select list view
    Sleep  2s
    Agent Creates Case - MP Complaints

    scroll element into view        //span[text()='Relationship to person contacting']
    Sleep   1s
    Click Element       ${reason-for-feedback-helper}
    Sleep   3s
    Page Should Contain     Tracks reason for feedback. Should only be populated by MP Trace and Complaints agents.
    capture page screenshot

    Sleep   1s
    Click Element       ${customer-journey-friction-point-helper}
    Sleep   3s
    Page Should Contain     Tracks customer journey friction point. Should only be populated by MP Trace and Complaints agents.
    capture page screenshot

        Sleep   1s
    Click Element       ${improvement-to-be-actioned-helper}
    Sleep   3s
    Page Should Contain     Tracks if any improvement actions are to be taken. Should only be populated by MP Trace and Complaints agents.
    capture page screenshot