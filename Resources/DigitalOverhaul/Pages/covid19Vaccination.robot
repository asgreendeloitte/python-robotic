*** Variables ***
${covid19-vacc}                     //h4[@id="covid-19-vaccinations"]
${book-covid19-vacc}                //h3[@id="book-a-covid-19-vaccination"]
${book-manage-vacc-exp}             //button[@id='book-or-manage-your-vaccination-appointment-header']
${find-out-how-book}                //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/coronavirus-vaccination/book-coronavirus-vaccination"]
${visit-covid19-website}            //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/coronavirus-vaccination"]
${vacc-guidance}                    //h3[@id="vaccine-guidance"]
${covid19-vacc-guid}                //button[@id='covid-19-vaccine-guidance-header']
${read-vacc-guid}                   //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/coronavirus-vaccination/coronavirus-vaccine"]
${read-vacc-prog}                   //a[@href="https://www.gov.uk/government/collections/covid-19-vaccination-programme"]
${nhs-covid-pass}                   //h3[@id="nhs-covid-pass"]
${covid-pass-how-to-get}            //button[@id='what-is-a-covid-pass-and-how-to-get-one-header']
${read-covid-pass}                   //a[@href="https://www.nhs.uk/conditions/coronavirus-covid-19/covid-pass"]


*** Keywords ***

Click the Covid-19 vaccination
    Click Element   ${covid19-vacc}

Click the book a Covid-19 vaccination
    Click Element   ${book-covid19-vacc}

Click the book or manage your vaccination appointment
    Click Element   ${book-manage-vacc-exp}

Click find out how to book covid-19 vaccination or manage your vaccine appointments
    Click Element   ${find-out-how-book}

Click visit the covid-19 website on nhs.uk
    Click Element   ${visit-covid19-website}

Click vaccination guidance
    Click Element   ${vacc-guidance}

Click Covid-19 vaccine guidance expander
    Click Element   ${covid19-vacc-guid}

Click read about vaccine guidance and find out what happens when you have your vaccine
    Click Element   ${read-vacc-guid}

Click read about vaccine programme and download documents about the programme
    Click Element   ${read-vacc-prog}

Click nhs covid pass
    Click Element   ${nhs-covid-pass}

Click what is a covid-19 pass and how to get one
    Click Element   ${covid-pass-how-to-get}

Click read about what an nhs pass is, inlcuding who can get one and how to get one
    Click Element   ${read-covid-pass}


