package com.demo.mail;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import com.demo.mail.Mail;
import com.demo.mail.MailService;
import com.demo.mail.MailConfig;

public class App {
	
	public static void main(String args[]) {
		 
        Mail mail = new Mail();
        mail.setMailFrom("from@gmail.com");
        mail.setMailTo("to@gmail.com");
        mail.setMailSubject("This is Email test.");
        mail.setMailContent("Learn how to send email using Spring.");
 
        AbstractApplicationContext context = new AnnotationConfigApplicationContext(MailConfig.class);
        MailService mailService = (MailService) context.getBean("mailService");
        mailService.sendEmail(mail);
        context.close();
    }

}
