package com.example.demo.service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

@Service
public class NotificationService {

	private JavaMailSender javaMailSender;

	@Autowired
	public NotificationService(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	@Autowired
	private Configuration config;

	public void sendNotificationNew(ModelMap model, User user, List<passengers> listOfPassengers, flights flight) {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
					StandardCharsets.UTF_8.name());
			helper.addAttachment("logo.png", new ClassPathResource("logo.png"));
			
			model.put("flight", flight);
			model.put("user", user);
			model.put("listOfPassengers", listOfPassengers);
			
			
			Template t = config.getTemplate("email-template.ftl");
			String html = FreeMarkerTemplateUtils.processTemplateIntoString(t, model);

			helper.setTo(user.getEmail());
			helper.setText(html, true);
			helper.setSubject("Welcome to Flying Lion!");
			helper.setFrom("travellingwebsiteproject@gmail.com");

			javaMailSender.send(message);
		} catch (MessagingException | IOException | TemplateException e) {
			System.out.println(e.getMessage());
		}
	}

//	public void sendNotification(ModelMap model, User user, passengers passenger, flights flight) throws MailException {
//
//		MimeMessage message = javaMailSender.createMimeMessage();
//
//		try {
//			MimeMessageHelper helper = new MimeMessageHelper(message, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
//					StandardCharsets.UTF_8.name());
//			helper.addAttachment("logo.png", new ClassPathResource("logo.png"));
//			
//			model.put("flight", flight);
//			model.put("user", user);
//			model.put("passenger", passenger);
//			
//			
//			Template t = config.getTemplate("email-template.ftl");
//			String html = FreeMarkerTemplateUtils.processTemplateIntoString(t, model);
//
//			helper.setTo(user.getEmail());
//			helper.setText(html, true);
//			helper.setSubject("Welcome to Flying Lion!");
//			helper.setFrom("travellingwebsiteproject@gmail.com");
//
//			javaMailSender.send(message);
//		} catch (MessagingException | IOException | TemplateException e) {
//			System.out.println(e.getMessage());
//		}
//	}
}
