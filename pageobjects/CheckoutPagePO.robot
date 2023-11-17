*** Settings ***
Documentation       Checkout Page - Page Objects
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
${CheckoutYourInfoLbl}      css:.title
${FirstNameTxt}             id=first-name
${LastNametxt}              id=last-name
${ZipPCTxt}                 id=postal-code
${ContinueBtn}              id=continue
${CancelBtn}                id=cancel

${ProductNameCheckout}     //a[@id='item_4_title_link']/div
${FinishCheckoutBtn}       id=finish

*** Keywords ***
Validate If Checkout Page is Loaded
    Wait Until Element Is Visible        ${CheckoutYourInfoLbl} 
    Element Text Should Be               ${CheckoutYourInfoLbl}         Checkout: Your Information

Fill Checkout Information    
    Input Text                           ${FirstNameTxt}                Username
    Input Text                           ${LastNametxt}                 UserSurname    
    Input Text                           ${ZipPCTxt}                    123456
    Click Element                        ${ContinueBtn}

Validate Checkout Overview Page
    Wait Until Element Is Visible        ${CheckoutYourInfoLbl}

Click in Finish Checkout
     Click Element                        ${FinishCheckoutBtn} 