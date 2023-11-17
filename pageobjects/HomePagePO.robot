*** Settings ***
Documentation       Home Page - Page Objects
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime
Resource            ../pageobjects/CheckoutPagePO.robot
Resource            ../pageobjects/CartPagePO.robot
*** Variables ***
${SwagLabsLbl}              //div[@id='header_container']/div/div[2]/div
${ProducsSwagLabsLbl}       css:.title
${fristProductAddBtn}       xpath=//div[2]/button
${cartItemLbl}              //div[@id='shopping_cart_container']/a/span
${cartBtn}                  //div[3]/a

${ProductNameLbl}           //a[@id='item_4_title_link']/div

*** Keywords ***
Select First Product
    Wait Until Element Is Visible       ${fristProductAddBtn}     
    Click button                        ${fristProductAddBtn}

Validate if Cart Icon updates the amount after adding a product to the cart
    ${cart} =                     Get Text        ${cartItemLbl}
    IF    "${cart}" != "1"
    Run Keyword And Expect Error    FAIL    Text should be equal "1" but was "${cart}"
    END    
    ${ProductName} =                     Get Text        ${ProductNameLbl}

Go To Cart Btn
    Wait Until Element Is Visible        ${cartBtn}
    Click Element                        ${cartBtn}
