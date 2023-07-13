*** Settings ***
Documentation       Endpoints
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
${base_url}                         https://standardQAURL.qa.example.service
${auth_url}                         /api/authentication-api/v3/authentication/userlog
${send-pin_url}                     /api/authentication-api/v3/authentication/send-pin
${validate-pin}                     /api/authentication-api/v3/authentication/validate-pin
