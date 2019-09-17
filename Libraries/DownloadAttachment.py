import email
import imaplib
import os


class DownloadAttachment(object):
    def download_attachment(self, file_path):
        global mail, att_path, part
        detach_dir = file_path
        m = imaplib.IMAP4_SSL("imap.googlemail.com", 993)
        m.login('rpamercurialminds@gmail.com', 'Heytherealeesho123')
        m.select("INBOX")

        resp, items = m.search(None, '(SUBJECT "Add ViciDial Agents")')
        items = items[0].split()

        for emailid in items:
            resp, data = m.fetch(emailid, "(RFC822)")
            email_body = data[0][1]
            mail = email.message_from_string(email_body.decode())
            # ^This is where the error occurs
            # temp = m.store(emailid, '+FLAGS', '\\Seen')
            m.store(emailid, '+FLAGS', '\\Deleted')
            m.expunge()

            if mail.get_content_maintype() != 'multipart':
                continue

            # print "["+mail["From"]+"] :" + mail["Subject"]

        for part in mail.walk():
            if part.get_content_maintype() == 'multipart':
                continue
            if part.get('Content-Disposition') is None:
                # print ("email has no attachment file")
                # quit()
                continue

            filename = part.get_filename()
            att_path = os.path.join(detach_dir, filename)

        if not os.path.isfile(att_path):
            fp = open(att_path, 'wb')
            fp.write(part.get_payload(decode=True))
            fp.close()
        return file_path


# email_downlaod = DownloadAttachment()
# print((email_downlaod.download_attachment("E:/RobotFramework/BIMA-single")))
