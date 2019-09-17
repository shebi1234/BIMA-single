*** Settings ***
Documentation  The excel file of agents will move to another folder and then renamed
Library  OperatingSystem
Library  ArchiveLibrary
Library  DateTime


#Library  OperatingSystem
#Library  ArchiveLibrary
#Library  DateTime

*** Variables ***
${output_directory} =  Attachments
${directory_1} =  record
${filename} =  E:/RobotFramework/BIMA-single/agents.xlsx

*** Keywords ***
Rename and Move Attachment
    # In this keyword i will rename the excel file which i downloaded from email and move it to another folder
    [Arguments]  ${movefile}
    create directory  ${output_directory}
    should exist  ${output_directory}
    ${directory_path} =  join path  ${output_directory}  ${directory_1}
    create directory  ${directory_path}
    should exist  ${directory_path}
    #${timestamp} =  set modified time  ${filename}  UTC + 1h 2min 3s
    ${timestamp} =  get current date  result_format=%d-%m-%Y-%H-%M-%S
    ${renamefile} =  move file  ${filename}  addedagents-${timestamp}.xlsx
    move files  ${renamefile}  ${directory_path}