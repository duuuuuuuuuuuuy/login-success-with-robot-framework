*** Setting ***
Library   Selenium2Library
Library   DataDriver      ./LoginSuccessData.xlsx        sheet_name=LoginData        encoding=utf_8

Test Setup                      Go To The Website
Test Teardown                   Close Browser
Test Template                   Login Success

*** Variables ***
${url}              https://www.saucedemo.com/
${browser}          Chrome
# ${username}         standard_user
# ${password}         secret_sauce
# Login Screen
${txtLoginId}       //form//input[@id='user-name']
${txtPassword}      //form//input[@id='password']
${valButton}        //form//input[@id='login-button']
# Product Screen
${headerProducts}   //span[text() = 'Products']



*** Keywords ***
Go To The Website
  Open Browser  ${url}  ${browser}
  Maximize Browser Window  
  BuiltIn.Sleep  5s  reason=None

# Login To The Website
Input value Login Id field
    [Arguments]         ${valLoginId}
    Wait Until Element Is Visible  ${txtLoginId}  timeout=60s  error=None
    Input Text  ${txtLoginId}  ${valLoginId}
    Sleep  2s  reason=None

Input value for Password field
    [Arguments]         ${valPassword}
    Wait Until Element Is Visible  ${txtLoginId}  timeout=60s  error=None
    Input Password  ${txtPassword}  ${valPassword}
    Sleep  2s  reason=None

Click Button in Login form
    [Arguments]         ${valButton}
    Wait Until Element Is Visible  ${valButton}  timeout=60s  error=None
    Click Element  ${valButton}  modifier=False
    Sleep  2s  reason=None

Login Success
    [Arguments]   ${username}   ${password}
    Input value Login Id field  ${username}
    Input value for Password field  ${password}
    Click Button in Login form  ${valButton}
    Wait Until Element Is Visible  ${headerProducts}  timeout=30s  error=None


*** Test Cases ***
Verify Login Success with Valid Cases       ${username}     ${password}
