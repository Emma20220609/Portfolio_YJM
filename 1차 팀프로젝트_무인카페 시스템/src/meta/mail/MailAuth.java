package meta.mail;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{

    PasswordAuthentication pa;

    public MailAuth() {
        String mail_id = "metabucks.ad@gmail.com";		//보내는 사람 메일 주소
        String mail_pw = "E2en_java_(team";				//비밀번호

        pa = new PasswordAuthentication(mail_id, mail_pw);
    }

    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}


