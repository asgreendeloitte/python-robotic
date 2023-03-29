*** Variables ***
${close-contacts}                                  //h4[@id="close-contacts"]
${if-you-are-close-contact-live-with-them}         //button[@id='if-you-are-a-close-contact-of-someone-who-has-covid-19-and-live-in-the-same-household-header']
${follow-the-advice}                               //a[@href="https://www.gov.uk/guidance/people-with-symptoms-of-a-respiratory-infection-including-covid-19#what-to-do-if-you-are-a-close-contact-of-someone-who-has-had-a-positive-test-result-for-covid-19"]
${if-you-are-close-contact-donot-live-with-them}   //button[@id='if-you-are-a-close-contact-of-someone-who-has-covid-19-and-do-not-live-with-them-header']
${live-safely}                                     //a[@href="https://www.gov.uk/guidance/living-safely-with-respiratory-infections-including-covid-19"]



*** Keywords ***

Click the close contact enquiry link
     Click Element   ${close-contacts}

Click on if you are a close contact of someone who has ccovid-19 and live in the same household
     Click Element   ${if-you-are-close-contact-live-with-them}

Click on follow the advice of close contacts of people with Covid-19
    Click Element   ${follow-the-advice}

Click on if you are a close contact of someone who has covid-19 and do not live with them
     Click Element   ${if-you-are-close-contact-donot-live-with-them}

Click on how to live safely with respiratory infections, including covid-19
    Click Element     ${live-safely}

