*** Settings ***
Documentation     E2E Tests for service-taker (3AM) using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://vaccine-haven.herokuapp.com/
${BROWSER}        Chrome
${ID}             9621054640405
${SITENAME}       OGYHSite
 

*** Test Cases ***

Verify 2 item on the home page
    Open Browser To Home Page
    Verify Registration Section
    Verify Reservation Section

Test Create Reservation
    Visit The Reservation Page
    Input Reservation Info And Submit
    Visit The Reservation Info Page
    Verify The Created Reservation
    Go to Homepage

Test Cancel Reservation
    Visit The Reservation Info Page
    Cancel The Reservation
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Home Page
    Set Selenium Speed    0.5 seconds
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Vaccine Haven

Verify Registration Section
    Wait Until Page Contains            Citizen Registration
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/section[1]/div/div
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/section[1]/div/div/div/div/div[2]/a/button

Verify Reservation Section
    Wait Until Page Contains            Vaccine Reservation
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/section[2]/div/div
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/section[2]/div/div/div/div/div[2]/a/button

Visit The Reservation Page
    Click Element                       //*[@id="root"]/div/div[2]/section[2]/div/div/div/div/div[2]/a/button

Input Reservation Info And Submit
    Wait Until Page Contains Element    id:citizen_id
    Input Text                          id:citizen_id      ${ID}
    Select From List By Value           id:site_name       ${SITENAME}
    Select From List By Value           id:vaccine_name    Pfizer
    Click Element                       //*[@id="reserve__btn"]
    Wait Until Page Contains Element    //*[@id="splash-img"]/div/div/h1

Verify The Created Reservation
    Wait Until Page Contains Element    //*[@id="reserve_vaccine_value"]
    ${response}    Get Text    //*[@id="reserve_vaccine_value"]
    Should Be Equal As Strings    ${response}    Pfizer
    ${response}    Get Text    //*[@id="reserve_site_value"]
    Should Be Equal As Strings    ${response}    ${SITENAME}


Visit The Reservation Info Page
    Wait Until Page Contains Element    //*[@id="check_info__link"]/button
    Click Element                       //*[@id="check_info__link"]/button
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/form/div/div/div/div[2]/h1
    Input Text                          name:citizen_id    ${ID}
    Click Element                       //*[@id="root"]/div/div[2]/div/form/div/div/div/div[2]/div[5]/button

Cancel The Reservation
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div[2]/div[1]/div[2]/button
    Click Element                       //*[@id="root"]/div/div[2]/div[2]/div[1]/div[2]/button
    Wait Until Page Contains Element    //*[@id="root"]/div/div[2]/div/form/div/div/div/div[2]/h1

Go to Homepage
    Wait Until Page Contains Element    //*[@id="nav__home__link"]
    Click Element                       //*[@id="nav__home__link"]
    Wait Until Page Contains Element    //*[@id="splash-img"]/div/div/h1
    