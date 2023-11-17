*** Settings ***
Documentation       Executable file for UI Regression Testing
Resource            ../settings/UserAccess.robot
Resource            ../pageobjects/LoginPagePO.robot
Resource            ../pageobjects/HomePagePO.robot
Resource            ../pageobjects/CartPagePO.robot
Resource            ../pageobjects/CheckoutPagePO.robot
Resource            ../pageobjects/CheckoutCompletedPagePO.robot
Resource            ../pageobjects/BrowserResources.robot
Test Teardown       Finish TC
#Test Setup          Open Saucedemo URL

*** Variables ***

*** Comments ***

*** Test Cases ***
1.1.1 - Valid Login
    Valid Login

1.1.2 - Nonexistent Username
    Nonexistent Username

1.1.3 - Valid Username and Blank Password Textbox
    Valid Username and Blank Password in Textbox

1.1.4 - Valid User and Wrong Password
    Valid User and using Wrong Password

1.1.5 - Try to login with Lockedout User 
    Login with Lockedout User 

1.1.6 - Example running Headless
    Valid Login in Headless

1.1.7 - Example using Arguments - Blank Username
    Example Arguments: Blank Username

2.1.1 - Add product to Cart and finish with positive Purchase flow
    [Setup]                             Valid Login
    Select First Product
    #Validate if Cart Icon updates the amount after adding a product to the cart
    #Next 3 lines is to validate if the Cart Icon updates the amount after adding a product to the cart
    ${cart} =                     Get Text        ${cartItemLbl}
    IF    "${cart}" != "1"
    Run Keyword And Expect Error    FAIL    Text should be equal "1" but was "${cart}"
    END    
    ${ProductName} =                     Get Text        ${ProductNameLbl}
    
    Go To Cart Btn
    
    Validate If Cart Page is Loaded
    Click in Checkout button
    Validate If Checkout Page is Loaded
    Fill Checkout Information
    #Validate if the product inserted is the same as previous added to the cart
    ${ProductCheckoutName} =                     Get Text        ${ProductNameCheckout}
    IF    "${ProductName}" != "${ProductCheckoutName}"
    Run Keyword And Expect Error    FAIL    Text should be equal "${ProductName}" but was "${ProductCheckoutName}"
    END 
    Click in Finish Checkout     
    Validate Checkout Successfully


   


