
*** Settings ***
Documentation       User access data 
Library             BuiltIn
Library             SeleniumLibrary
Library             DateTime

*** Variables ***
${standarduser}             standard_user
${lockedoutuser}            locked_out_user    
${problemuser}              problem_user    
${performanceglitchuser}    performance_glitch_user
${password}                 secret_sauce

${ApiValidUserEmail}        test@companytest.com
${ApiValidUserPassword}     testpassword