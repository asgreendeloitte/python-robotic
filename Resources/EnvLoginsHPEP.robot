*** Settings ***
# This imports the correct Salesforce login urls and Agent login keywords for the environment
Resource    ${EXECDIR}/Resources/ServiceCloud/AgentLogins/${ENV}_AgentLogins.robot


*** Variables ***

#${ENV}      dev    #Default
#${ENV}      staging
${ENV}      uat
#${ENV}      preprod
