*** Settings ***
Documentation       Browser Resouces
Library             BuiltIn
Library             SeleniumLibrary
Library             OperatingSystem
Library             DateTime
Library             RequestsLibrary
Library             JSONLibrary
Library             String

*** Variables ***
${random_number}                Random Integer    1    100
${Browser}                      Firefox
${URL_Saucedemo_QA}             https://www.saucedemo.com/               

*** Keywords ***
Finish TC
    SeleniumLibrary.Execute JavaScript                  window.localStorage.clear()
    SeleniumLibrary.Close Browser
	
Open Saucedemo URL
    #Create Webdriver    Chrome      executable_path=../settings/chromedriver.exe
    #Go To               ${URL_SauceDemo_QA}   
    Open Browser         ${URL_SauceDemo_QA}        ${Browser}
    #Open Browser    ${URL_Saucedemo_QA}    browser=${Browser}    #maximize_browser_window=True
    Maximize Browser Window

Go in Headless Chrome
    ${options}      Evaluate        sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Create Webdriver    Chrome    chrome_options=${options}
    Go To   ${URL_SauceDemo_QA}        
    Maximize Browser Window

Go in Headless Firefox
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Create Webdriver    Firefox    options=${options}
    Go To   ${URL_SauceDemo_QA}        
    Maximize Browser Window

