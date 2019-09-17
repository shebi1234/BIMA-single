*** Settings ***
Documentation  In this agents will be addded on vicidial portal
Library  SeleniumLibrary
Library  robot/libraries/String.py
Library  ../Libraries/AgentID.py
Library  ../Libraries/Name.py
Library  ../Libraries/DownloadAttachment.py
Library  BuiltIn
Library  Collections

#Library  SeleniumLibrary
#Library  ExcelLibrary
#Library  robot/libraries/String.py
#Library  ../Libraries/AgentID.py
#Library  ../Libraries/Name.py
#Library  ../Libraries/DownloadAttachment.py
#Library  BuiltIn
#Library  Collections

*** Variables ***
${Browser}  Chrome
${password}  sms003
${URL2}  http://6666:Pak123@63.141.240.125/
${caller_id}  9878
${phone_type}  ccagent
${agentid}
${fullname}

*** Keywords ***
Vicidial
    # The code below includes the whole process of getting the values from excel file and creating agents in vicidial
    # This code below will get all the values of the ID and Name column of excel attachment
    open browser  ${URL2}  ${Browser}
    maximize browser window
    wait until page contains  Administration  1 min
    click element  //a[text()='Administration']
    log to console  printing values
    ${AgentID} =  agentid
    log to console  ${AgentID}
    ${AgentName} =  agentname
    log to console  ${AgentName}
    :FOR  ${agentid}  ${fullname}  IN ZIP  ${AgentID}  ${AgentName}
    \    log to console  \n ${fullname}
    \    log to console  \n ${agentid}

    # this is the whole step by step flow of adding agents in vicidial portal
    \    click element  //font[text()='Users']
    \    click element  //font[text()='Add A New User ']
    \    click element  //input[@name='user']
    \    input text  //input[@name='user']  ${agentid}
    \    click element  //input[@name='pass']
    \    input text  //input[@name='pass']  ${password}
    \    click element  //input[@name='full_name']
    \    input text  //input[@name='full_name']  ${fullname}
    \    click element  //select[@name='user_level']
    \    click element  //option[text()='outboundgroup - OutBound Groupt']
    \    click element  //input[@name='phone_login']
    \    input text  //input[@name='phone_login']  ${agentid}
    \    click element  //input[@name='phone_pass']
    \    input text  //input[@name='phone_pass']  ${password}
    \    click element  //input[@type='button' and @name='SUBMIT']
    \    wait until page contains  MODIFY A USERS RECORD: ${agentid}
    \    click element  //input[@type='submit' and @name='SUBMIT']
    \    click element  //font[text()=' Admin ']
    \    click element  //span[text()=' Phones ']
    \    click element  //font[text()=' Add A New Phone ']
    \    input text  //input[@name='extension']  ${agentid}
    \    input text  //input[@name='dialplan_number']  ${agentid}
    \    input text  //input[@name='voicemail_id']  ${agentid}
    \    input text  //input[@name='outbound_cid']  ${caller_id}
    \    click element  //select[@name='user_group']
    \    click element  //option[text()='outboundgroup - OutBound Groupt']
    \    input text  //input[@name='login']  ${agentid}
    \    input text  //input[@name='phone_type']  ${phone_type}
    \    input text  //input[@name='fullname']  ${fullname}
    \    click element  //input[@type='submit' and @name='submit']
    \    wait until page contains  HOME
    \    click element  //input[@type='submit' and @name='submit']
    click element  //font[text()='Logout']
    close browser
