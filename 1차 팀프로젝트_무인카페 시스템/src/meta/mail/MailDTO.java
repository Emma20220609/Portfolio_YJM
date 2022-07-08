package meta.mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
   

public class MailDTO {
	
	public	String	uuid ="";
	
	public void MailSend(String email) {
		
		uuid = UUID.randomUUID().toString().replaceAll("-", "");	// -를 제거해 주었다.
		uuid = uuid.substring(0, 10);										//uuid를 앞에서부터 10자리 잘라줌.
		
		System.out.println(uuid);
		
		
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		MailAuth auth = new MailAuth();
		
		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage msg = new MimeMessage(session);
		
		try
		{
			msg.setSentDate(new Date());

			msg.setFrom(new InternetAddress("metebucks.ad@gmail.com","매니저"));	//보내는사람 이메일, 이름
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);            
			msg.setSubject("임시비밀번호입니다.", "UTF-8");							//제목작성란
			msg.setText("임시비밀번호는 " + uuid + " 입니다 " + "\n" + 
						"http://localhost:8880/metabucks/HOME/login/login.jsp " + "\n" +
						"로그인 하셔서 재설정 하시기 바랍니다." , "UTF-8");				//내용작성란
		
			Transport.send(msg);
		}catch(AddressException ae)
		{	
			System.out.println("AddressException : " + ae.getMessage());	
		}catch(MessagingException me)
		{	
			System.out.println("MessagingException : " + me.getMessage());
		}catch(UnsupportedEncodingException e)
		{
			System.out.println("UnsupportedEncodingException : " + e.getMessage());			
		}
	}
}


