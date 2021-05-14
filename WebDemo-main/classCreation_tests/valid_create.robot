*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Create Page
    Input Title    demo
    Input Description    mode
    Input Difficulty    ${VALID DIFFICULTY}
    Input Language      ${VALID LANGUAGE}
    Submit Credentials
    Class Created Page Should Be Open
    [Teardown]    Close Browser
