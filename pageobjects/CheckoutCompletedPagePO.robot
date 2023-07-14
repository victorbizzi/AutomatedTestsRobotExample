*** Settings ***
Documentation       Checkout Completed Page - Page Objects
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime


*** Variables ***
${PageTitleCompleteLbl}             css:.title
${MainMessageLbl}           //h2
${CompleteMessageLbl}       css:.complete-text