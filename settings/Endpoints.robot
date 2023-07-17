*** Settings ***
Documentation       Endpoints
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
#URLs bellow does not exist. They are just examples
${base_url}                         https://standardQAURL.qa.example
${auth_url}                         /api/authentication-api/v3/authentication/userlog
${sendpin_url}                      /api/for-api/v3/authentication/send-pin
${validatepin_url}                  /api/for-api/v3/authentication/validate-pin
${createUser_url}                   /api/for-api/v3/createUser   
${deleteuser_url}                   /api/for-api/v3/deleteUser