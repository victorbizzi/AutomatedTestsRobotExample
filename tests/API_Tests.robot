*** Settings ***
Documentation       Executable file for API Regression Testing
Library             BuiltIn
Library             SeleniumLibrary
Library             OperatingSystem
Library             DateTime
Library             RequestsLibrary
Library             JSONLibrary
Library             String
Resource            ../settings/UserAccess.robot
Resource            ../settings/Keywords.robot
Resource            ../settings/Endpoints.robot

*** Variables ***


*** Comments ***
The following Tests does not work. I created the Steps just to show how I develop the Automated API Tests
The context is: in UI, when the user insert the username and Password, the following screen has a "2 Authentication Factor"
 - The user can choose if he/she wants to receive the PIN via Email or SMS
 - After this step, the user needs to type the PIN in Textbox to validate
 - It is a real situation that I already faced. After talking with the Manager, we reached 2 options:
       1 - Insert a Standard PIN for TestAutomation user
       2 - Send the PIN in Response (by security it happens just in QA environment. In PROD when the user press F12 and go to Network -> Response, the PIN in returns "null" ["pin":null]) 
To make the Tests more real, we decided the seccond option

*** Test Cases ***
1.1.1 API - validate-pin - Valid PIN
    #Request to auth and get the Access Token
    Create Session    auth    ${base_url}     verify=${True}
    ${headers}=     Create Dictionary    Content-Type=application/json
    ${data}=    Create Dictionary    username=${ApiValidUserEmail}    password=${ApiValidUserPassword}
    ${response}=    POST On Session    auth    ${auth_url}     json=${data}    headers=${headers}
    ${json}=    Set Variable    ${response.json()}
    Log    Resposta JSON: ${json}
    ${accessToken}=    Get Value From Json    ${json}    $.data..accessToken
    ${AaccessToken}       Set Variable       ${accessToken[0]}
    Log    The Access Token is: ${accessToken[0]}
    #Request to send a PIN via SMS message and save it in a variable
    Create Session    auth    ${base_url}     verify=${True}
    ${newheaders}=    Create Dictionary    Content-Type=application/json            Authorization=Bearer ${AaccessToken}
    ${Ndata}=    Create Dictionary               factor=SMS
    Log    ${AaccessToken}
    ${Nresponse}=    POST On Session    auth    ${sendpin_url}    json=${Ndata}   headers=${newheaders}
    ${Njson}=    Set Variable    ${Nresponse.json()}
    Log    Resposta JSON: ${Njson}
    ${valueData}=    Get Value From Json    ${Njson}    $.data.pin
    ${VvalueData}       Set Variable       ${valueData[0]}
    Log     ${valueData[0]}
    #Request to validate the PIN sent previously via SMS message
    Create Session    auth    ${base_url}     verify=${True}
    ${Vheaders}=     Create Dictionary    Content-Type=application/json          Authorization=Bearer ${AaccessToken}
    ${Vdata}=    Create Dictionary    pin=${valueData[0]}   
    ${Vresponse}=    POST On Session    auth    ${validatepin_url}     json=${Vdata}    headers=${Vheaders}
    ${Rjson}=    Set Variable    ${response.json()}
    Log    Resposta JSON: ${Rjson}
    RequestsLibrary.Status Should Be    200

2.1.1 - Create New User and Drop
    Create Session    auth    ${base_url}     verify=${True}
    ${headers}=     Create Dictionary    Content-Type=application/json
    ${data}=    Create Dictionary    username=${ApiValidUserEmail}    password=${ApiValidUserPassword}
    ${response}=    POST On Session    auth    ${auth_url}     json=${data}    headers=${headers}
    ${json}=    Set Variable    ${response.json()}
    ${accessToken}=    Get Value From Json    ${json}    $.data..accessToken
    ${AaccessToken}       Set Variable       ${accessToken[0]}
    
    Create Session    auth    ${base_url}     verify=${True}
    ${TCheaders}=     Create Dictionary    Content-Type=application/json    Authorization=Bearer ${AaccessToken}
    ${TCdata}=    Evaluate     {'name': 'Auto Created', 'data': {'position': '2', 'contracttype': '1'}} 
    ${TCresponse}=    POST On Session    auth    ${createUser_url}     json=${TCdata}    headers=${TCheaders}
    ${TCjson}=    Set Variable    ${TCresponse.json()}
    ${iDCreated}=    Set Variable    ${TCjson['info']['id']}
    Log To Console    The user ID is: ${iDCreated}
    RequestsLibrary.Status Should Be    200

    ${TCDheaders}=    Create Dictionary    Content-Type=application/json         Authorization=Bearer ${AaccessToken}
    ${payload}=       Evaluate    [{'id': ${iDCreated}}]
    ${TCDresponse}=   Delete On Session    auth    ${deleteuser_url}    json=${payload}    headers=${TCDheaders}
    RequestsLibrary.Status Should Be    200