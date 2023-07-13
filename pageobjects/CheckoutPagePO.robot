*** Settings ***
Documentation       Your Cart Page - Page Objects
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