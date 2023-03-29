*** Settings ***
Library  SeleniumLibrary    implicit_wait=15

# Setup & Global
Resource     ${EXECDIR}/Resources/DHOverhaulSetupAndEnvLogins.robot

# DigitalHelper Overhaul Pages
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Flows/GenerateDHOverhaulForm.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/globalElements.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/startPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/ConfirmationPage.robot
Resource     ${EXECDIR}/Resources/DigitalOverhaul/Pages/homeAddress.robot

Test Setup      Open Browser, Go To Digital Overhaul and Accept Cookies
Test Teardown   Close Browser

*** Test Cases ***
Enter your home address
    [Tags]  TTCS20-3383
    Go To Digital Overhaul
    click on the get help link
    Get help and make an enquiry about the topic     2

    Find a test result for covid-19 testing
    Click Submit form
    Sleep  2s

    Select myself Radio Button
    Click Continue on the page

    globalElements.Select Radio Button By Value    PCR test
    Click Continue on the page

    globalElements.Select Radio Button By Value    Yes
    Click Continue on the page

    Page should contain     When was the test taken?
    Input the day was the test taken    25  02  2021
    Click Continue on the page

    globalElements.Select Radio Button By Value     Yes-barcode
    Input the test barcode      ABC12345678
    Click Continue on the page

    Input the mobile phone number was used to book the test     +447700900982
    Click Continue on the page

    Input the day of your birth     14  02  1987
    Click Continue on the page

    Page should contain     Enter your home address
    Page should contain     If you do not have a home address in the UK, use the address where you are staying while in the UK.

    Page should contain    Please enter the postcode
    Input the postcode      IM9 4AA
    Click Continue on the page

    Page should contain     Enter your home address
    Click I can't find my address in the list

    Page should contain     Enter your home address
    Click Continue on the page

    Page should contain     Enter house number or name
    Page should contain     Enter street name
    Page should contain     Enter town or city
    Page should contain     Enter postcode
    Input the House number or name      131
    Click Continue on the page

    Page should contain     Enter street name
    Page should contain     Enter town or city
    Page should contain     Enter postcode
    Input the Street name               Kings road
    Click Continue on the page

    Page should contain     Enter town or city
    Page should contain     Enter postcode
    Input the Town or city              London
    Click Continue on the page

    Page should contain     Enter postcode
    Input the postcode in address not found                 IM9 4AA
    Click Continue on the page

    Page should contain    Are you fully vaccinated
    Click Goback

    Input the House number or name      1*&*
    Click Continue on the page
    Page should contain     House number or name must only include letters a to z, numbers, spaces, hyphens, full stops, commas, apostrophes and exclamation marks

    Input the House number or name      131
    Input the Street name               1@£$%
    Click Continue on the page
    Page should contain     Street name must only include letters a to z, numbers, spaces, hyphens, full stops, commas, apostrophes and exclamation marks

    Input the Street name               Kings road
    Input the Town or city              1@£$£%
    Click Continue on the page
    Page should contain     Town or city must only include letters a to z, numbers, spaces, hyphens, full stops, commas, apostrophes and exclamation marks

    Input the Town or city              London
    Input the postcode in address not found                  SDFDT&^%*^&&
    Click Continue on the page
    Page should contain     Enter a real postcode, like S42 5TT

     Input the postcode in address not found                 AAA1A1
    Click Continue on the page
    Page should contain     Enter a real postcode, like S42 5TT

     Input the postcode in address not found                  111AA1A
    Click Continue on the page
    Page should contain     Enter a real postcode, like S42 5TT

     Input the postcode in address not found                  AA1 A1
     Click Continue on the page
     Page should contain     Enter a real postcode, like S42 5TT

      Input the postcode in address not found                  AA1 A11
     Click Continue on the page
     Page should contain     Enter a real postcode, like S42 5TT

  #   Input the postcode                  AA9A9AA
   #  Click Continue on the page
  #   Page should contain     Enter a real postcode, like S42 5TT

     Input the House number or name      FUCK
     Click Continue on the page
     Page should contain     House number or name must not include profanities

     Input the Street name               FUCK
     Click Continue on the page
     Page should contain     Street name must not include profanities

     Input the Town or city              FUCK
     Click Continue on the page
     Page should contain     Town or city must not include profanities

     Input the House number or name      A wonderful serenity has taken possession of my entire soul like these sweet mornings of spring which I enjoy with my whole heart I am alone and feel the charm of existence in this spot which was created for the bliss of souls like mine I am so happy my dear friend so absorbed in the exquisite sense of mere tranquil existence that I neglect my talents I should be incapable of drawing a single stroke at the present moment and yet I feel that I never was a greater artist than now When while the lovely valley teems with
     Click Continue on the page
     Page should contain     House number or name must be not be more than 99 characters

     Input the Street name               A wonderful serenity has taken possession of my entire soul like these sweet mornings of spring which I enjoy with my whole heart I am alone and feel the charm of existence in this spot which was created for the bliss of souls like mine I am so happy my dear friend so absorbed in the exquisite sense of mere tranquil existence that I neglect my talents I should be incapable of drawing a single stroke at the present moment and yet I feel that I never was a greater artist than now When while the lovely valley teems with
     Click Continue on the page
     Page should contain     Street name must be not be more than 155 characters

     Input the Town or city              A wonderful serenity has taken possession of my entire soul like these sweet mornings of spring which I enjoy with my whole heart I am alone and feel the charm of existence in this spot which was created for the bliss of souls like mine I am so happy my dear friend so absorbed in the exquisite sense of mere tranquil existence that I neglect my talents I should be incapable of drawing a single stroke at the present moment and yet I feel that I never was a greater artist than now When while the lovely valley teems with
     Click Continue on the page
     Page should contain     Town or city must be not be more than 255 characters

     Input the postcode in address not found                 A wonderful serenity has taken possession of my entire soul like these sweet mornings of spring which I enjoy with my whole heart I am alone and feel the charm of existence in this spot which was created for the bliss of souls like mine I am so happy my dear friend so absorbed in the exquisite sense of mere tranquil existence that I neglect my talents I should be incapable of drawing a single stroke at the present moment and yet I feel that I never was a greater artist than now When while the lovely valley teems with
     Click Continue on the page
     Page should contain     Enter a real postcode, like S42 5TT

     Input the House number or name      131
     Input the Street name               Kings road
     Input the Town or city              London
      Input the postcode in address not found                  S42 5TT
     Click Continue on the page
     Page should contain        Are you fully vaccinated?









