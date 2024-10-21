package com.ProyectoGT.CodeByte.Controller.Email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

public class EmailConfimation {

	@Autowired
	private JavaMailSender javaMailSender;
	
	@GetMapping("/basic_Email")
	public String enviarCorreoBasico() {
		try {
			String destinatario="CodeByteTravel@gmail.com";
			String asunto="Correo prueba básico 1";
			String cuerpo="correo prueba 1";
			        
			var retorno=enviarCorreo(destinatario,asunto,cuerpo);
			if(retorno) {
				return "se envió correctamente";
			}else {
				return "No se pudo envíar";
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			return "Erro al envíar "+e.getMessage();
		}
	}
	
	@GetMapping("/send_Advanced_Email")
	public String enviarCorreoAvanzado() {
		try {
			String destinatario="cjsarasty@gmail.com";
			String asunto="Autenvificacion de cuenta";
			String cuerpo=""
				    +"<h1>Bienvenido a GoldenTravel, Tu plafaforma de viajes nueva</h1>"
			        +"<p>Cordial saludo este correo electrónico es para notificar su inicio de cesion a nuesta plataforma de viajes"
			        +"</p>"
			        +"<h5>Datos</h5>"
			        +"<ul>"
			        +"  <li>Usuario: prueba@email.com</li>"
			        +"  <li>Contraseña: fX802QL</li>"
			        +"</ul>"
			        +"<p>"
			        +"  Puede ingresar a nuestra plataforma usando el siguiente enlace <a href='http://localhost:8080/login'>"
			        +"  http://localhost:8080/login</a>"
			        +"</p>";
			        
			var retorno=enviarCorreo(destinatario,asunto,cuerpo);
			if(retorno) {
				return "se envió correctamente";
			}else {
				return "No se pudo envíar";
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			return "Erro al envíar "+e.getMessage();
		}
	}
	
	public boolean enviarCorreo(String destinatario,String asunto,String cuerpo) throws MessagingException {
		try {
			MimeMessage message=javaMailSender.createMimeMessage();
			MimeMessageHelper helper=new MimeMessageHelper(message,true);
			
			helper.setTo(destinatario);
			helper.setSubject(asunto);
			helper.setText(cuerpo,true);
			
			javaMailSender.send(message);
			return true;
		}catch (Exception e) {

			return false;
		}
		
	}
}
