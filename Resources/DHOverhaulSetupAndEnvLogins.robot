*** Settings ***

# This imports the correct DigitalOverhaul urls and setup keywords
Resource    ${EXECDIR}/Resources/DigitalOverhaul/Setup/${ENV}_DigitalOverhaul.robot
Resource    ${EXECDIR}/Resources/EnquiriesConsole/AgentLogins/${ENV}_AgentLogins.robot


*** Variables ***
#${ENV}        comptest
#${ENV}        tst
#${ENV}        its
${ENV}        uat
#${ENV}        crossbrowser
#${ENV}        preprod
#${ENV}        dev