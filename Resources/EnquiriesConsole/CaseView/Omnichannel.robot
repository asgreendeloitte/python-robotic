*** Variables ***
${OmnichannelIcon}                   xpath://span[contains(text(),'Omni-Channel (Offline)')]
${OmnichannelOnlineIcon}                   xpath://span[contains(text(),'Omni-Channel (Online)')]
${ChangetheStatusdropdown}           xpath://span[contains(text(),'Change your Omni-Channel status')]
${AcceptWA}                          xpath://div[@class='actionBlock']

*** Keywords ***

Agent clicks on OmniChannel

        ${OmnichannelIconvisible} =     Run Keyword And Return Status        Element Should Be Visible      ${OmnichannelIcon}
        Set Global Variable     ${OmnichannelIconvisible}
        Run Keyword If    ${OmnichannelIconvisible} ==True
        ...     Click Element       ${OmnichannelIcon}
        ...     ELSE            Click Element       ${OmnichannelOnlineIcon}

Click status dropdown
        Sleep       5s
        #Click Element     ${ChangetheStatusdropdown}
        Click Element At Coordinates     ${ChangetheStatusdropdown}     0    0

Select Status dropdown for OmiChannel
#    [Arguments]     ${name}
    sleep   2s
#    ${dropdown-box}=     Set Variable       //span[contains(text(), '${name}')]
#    #${dropdown-box}=     Set Variable       //a[contains(text(), '${name}')]
#    Click Element At Coordinates       ${dropdown-box}    0   0
       ${dropdown-btn}=     Set Variable   //span[contains(text(),'Available for Web and Email')]
          Click Element At Coordinates   ${dropdown-btn}    0   0
          sleep   2s
Select Status dropdown for OmiChannel-RTS
#    [Arguments]     ${name}
    sleep   2s
#    ${dropdown-box}=     Set Variable       //span[contains(text(), '${name}')]
#    #${dropdown-box}=     Set Variable       //a[contains(text(), '${name}')]
#    Click Element At Coordinates       ${dropdown-box}    0   0
       ${dropdown-btn}=     Set Variable   //span[contains(text(),'Available for LTS/RTS')]
          Click Element At Coordinates   ${dropdown-btn}    0   0
          sleep   2s
Click My Work
        Sleep  2s
        ${work-btn}=     Set Variable   //span[contains(text(),'New (1)')]
        Click Element At Coordinates    ${work-btn}    0   0
        sleep   2s

Accept Work Assignment
#        Click Element     ${AcceptWA}
#        Sleep  4s
          Sleep  2s
          ${Accept-btn}=     Set Variable   //div[@class='actionBlock']
          Click Element At Coordinates    ${Accept-btn}   0   0
           sleep   2s

Minimise Omnichannel

          Sleep  3s
          ${Minimise-btn}=     Set Variable   //button[@title='Minimize']
          Click Element At Coordinates     ${Minimise-btn}  0   0
           sleep   2s


Accept work through Omnichannel

        Sleep  4s
        Agent clicks on OmniChannel
        Click status dropdown
        Select Status dropdown for OmiChannel
        Click My Work
        Accept Work Assignment
        Minimise Omnichannel

Accept work through Omnichannel-RTS

        Sleep  4s
        Agent clicks on OmniChannel
        Click status dropdown
        Select Status dropdown for OmiChannel-RTS
        Click My Work
        Accept Work Assignment
        Minimise Omnichannel




