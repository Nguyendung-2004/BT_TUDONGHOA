*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${LOGIN_USER}     Admin
${LOGIN_PASS}     admin123
${LOGIN_USER_FAIL}   Admin
${LOGIN_PASS_FAIL}   12345

*** Test Cases ***

Login With Valid Credentials
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    3s
    Input Text    name:username    ${LOGIN_USER}
    Input Text    name:password    ${LOGIN_PASS}
    Click Button    xpath://button[@type='submit']
    Sleep     5s
    Page Should Contain Element    xpath://h6[text()='Dashboard']
    Close Browser

Login With Invalid Credentials
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    3s
    Input Text    name:username    ${LOGIN_USER_FAIL}
    Input Text    name:password    ${LOGIN_PASS_FAIL}
    Click Button    xpath://button[@type='submit']
    Sleep    5s
    Page Should Contain    Invalid credentials
    Close Browser
