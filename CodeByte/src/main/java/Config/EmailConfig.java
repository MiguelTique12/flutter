package Config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class EmailConfig {

	@Bean
	public JavaMailSender javaMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("");
		mailSender.setPort(0);
		mailSender.setUsername("CodeByteTravel@gmail.com");
		mailSender.setPassword("Contraseñaxd");
		
		Properties properties = mailSender.getJavaMailProperties();
		properties.put("mail.smpt.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		
		return mailSender;
	}
}
