*** Settings ***
Documentation       Checkout Completed Page - Page Objects
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
${PageTitleCompleteLbl}             css:.title
${MainMessageLbl}           //h2
${CompleteMessageLbl}       css:.complete-text

***Keywords***
Validate Checkout Successfully
    Wait Until Element Is Visible       ${PageTitleCompleteLbl}
    Element Text Should Be              ${PageTitleCompleteLbl}          Checkout: Complete!   
    Element Text Should Be              ${MainMessageLbl}        Thank you for your order!
    Element Text Should Be              ${CompleteMessageLbl}    Your order has been dispatched, and will arrive just as fast as the pony can get there!