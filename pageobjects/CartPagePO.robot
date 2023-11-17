*** Settings ***
Documentation       Your Cart Page - Page Objects
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
${YourCartLbl}             //div[@id='header_container']/div[2]/span 
${CheckoutBtn}             id=checkout