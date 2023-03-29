*** Settings ***
Library  String
Resource    ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

*** Variables ***
${add-member}                            (//div[@title="Add Member"])[2]
${one-more-action}                        //span[text()='Team Member']/parent::div/parent::div/parent::th/parent::tr/parent::thead/parent::table/tbody/tr/td[5]/span/div/a
${delete-btn}                             //li//a[@title="Delete"]

*** Keywords ***
Select the add member
    Click Element   ${add-member}

Select menu action next to the named team member
    Click Element   ${one-more-action}

Select delete action next to the named team member
    Click Element   ${delete-btn}