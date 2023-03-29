*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalOverhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/footer.robot


Suite Setup     Open Browser, Go To Digital Overhaul and Accept Cookies
Suite Teardown  Close Browser

*** Test Cases ***

Accessibility statement
    [Tags]      TTCS20-4438    TTCS20-5201    TTCS20-5380

    Go To Digital Overhaul
    Page should contain      Get in contact with NHS Test and Trace for information about COVID-19. For example, test results and international travel.
    Click on uat accessibility statement link in the footer
    # in its
   # Click on its accessibility statement link in the footer
   # in DHQA env
   # Click on accessibility statement link in the footer
    Sleep   2s
    Page should contain      Accessibility statement
    Page should contain      Compatibility with tools
    Page should contain      What to do if you cannot access parts of this website
    Page should contain      How accessible this website is
    Page should contain      The issues above will be addressed as part of our commitment to improve our website’s accessibility on a regular and continuous basis.
    Page should contain      The target date for fixing these listed issues is January 2023.
    Page should contain      Get help
    Page should contain      make your mouse easier to use
    Page should contain      use your keyboard instead of a mouse
    Page should contain      talk to your device
    Page should contain      make your device talk to you
    Page should contain      make text larger
    Page should contain      change your colours
    Page should contain      magnify the screen
    Page should contain      Reporting accessibility problems with this website
    Page should contain      Enforcement procedure
    page should contain      Webchat may be available on some pages as part of our beta phase. It has not yet been independently evaluated. An evaluation will take place as part of our commitment to improve accessibility.
    page should contain      This statement was prepared on 14 June 2022. It was last updated on 15 December 2022






