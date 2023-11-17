*** Settings ***
Documentation       Your Cart Page - Page Objects
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime
Resource            ../pageobjects/HomePagePO.robot
Resource            ../pageobjects/CheckoutPagePO.robot

*** Variables ***
${YourCartLbl}             //div[@id='header_container']/div[2]/span 
${CheckoutBtn}             id=checkout

*** Keywords ***
Validate If Cart Page is Loaded
    Element Text Should Be               ${YourCartLbl}                 Your Cart

Click in Checkout button    
    Wait Until Element Is Visible        ${CheckoutBtn}
    Click Element                        ${CheckoutBtn}

Validate if the product inserted is the same as previous added to the cart
    ${ProductCheckoutName} =                     Get Text        ${ProductNameCheckout}
    IF    "${ProductName}" != "${ProductCheckoutName}"
    Run Keyword And Expect Error    FAIL    Text should be equal "${ProductName}" but was "${ProductCheckoutName}"
    END 
    #Click Element                        ${FinishCheckoutBtn}     
    