*** Settings ***
Documentation       Keywords
Library             BuiltIn
Library             SeleniumLibrary
Library             OperatingSystem
Library             DateTime
Library             RequestsLibrary
Library             JSONLibrary
Library             String




Library             BuiltIn
Library             SeleniumLibrary
Library             OperatingSystem
Library             DateTime
Library             RequestsLibrary
Library             JSONLibrary
Library             String
*** Variables ***
${random_number}    Random Integer    1    100

*** Keywords ***
Finish TC
    SeleniumLibrary.Execute JavaScript                  window.localStorage.clear()
    SeleniumLibrary.Close Browser
	
Open Saucedemo URL
    #Create Webdriver    Chrome      executable_path=../settings/chromedriver.exe
    #Go To               ${URL_SauceDemo_QA}   
    Open Browser         ${URL_SauceDemo_QA}        ${Browser}
    Maximize Browser Window

Go in Headless
    ${options}      Evaluate        sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Create Webdriver    Chrome    chrome_options=${options}
    Go To   ${URL_SauceDemo_QA}        
    Maximize Browser Window

Valid Login
    Open Saucedemo URL
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          ${standarduser}
    Input Text                          ${PasswordTxt}          ${password}
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${SwagLabsLbl}  
    Element Text Should Be              ${SwagLabsLbl}          Swag Labs

Validate Checkout Successfully
    Wait Until Element Is Visible       ${PageTitleCompleteLbl}
    Element Text Should Be              ${PageTitleCompleteLbl}          Checkout: Complete!   
    Element Text Should Be              ${MainMessageLbl}        Thank you for your order!
    Element Text Should Be              ${CompleteMessageLbl}    Your order has been dispatched, and will arrive just as fast as the pony can get there!

API Authentication
    Create Session    auth    ${base_url}     verify=${True}
    ${headers}=     Create Dictionary    Content-Type=application/json
    ${data}=    Create Dictionary    username=${ApiValidUserEmail}    password=${ApiValidUserPassword}
    ${response}=    POST On Session    auth    ${auth_url}     json=${data}    headers=${headers}
    ${json}=    Set Variable    ${response.json()}
    Log    Resposta JSON: ${json}
    ${accessToken}=    Get Value From Json    ${json}    $.data..accessToken
    ${AaccessToken}       Set Variable       ${accessToken[0]}
    Log    The Access Token is: ${accessToken[0]}

ExampleArguments
    [Arguments]      ${user}              ${pass}
    Wait Until Element Is Visible         ${UserNameTxt}  
    Input Text       ${UserNameTxt}        ${user}  
    Input Text       ${PasswordTxt}        ${pass}
    Click button     ${LoginBtn}

