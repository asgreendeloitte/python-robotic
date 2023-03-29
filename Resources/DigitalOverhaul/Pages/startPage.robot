*** Variables ***
${get-help}               //a[@href="#get-help"]
${make-a-complaint}      //a[@href="#make-complaint"]
${test-and-trace}        //a[@href="#test-and-trace"]

*** Keywords ***
click on the get help link
    Click Element   ${get-help}

Click on the make a complaint link
    Click Element   ${make-a-complaint}

click on the test and trace link
    Click Element   ${test-and-trace}

