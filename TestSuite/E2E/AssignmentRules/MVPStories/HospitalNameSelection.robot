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

Resource    ${EXECDIR}/Resources/EnquiriesConsole/CaseView/AgentCreateCase.robot

Test Setup      Open Browser and Go To Salesforce Login
Test Teardown   End Test1


*** Variables ***
${message}      The way to get started is to quit talking and begin doing.

*** Test Cases ***
Test Agent adds HospitalName selection
    [Tags]  TTCS20-1894

    Go To Salesforce login

    Login as Generalist Test Agent
    Reset View (if applicable)
    #Display Most Recent Cases From General Complaints & Enquiries- Test Queue
    Go To Cases Tab
    Sleep  3s
    Agent Creates Case
    sleep   3s

    Click Edit
    Click Drop Down By Name     Category
    Select Dropdown Option      Elective Care

    Click Drop Down By Name     Subcategory
   Select Dropdown Option      Elective Care - Other

   Click Drop Down By Name    Test Type
    Select Dropdown Option      PCR test

     #  Click Drop Down By Name     Private Test Complaint Reason
    #  Select Dropdown Option      Test not received
     #Hospital Name Lookup Selection
     Scroll Element Into View    (//span[contains(text(), 'RIT Date Received')])[3]
      Click Element        ${search_Hospitals}
     page should contain element  ${search_Hospitals}
      Page Should Contain    Trust
    Click Save
    Wait Until Page Has Saved
    # Display Field text Should Be    Trust    Portsmouth Hospitals NHS Trust


#Trace Agent adds HospitalName selection
   # [Tags]  TTCS20-1989

    #Go To Salesforce login

    #Login as E&C Central Agent
    # Display Most Recent Cases From Generalist Enquiries – Trace Queue
    #Agent Creates Case - Trace
    #sleep   3s

      #  Click Edit
       #  Click Drop Down By Name     Category
        # Select Dropdown Option      Elective Care

         #Click Drop Down By Name     Subcategory
        #Select Dropdown Option      Elective Care - Other

        #Click Drop Down By Name    Test Type
        #Select Dropdown Option      PCR test

         #Click Drop Down By Name     Private Test Complaint Reason
          # Select Dropdown Option      Test not received
           #Hospital Name Lookup Selection
           #Click Element        ${search_Hospitals}
           #page should contain element  ${search_Hospitals}

        #Page Should Contain    Trust

         #Click Save
         #Wait Until Page Has Saved
          #Display Field text Should Be    Trust    Portsmouth Hospitals NHS Trust