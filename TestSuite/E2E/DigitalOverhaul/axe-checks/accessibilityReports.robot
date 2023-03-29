*** Settings ***
Library  SeleniumLibrary    implicit_wait=15
Library  AxeLibrary
Library  OperatingSystem
Library  Collections

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/complaint.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***
Run the accessibility checks on the app
    [Tags]  TTCS20-4218

    ${file}   Get File   dhOverhaulURLs.json
    ${urlList}   Evaluate   json.loads('''${file}''')    json
    FOR   ${item}   IN   @{urlList}
        Go To   ${item["url"]}
        &{results}=    Run Accessibility Tests    axe_results.json
        Log   Violations Count: ${results.violations}
        Log Readable Accessibility Result    violations
    END



