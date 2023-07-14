*** Settings ***
Documentation       UI Environment URLs 
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
${Browser}          Chrome

${URL_Saucedemo_DEV}            https://www.saucedemoDev.com/            #Example URL - That URL doesn't exist
${URL_Saucedemo_QA}             https://www.saucedemo.com/               
${URL_Saucedemo_STAGE}          https://www.saucedemoProd.com/           #Example URL - That URL doesn't exist