*** Settings ***
Documentation       Keywords
Library             BuiltIn
Library             SeleniumLibrary
Library             OperatingSystem
Library             DateTime
Library             RequestsLibrary
Library             JSONLibrary
Library             String
Resource            ../settings/Environments.robot
Resource            ../pageobjects/LoginPagePO.robot
Resource            ../pageobjects/HomePagePO.robot
Resource            ../settings/UserAccess.robot
Resource            ../pageobjects/CartPagePO.robot
Resource            ../pageobjects/CheckoutPagePO.robot
Resource            ../pageobjects/CheckoutCompletedPagePO.robot

*** Variables ***
${random_number}    Random Integer    1    100


*** Keywords ***

Finish TC
    SeleniumLibrary.Execute JavaScript                  window.localStorage.clear()
    SeleniumLibrary.Close Browser

Verify Correct URL
	

Open Saucedemo URL
    #Create Webdriver    Chrome      executable_path=../settings/chromedriver.exe
    #Go To               ${URL_SauceDemo_QA}   
    Open Browser         ${URL_SauceDemo_QA}        ${Browser}
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


        
