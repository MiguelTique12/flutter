package com.ProyectoGT.CodeByte.Entity.Security;

import java.time.LocalDateTime;

import com.ProyectoGT.CodeByte.Entity.Base;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "person")
public class Person extends Base{

	@Column(name = "Names",nullable = true, length = 50)
	private String names;
	
	@Column(name = "last_name",nullable = true, length = 50)
	private String lastName;
	
	@Column(name = "document_type",nullable = true, length = 50)
	private String documentType;
	
	@Column(name = "document",nullable = true, length = 50)
	private String document;
	
	@Column(name = "document_photo",nullable = true, columnDefinition = "TEXT")
	private String documentPhoto;
	
	@Column(name = "birthdate",nullable = true, length = 50)
	private LocalDateTime birthdate;
	
	@Column(name = "email",nullable = true, length = 100)
	private String email;
	
	@Column(name = "gender",nullable = true, length = 50)
	private boolean gender;

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDocumentType() {
		return documentType;
	}

	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}

	public String getDocument() {
		return document;
	}

	public void setDocument(String document) {
		this.document = document;
	}

	public String getDocumentPhoto() {
		return documentPhoto;
	}

	public void setDocumentPhoto(String documentPhoto) {
		this.documentPhoto = documentPhoto;
	}

	public LocalDateTime getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(LocalDateTime birthdate) {
		this.birthdate = birthdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}
	
	
}
