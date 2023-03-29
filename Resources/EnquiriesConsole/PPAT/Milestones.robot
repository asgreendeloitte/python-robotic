*** Settings ***
Library  String
Resource    ${EXECDIR}/Resources/EnquiriesConsole/GlobalButtons.robot

*** Variables ***
${message}          The way to get started is to quit talking and begin doing.
${sla-text1}        1 month
${sla-text2}        2 days
${sla-text3}        4 days
${sla-milestone}    //*[@class='milestoneTimerText ontrackTimer']
${sla-text4}        21 days
${case-origin-date-field}       (//label[contains(text(), 'Date')]/../../div/input)[1]