package com.ef.video.util;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class MailUtil {
          public static void sendemail(String to,String text,String serial)
          {
        	  Properties props = new Properties();
      		
     		 // 开启debug调试
     		 props.setProperty("mail.debug", "true");
     		 // 发送服务器需要身份验证
     		 props.setProperty("mail.smtp.auth", "true");
     		 // 设置邮件服务器主机名
     		 props.setProperty("mail.host", "smtp.163.com");
     		 // 发送邮件协议名称
     		 props.setProperty("mail.transport.protocol", "smtp");
     		 try {
     			MailSSLSocketFactory sf = new MailSSLSocketFactory();
     			sf.setTrustAllHosts(true);
     			props.put("mail.smtp.ssl.enable", "true");
     			props.put("mail.smtp.ssl.socketFactory", sf);
     			Session session = Session.getInstance(props);
     			Message msg = new MimeMessage(session);
     			msg.setSubject(text);
     			StringBuilder builder = new StringBuilder();
     			String ps=""+Math.random();
     			String validator=MD5Util.encodeByMD5(ps) ;
     			if(text.equals("注册成功"))
     			builder.append("hello git");
     			else{
     			//	builder.append("http://www.lxwgsy.top:8080/video/user/validator.do?serial=");

     				builder.append("http://localhost:8080/video/user/validator.do?serial=");
     				builder.append(serial);
     			}
     			msg.setText(builder.toString());
     			msg.setFrom(new InternetAddress("lxw1314Snow@163.com"));
     			Transport transport = session.getTransport();
     			transport.connect("smtp.163.com", "lxw1314Snow@163.com", "lxw012");
     			transport.sendMessage(msg, new Address[] { new InternetAddress(to)});
     			transport.close();
     		} catch (AddressException e) {
     			// TODO Auto-generated catch block
     			e.printStackTrace();
     		} catch (NoSuchProviderException e) {
     			// TODO Auto-generated catch block
     			e.printStackTrace();
     		} catch (GeneralSecurityException e) {
     			// TODO Auto-generated catch block
     			e.printStackTrace();
     		} catch (MessagingException e) {
     			// TODO Auto-generated catch block
     			e.printStackTrace();
     		}
     }
}
