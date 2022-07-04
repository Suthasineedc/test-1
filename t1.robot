*** Settings ***
Library     Browser

*** Variable ***
${url}  https://www.google.com/
${SearchBox}  xpath=//input[@name="q"]
${SearchButton}  //*[@class="FPdoLc lJ9FBc"]//*[@name="btnK"]
${3thLink}  //*[@class="g Ww4FFb tF2Cxc"][2]//*[@class="LC20lb MBeuO DKV0Md"]   
${4thLink}  //*[@class="g Ww4FFb tF2Cxc"][3]//*[@class="LC20lb MBeuO DKV0Md"] 
${5thLink}  //*[@class="g Ww4FFb tF2Cxc"][4]//*[@class="LC20lb MBeuO DKV0Md"] 
${sometext}  robotframework

*** Keywords ***
Open Web Browser Google 
    Open Browser  ${url}  

Input text Robot Framwork on Search Box
    Fill Text  ${SearchBox}   robotframework


Enter to Search robotframework 
    Click  ${SearchButton}
    Sleep  3s

Click Link
    [Arguments]  ${somepath}
    Click  ${somepath}
    Sleep  5s

Get Sometext
    ${text}  Get text  ${sometext}
    Log To Console  ${weberrortext}
    Should Be Equal  ${weberrortext}  ${sometext}




*** Test Case ***
Search_1_Open_and_Search_RobotFramwork_in_Google
    Open Web Browser Google
    Input text Robot Framwork on Search Box 
    Enter to Search robotframework 

Search_2_Search_RobotFramwork_in_Google_then_Click_3th_Link
    Open Web Browser Google
    Input text Robot Framwork on Search Box 
    Enter to Search robotframework
    Click 3th Link 

Search_3_Search_RobotFramwork_in_Google_then_Click_3th_4th_5th_Link
    Open Web Browser Google
    Input text Robot Framwork on Search Box 
    Enter to Search robotframework
    Click Link  ${3thLink} 
    Go Back
    Sleep  5s
    Click Link  ${4thLink}
    Go Back
    Sleep  5s
    Click Link  ${5thLink}
    Go Back
    Sleep  5s

