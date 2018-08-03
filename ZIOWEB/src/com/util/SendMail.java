package com.util;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;

public class SendMail {
	private Logger log = Logger.getLogger(this.getClass());

	public SendMail(String to, String subject, String content) {

		SMTPAuthenticator smtp = new SMTPAuthenticator(); // 사용자 인증
		// SMTP 서버 정보 저장
		Properties p = new Properties();
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		try {
			Session ses = Session.getInstance(p, smtp);
			ses.setDebug(false); // true = 콘솔에 로그 출력, false = 로그 생략
			MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
			msg.setSubject(subject); // 제목
			Address fromAddr = new InternetAddress("<CST>dnfvm679@gmail.com");
			msg.setFrom(fromAddr); // 보내는 사람
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
			msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
			msg.setHeader("content-Type", "text/html");

			Transport.send(msg); // 전송
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

class SMTPAuthenticator extends Authenticator {
	String id = "dnfvm679@gmail.com"; // 구글 ID
	String pw = "koahbnhalhyzohha"; // 앱 비밀번호

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(id, pw);
	}
}
