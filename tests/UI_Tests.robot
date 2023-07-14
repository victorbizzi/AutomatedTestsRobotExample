*** Settings ***
Documentation       Executable file for Regression Testing
Library             BuiltIn
Library             SeleniumLibrary
Library             OperatingSystem
Library             DateTime
Library             RequestsLibrary
Library             JSONLibrary
Library             String
Library             PlaywrightLibrary
Resource            ../settings/UserAccess.robot
Resource            ../pageobjects/LoginPagePO.robot
Resource            ../settings/Environments.robot
Resource            ../settings/Keywords.robot
Resource            ../pageobjects/HomePagePO.robot
Resource            ../settings/UserAccess.robot
Resource            ../pageobjects/CartPagePO.robot
Resource            ../pageobjects/CheckoutPagePO.robot
Resource            ../pageobjects/CheckoutCompletedPagePO.robot

*** Variables ***


*** Test Cases ***
1.1.1 - Valid Login
    Open Saucedemo URL
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          ${standarduser}
    Input Text                          ${PasswordTxt}          ${password}
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${SwagLabsLbl}  
    Element Text Should Be              ${SwagLabsLbl}          Swag Labs
    Element Text Should Be              ${ProducsSwagLabsLbl}          Products
    Finish TC

1.1.2 - Nonexistent Username
    Open Saucedemo URL
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          IDontExist
    Input Text                          ${PasswordTxt}          ${password}
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${ErrorLoginMessage}  
    Element Text Should Be              ${ErrorLoginMessage}          Epic sadface: Username and password do not match any user in this service
    Element Should Be Visible           ${XIconUser}
    Element Should Be Visible           ${XIconPassword}
    Finish TC

1.1.3 - Valid Username and Blank Password Textbox
    Open Saucedemo URL
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          IDontExist
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${ErrorLoginMessage}  
    Element Text Should Be              ${ErrorLoginMessage}          Epic sadface: Password is required
    Element Should Be Visible           ${XIconUser}
    Element Should Be Visible           ${XIconPassword}
    Finish TC

1.1.4 - Valid User and Wrong Password
    Open Saucedemo URL
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          ${standarduser}
    Input Text                          ${PasswordTxt}          WrongPassword
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${ErrorLoginMessage}  
    Element Text Should Be              ${ErrorLoginMessage}          Epic sadface: Username and password do not match any user in this service
    Element Should Be Visible           ${XIconUser}
    Element Should Be Visible           ${XIconPassword}
    Finish TC

1.1.5 - Try to login with Lockedout User 
    Open Saucedemo URL
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          ${lockedoutuser}
    Input Text                          ${PasswordTxt}          ${password}
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${ErrorLoginMessage}  
    Element Text Should Be              ${ErrorLoginMessage}          Epic sadface: Sorry, this user has been locked out.
    Element Should Be Visible           ${XIconUser}
    Element Should Be Visible           ${XIconPassword}
    Finish TC

1.1.6 - Example running Headless
    Go in Headless
    Maximize Browser Window
    Wait Until Element Is Visible       ${UserNameTxt}
    Input Text                          ${UserNameTxt}          ${standarduser}
    Input Text                          ${PasswordTxt}          ${password}
    Click button                        ${LoginBtn}
    Wait Until Element Is Visible       ${SwagLabsLbl}  
    Element Text Should Be              ${SwagLabsLbl}          Swag Labs
    Element Text Should Be              ${ProducsSwagLabsLbl}          Products
    Finish TC

2.1.1 - Add product to Cart and finish with positive Purchase flow
    Valid Login
    Wait Until Element Is Visible       ${fristProductAddBtn}     
    Click button                        ${fristProductAddBtn}
    #Next 3 lines is to validate if the Cart Icon updates the amount after adding a product to the cart
    ${cart} =                     Get Text        ${cartItemLbl}
    IF    "${cart}" != "1"
    Run Keyword And Expect Error    FAIL    Text should be equal "1" but was "${cart}"
    END    
    ${ProductName} =                     Get Text        ${ProductNameLbl}
    Click Element                        ${cartBtn}
    Element Text Should Be               ${YourCartLbl}                 Your Cart
    Click Element                        ${CheckoutBtn}
    Wait Until Element Is Visible        ${CheckoutYourInfoLbl} 
    Element Text Should Be               ${CheckoutYourInfoLbl}         Checkout: Your Information
    Input Text                           ${FirstNameTxt}                Username
    Input Text                           ${LastNametxt}                 UserSurname    
    Input Text                           ${ZipPCTxt}                    123456
    Click Element                        ${ContinueBtn}        
    Wait Until Element Is Visible        ${CheckoutYourInfoLbl}
    ${ProductCheckoutName} =                     Get Text        ${ProductNameCheckout}
    IF    "${ProductName}" != "${ProductCheckoutName}"
    Run Keyword And Expect Error    FAIL    Text should be equal "${ProductName}" but was "${ProductCheckoutName}"
    END 
    Click Element                        ${FinishCheckoutBtn}     
    Validate Checkout Successfully
    Finish TC




   


