package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class SMTPAuthenticator extends Authenticator{
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		String mail_id = "yjmny2022@gmail.com";
		String mail_pw = "Myj819827!";

		return new PasswordAuthentication(mail_id,mail_pw);
	}
}

