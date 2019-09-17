*** Settings ***
Documentation  This is the section of setting libraries and resources to run the main test case
Resource  ../Resources/ReadEmail.robot
Resource  ../Resources/AddingAgents.robot
Resource  ../Resources/MoveFile.robot

#Resource  ../Resources/ReadEmail.robot
#Resource  ../Resources/AddingAgents.robot
#Resource  ../Resources/MoveFile.robot
#Library  ../Libraries/AgentID.pys

*** Variables ***
${directory_1} =  record
${download_path} =  E:/RobotFramework/BIMA-single
${URL} =  http://104.196.47.93:3005/sendMessage
${Browser} =  Chrome


*** Tasks ***
Downloading File and Adding Agents
#   This line of code is used to downlaod the received file
    Downloading Attachment  ${download_path}
#   This line of code is used to add agents in vicidial portal
    Vicidial

*** Tasks ***
Moving File and Sending Message
#   This line of code is used to move the downloaded file once agents have been added
    Rename and Move Attachment  ${directory_1}
#   This line of code will send back a message to inform that a users has been added
    open browser  ${URL}  ${Browser}
    close browser



