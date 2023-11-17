*** Settings ***
Documentation       Login Page - Page Objects
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
${UserNameTxt}              id=user-name
${PasswordTxt}              id=password
${LoginBtn}                 id=login-button
${ErrorLoginMessage}        //h3 
${XIconUser}                css:.form_group:nth-child(1) path
${XIconPassword}            css:.form_group:nth-child(2) path

*** Keywords ***
Valid Login
    Open Saucedemo URL
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          ${standarduser}
    Input Text                          ${PasswordTxt}          ${password}
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${SwagLabsLbl}  
    Element Text Should Be              ${SwagLabsLbl}          Swag Labs
    Element Text Should Be              ${ProducsSwagLabsLbl}          Products

Nonexistent Username
    Open Saucedemo URL
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          IDontExist
    Input Text                          ${PasswordTxt}          ${password}
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${ErrorLoginMessage}  
    Element Text Should Be              ${ErrorLoginMessage}          Epic sadface: Username and password do not match any user in this service
    Element Should Be Visible           ${XIconUser}
    Element Should Be Visible           ${XIconPassword}

Valid Username and Blank Password in Textbox
    Open Saucedemo URL
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          IDontExist
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${ErrorLoginMessage}  
    Element Text Should Be              ${ErrorLoginMessage}          Epic sadface: Password is required
    Element Should Be Visible           ${XIconUser}
    Element Should Be Visible           ${XIconPassword}

Valid User and using Wrong Password
    Open Saucedemo URL
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          ${standarduser}
    Input Text                          ${PasswordTxt}          WrongPassword
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${ErrorLoginMessage}  
    Element Text Should Be              ${ErrorLoginMessage}          Epic sadface: Username and password do not match any user in this service
    Element Should Be Visible           ${XIconUser}
    Element Should Be Visible           ${XIconPassword}

Login with Lockedout User 
    Open Saucedemo URL
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          ${lockedoutuser}
    Input Text                          ${PasswordTxt}          ${password}
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${ErrorLoginMessage}  
    Element Text Should Be              ${ErrorLoginMessage}          Epic sadface: Sorry, this user has been locked out.
    Element Should Be Visible           ${XIconUser}
    Element Should Be Visible           ${XIconPassword}

Valid Login in Headless
    Go in Headless Firefox
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          ${standarduser}
    Input Text                          ${PasswordTxt}          ${password}
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${SwagLabsLbl}  
    Element Text Should Be              ${SwagLabsLbl}          Swag Labs
    Element Text Should Be              ${ProducsSwagLabsLbl}          Products

Example Arguments: Blank Username
    Open Saucedemo URL
    ExampleArguments                    ${Empty}           ${password}
    Wait Until Element Is Visible       ${ErrorLoginMessage}  
    Element Text Should Be              ${ErrorLoginMessage}          Epic sadface: Username is required
    Element Should Be Visible           ${XIconUser}
    Element Should Be Visible           ${XIconPassword}

Click In Login button
    Click button                        ${LoginBtn}
    
ExampleArguments
    [Arguments]      ${user}              ${pass}
    Wait Until Element Is Visible         ${UserNameTxt}  
    Input Text       ${UserNameTxt}        ${user}  
    Input Text       ${PasswordTxt}        ${pass}
    Click button     ${LoginBtn}
