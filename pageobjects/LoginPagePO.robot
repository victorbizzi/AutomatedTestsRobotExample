*** Settings ***
Documentation       Login Page - Page Objects
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
${UserNameTxt}              id=user-name
${PasswordTxt}              id=password
${LoginBtn}                 id=login-button
${ErrorLoginMessage}        //h3 
${XIconUser}                css:.form_group:nth-child(1) path
${XIconPassword}            css:.form_group:nth-child(2) path