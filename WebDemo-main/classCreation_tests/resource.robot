*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0
${VALID TITLE}     demo
${VALID DESCRIPTION}    mode
${VALID DIFFICULTY}    Beginner
${VALID LANGUAGE}      Cantonese
${CREATECLASS URL}      http://${SERVER}/
${CLASSCREATED URL}    http://${SERVER}/classCreated.html
${CLASSCREATIONERROR URL}      http://${SERVER}/classCreationError.html

*** Keywords ***
Open Browser To Create Page
    Open Browser    ${CREATECLASS URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Create Page Should Be Open

Create Page Should Be Open
    Title Should Be    Create class

Go To Create class Page
    Go To    ${CREATECLASS URL}
    Create Page Should Be Open

Input Title
    [Arguments]    ${title}
    Input Text    title_field    ${title}

Input Description
    [Arguments]    ${description}
    Input Text    description_field    ${description}

Input Difficulty
    [Arguments]    ${difficulty}
    Select From List By Label  difficulty_field  ${difficulty}
Input Language
    [Arguments]    ${language}
    Select From List By Label  language_field  ${language}
Submit Credentials
    Click Button    submit_button

Class Created Page Should Be Open
    Location Should Be    ${CLASSCREATED URL}
    Title Should Be    Result Page
