*** Settings ***
Documentation       Keywords
Library             BuiltIn
Library             SeleniumLibrary
Library             OperatingSystem
Library             DateTime
Library             RequestsLibrary
Library             JSONLibrary
Library             String

*** Variables ***

*** Keywords ***

API Authentication
    Create Session    auth    ${base_url}     verify=${True}
    ${headers}=     Create Dictionary    Content-Type=application/json
    ${data}=    Create Dictionary    username=${ApiValidUserEmail}    password=${ApiValidUserPassword}
    ${response}=    POST On Session    auth    ${auth_url}     json=${data}    headers=${headers}
    ${json}=    Set Variable    ${response.json()}
    Log    Resposta JSON: ${json}
    ${accessToken}=    Get Value From Json    ${json}    $.data..accessToken
    ${AaccessToken}       Set Variable       ${accessToken[0]}
    Log    The Access Token is: ${accessToken[0]}


