*** Variables ***

${navigation-dropdown}          //button[@title='Show Navigation Menu']
${SelectReports}                //span[contains(text(),'Reports')]
${AllReports}                    //a[@title='All Reports']
${SearchReportTypes}            //input[@placeholder='Search all reports...']
${SearchReportTypeValue}        Case Record Type
${CaseRecordTypeVal}           //span[contains(text(),'Update Report')]
#//span[contains(text(),'Case Record Type')]
# //a[contains(@title,'Case Record Type Update Report')]

*** Keywords ***

Click Case Record Type(bug fix)

    ${CaseRecordType_Val}=     Set Variable    //a[contains(@title,'Case Record Type Update Report')]
     sleep   1s
    Set Focus To Element    ${CaseRecordType_Val}
    Click Element       ${CaseRecordType_Val}
    sleep   1s
    Press Keys  None  RETURN
    sleep   1s
Specialist Case Record Type Report Validation
        Sleep  4s
       Click Element   ${navigation-dropdown}
       Click Element   ${SelectReports}
       Sleep  2s
       Click Element   ${AllReports}
       Click Element    ${SearchReportTypes}
       Input Text   ${SearchReportTypes}   ${SearchReportTypeValue}
       Sleep  2s
       Page Should Contain    This report shows all the Test Cases which got assigned from Trace Team.
       Click Case Record Type(bug fix)
       Sleep  2s
       Page Should Contain   Case Record Type Update Report
