*** Keywords ***
Library ImapLibrary2

Perform email verification
        [Arguments]     ${subject-text}     ${Body-text1}     ${Body-text2}    ${Body-text3}    ${Body-text4}
        Open Mailbox    host=imap.gmail.com    user=testtrace4    password=Waterloo123
        ${LATEST} =     Wait For Email    subject=${subject-text}    timeout=60
        ${HTML} =       Get Email Body    ${LATEST}
        Should Contain    ${HTML}    ${Body-text1}
        Should Contain    ${HTML}    ${Body-text2}
        Should Contain    ${HTML}    ${Body-text3}
        Should Contain    ${HTML}    ${Body-text4}
        Close Mailbox

Perform multipart email verification
   [Arguments]     ${subject-text}     ${Body-text1}     ${Body-text2}    ${Body-text3}    ${Body-text4}
    Open Mailbox    host=imap.gmail.com    user=testtrace4    password=Waterloo123
    ${LATEST} =     Wait For Email    subject=${subject-text}    timeout=60
    ${parts} =    Walk Multipart Email    ${LATEST}
    FOR    ${i}    IN RANGE    ${parts}
        Walk Multipart Email    ${LATEST}
        ${content-type} =    Get Multipart Content Type
        Continue For Loop If    '${content-type}' != 'text/html'
        ${payload} =    Get Multipart Payload    decode=True
        Should Contain    ${payload}    ${Body-text1}
        Should Contain    ${payload}    ${Body-text2}
        Should Contain    ${payload}    ${Body-text3}
        Should Contain    ${payload}    ${Body-text4}
    END
    Close Mailbox