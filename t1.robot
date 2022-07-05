*** Settings ***
Library     Browser

*** Variable ***
${url}  https://www.google.com/
${SearchBox}  xpath=//input[@name="q"]
${SearchButton}  //*[@class="FPdoLc lJ9FBc"]//*[@name="btnK"]
${3thLink}  //*[@class="g Ww4FFb tF2Cxc"][2]//*[@class="LC20lb MBeuO DKV0Md"]   
${4thLink}  //*[@class="g Ww4FFb tF2Cxc"][3]//*[@class="LC20lb MBeuO DKV0Md"] 
${5thLink}  //*[@class="g Ww4FFb tF2Cxc"][4]//*[@class="LC20lb MBeuO DKV0Md"] 
${searchtext}  Robot Framework
${searchsuccess}  //*[@class="SzZmKb"]//*[@class="qrShPb kno-ecr-pt PZPZlf q8U8x"]
${3thlinktext}  Robot Framework คืออะไร?
${3thlinksuccess}  //*[@class="container"]//*[@class="blog-name detail"]
${4thlinktext}  ลองเขียน System Test ด้วย Robot Framework 
${4thlinksuccess}  //*[@class="ix iy iz ja jb"]//*[@id="3fd2"]
${5thlinktext}  มาแล้ว Robot Framework 5.0 
${5thlinksuccess}  //*[@id="content_box"]//*[@class="title"]

*** Keywords ***
Open Web Browser Google 
    Open Browser  ${url}  

Input text Robot Framwork on Search Box 
    Fill Text  ${SearchBox}  ${searchtext}

Click to Search Robotframework
    Click  ${SearchButton}
    Sleep  3s

Click Link
    [Arguments]  ${somepath}
    Click  ${somepath}
    Sleep  5s

Verify Search Success
    ${text}  Get text  ${searchsuccess}
    Log To Console  ${text}
    Should Be Equal  ${text}  ${searchtext}

Verify Click 3th Success 
    ${text}  Get text  ${3thlinksuccess}
    Log To Console  ${text}
    Should Be Equal  ${text}  ${3thlinktext}

Verify Click 4th Success
    ${text}  Get text  ${4thlinksuccess}
    Log To Console  ${text}
    Should Be Equal  ${text}  ${4thlinktext}

Verify Click 5th Success
    ${text}  Get text  ${5thlinksuccess}
    Log To Console  ${text}
    Should Be Equal  ${text}  ${5thlinktext}

Input text Robot Framwork Thai language
    Fill Text  ${SearchBox}  โรบอท เฟรมเวิร์ค 



*** Test Case ***
Search_1_Search_RobotFramwork_in_Google
    Open Web Browser Google
    Input text Robot Framwork on Search Box 
    Click to Search Robotframework 
    Verify Search Success

Search_2_Search_RobotFramwork_in_Google_then_Click_3th_Link
    Open Web Browser Google
    Input text Robot Framwork on Search Box 
    Click to Search Robotframework
    Verify Search Success
    Click Link  ${3thLink}
    Verify Click 3th Success   

Search_3_Search_RobotFramwork_in_Google_then_Click_3th_4th_5th_Link
    Open Web Browser Google
    Input text Robot Framwork on Search Box 
    Click to Search Robotframework
    Verify Search Success
    Click Link  ${3thLink} 
    Verify Click 3th Success 
    Go Back
    Click Link  ${4thLink}
    Verify Click 4th Success 
    Go Back
    Click Link  ${5thLink}
    Verify Click 5th Success 

Search_4_Search_RobotFramwork_2_language_in_Google
    Open Web Browser Google
    Input text Robot Framwork on Search Box 
    Click to Search Robotframework
    Verify Search Success
    Go Back
    Input text Robot Framwork Thai language
    Click to Search Robotframework 
    Verify Search Success
    Sleep  15s


