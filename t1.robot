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
${titanic}  //span[@class="yKMVIe"]

*** Keywords ***
Open Web Browser Google 
    Open Browser  ${url}  

Input text 
    [Arguments]  ${sometext}
    Fill Text  ${SearchBox}  ${sometext}

Click to Search
    Click  ${SearchButton}
    Sleep  3s

Click Link
    [Arguments]  ${somepath}
    Click  ${somepath}
    Sleep  5s

Verify Search Success
    [Arguments]   ${textsuccess}  ${sometext}
    ${text}  Get text  ${textsuccess}
    Log To Console  ${text}
    Should Be Equal  ${text}  ${sometext}

Verify Click Success
    [Arguments]  ${linksuccess}  ${linktext}
    ${text}  Get text  ${linksuccess}
    Log To Console  ${text}
    Should Be Equal  ${text}  ${linktext}


Input text Robot Framwork Thai language
    Fill Text  ${SearchBox}  โรบอท เฟรมเวิร์ค 



*** Test Case ***
Search_1_Search_RobotFramwork_in_Google
    Open Web Browser Google
    Input text  Robot Framework 
    Click to Search 
    Verify Search Success   ${searchsuccess}  ${searchtext}  

Search_2_Search_RobotFramwork_in_Google_then_Click_3th_Link
    Open Web Browser Google
    Input text  Robot Framework  
    Click to Search
    Verify Search Success   ${searchsuccess}  ${searchtext} 
    Click Link  ${3thLink}
    Verify Click Success   ${3thlinksuccess}   ${3thlinktext}  

Search_3_Search_RobotFramwork_in_Google_then_Click_3th_4th_5th_Link
    Open Web Browser Google
    Input text  Robot Framework  
    Click to Search
    Verify Search Success   ${searchsuccess}  ${searchtext} 
    Click Link  ${3thLink} 
    Verify Click Success   ${3thlinksuccess}   ${3thlinktext} 
    Go Back
    Click Link  ${4thLink}
    Verify Click Success   ${4thlinksuccess}   ${4thlinktext} 
    Go Back
    Click Link  ${5thLink}
    Verify Click Success   ${5thlinksuccess}   ${5thlinktext}

Search_4_Search_RobotFramwork_in_Google_then_Click_3th_5th_Link
    Open Web Browser Google
    Input text  Robot Framework  
    Click to Search
    Verify Search Success   ${searchsuccess}  ${searchtext} 
    Click Link  ${3thLink} 
    Verify Click Success   ${3thlinksuccess}   ${3thlinktext} 
    Go Back
    Click Link  ${5thLink}
    Verify Click Success   ${5thlinksuccess}   ${5thlinktext}  

Search_5_Search_RobotFramwork_2_language_in_Google
    Open Web Browser Google
    Input text  Robot Framework 
    Click to Search
    Verify Search Success   ${searchsuccess}  ${searchtext} 
    Go Back
    Input text  โรบอท เฟรมเวิร์ค
    Click to Search
    Verify Search Success   ${searchsuccess}  ${searchtext} 

Search_6_Search_Titanic_in_Google
    Open Web Browser Google
    Input text  Titanic 
    Click to Search
    Verify Search Success    ${titanic}   ไททานิค
    


