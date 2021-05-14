*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Create Page
Suite Teardown    Close Browser
Test Setup        Go To Create class Page
Test Template     Create With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***               TITLE            DESCRIPTION           DIFFICULTY           LANGUAGE
Empty TITLE                      ${EMPTY}         ${VALID DESCRIPTION}  ${VALID DIFFICULTY}  ${VALID LANGUAGE}
Empty DESCRIPTION                ${VALID TITLE}   ${EMPTY}              ${VALID DIFFICULTY}  ${VALID LANGUAGE}
Invalid DIFFICULTY               ${VALID TITLE}   ${VALID DESCRIPTION}  Please select        Please select
Invalid LANGUAGE                 ${VALID TITLE}   ${VALID DESCRIPTION}  Please select        Please select
All Invalid Arguments            ${EMPTY}         ${EMPTY}              Please select        Please select

*** Keywords ***
Create With Invalid Credentials Should Fail
    [Arguments]    ${TITLE}    ${DESCRIPTION}  ${DIFFICULTY}  ${LANGUAGE}
    Input Title    ${TITLE}
    Input Description    ${DESCRIPTION}
    Input Difficulty    ${DIFFICULTY}
    Input Language      ${LANGUAGE}
    Submit Credentials
    Creation Should Have Failed

Creation Should Have Failed
    Location Should Be    ${CLASSCREATIONERROR URL}
    Title Should Be    Error Page
