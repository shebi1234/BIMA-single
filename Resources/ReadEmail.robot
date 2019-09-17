*** Settings ***
Documentation  Email will be read and attachment will be downloaded
Library  ImapLibrary
Library  ../Libraries/DownloadAttachment.py

#Library  ImapLibrary
#Library  ../Libraries/DownloadAttachment.py

*** Variables ***
${sheet_name}  Sheet1
${format} =  xlsx
${base_filename} =  Sheet1
${download_path} =  E:/RobotFramework/BIMA-single

*** Keywords ***
Downloading Attachment
    # The code below will read the email and download the attachment with in that email to a specified path
    [Arguments]  ${ExceFile}
    ${read_email_file} =  download_attachment  ${download_path}
    log to console  ${read_email_file}