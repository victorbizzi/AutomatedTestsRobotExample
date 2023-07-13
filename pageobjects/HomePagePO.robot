*** Settings ***
Documentation       Home Page - Page Objects
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
${SwagLabsLbl}              //div[@id='header_container']/div/div[2]/div
${ProducsSwagLabsLbl}       css:.title
${fristProductAddBtn}       xpath=//div[2]/button
${cartItemLbl}              //div[@id='shopping_cart_container']/a/span
${cartBtn}                  //div[3]/a

${ProductNameLbl}           //a[@id='item_4_title_link']/div