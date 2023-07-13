*** Settings ***
Documentation       UI Environment URLs 
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
${Browser}          Chrome


${URL_Saucedemo_DEV}            #Example URL
${URL_Saucedemo_QA}             https://www.saucedemo.com/            #Example URL
${URL_Saucedemo_STAGE}          #Example URL