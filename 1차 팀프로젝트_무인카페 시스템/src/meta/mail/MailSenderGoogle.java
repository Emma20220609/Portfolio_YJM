package meta.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSenderGoogle 
{
	private String MailServer;
	private int    MailPort;
	
	public MailSenderGoogle()
	{
		MailServer = "smtp.google.com";
		MailPort   = 587;
	}
	
	public void setMailServer(String mailServer) 
	{
		MailServer = mailServer;
	}

	public void setMailPort(int mailPort) 
	{
		MailPort = mailPort;
	}

	public boolean MailSendG(String from,String to,String id,String pw,String title,String body)
	{
		try
		{  
			Properties clsProp = System.getProperties();
			
			// 메일 서버 주소
			clsProp.put( "mail.smtp.host", MailServer );
			
			// 메일 서버 포트 번호
			clsProp.put( "mail.smtp.port", MailPort );			
			
			// 인증이 필요하면 아래와 같이 설정한다.
			clsProp.put("mail.smtp.auth", "true"); 
			clsProp.put("mail.smtp.ssl.enable", "true"); 
			clsProp.put("mail.smtp.ssl.trust", MailServer);			
			
			Session clsSession = Session.getInstance( clsProp, new Authenticator(){
					public PasswordAuthentication getPasswordAuthentication()
					{
						// 인증 아이디/비밀번호를 저장한다.
						return new PasswordAuthentication( id, pw );
					}
				} );
			
			Message clsMessage = new MimeMessage( clsSession );
			
			// 발신자 이메일 주소를 설정한다.
			clsMessage.setFrom( new InternetAddress( from ) );
			
			// 수신자 이메일 주소를 설정한다.
			clsMessage.addRecipient( Message.RecipientType.TO, new InternetAddress( to ) );
						
			// 제목을 저장한다.
			clsMessage.setSubject( title );
			
			// 메일 내용을 저장한다.
			clsMessage.setContent( body , "text/plain;charset=utf8" );
						
			// 메일 전송
			Transport.send( clsMessage );
		}
		catch( Exception e )
		{
			e.printStackTrace();
			return false;
		}		
		return true;
	}
	
	public static void main(String[] args) 
	{
		MailSenderGoogle m = new MailSenderGoogle();

		String MailFrom   = "fromid@naver.com";
		String MailTo     = "toid@naver.com";
		String LoginID    = "userid";
		String LoginPW    = "userpw";
		String Title      = "This is mail title";
		String Body       = "This is mail contents.";
		
		m.MailSendG(MailFrom, MailTo,LoginID,LoginPW,Title,Body);	
	}

}
