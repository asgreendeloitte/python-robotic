*** Settings ***
Library  DateTime

*** Keywords ***
Create Description With Date And Time
    [Arguments]     ${Description}
    ${CurrentDateTime}=  Get Current Date  result_format=%Y-%m-%d %H-%M-%S

    ${DescriptionWithDatetime}=    Catenate     ${Description} - This was created by automation testing at ${CurrentDateTime}
    # Example: Yer a wizard Harry - This was created by automation testing at 2021-01-15 17-03-36

    Set Global Variable     ${DescriptionWithDatetime}
    [Return]    ${DescriptionWithDatetime}


Create Email With Date
    [Arguments]     ${ContactEmail}
    ${CurrentDate}=  Get Current Date  result_format=%d-%m

    ${EmailWithDate}=      Catenate     ${CurrentDate}-${ContactEmail}
    # Example: 19-01-rubeus@hogwarts.com

    Set Global Variable     ${EmailWithDate}
    [Return]    ${EmailWithDate}