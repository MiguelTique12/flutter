package com.ProyectoGT.CodeByte.Entity.Parametrizacion;

import com.ProyectoGT.CodeByte.Entity.Base;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "conpany")
public class Company extends Base{

	@Column(name="name", nullable = false , length = 50)
	private String name;
	
	@Column(name="address", nullable = false , length = 150)
	private String address;
	
	@Column(name="nit", nullable = false , length = 150)
	private int nit;
	
	@Column(name="phone_number", nullable = false , length = 50)
	private int phoneNumber;
	
	@Column(name="email", nullable = false , length = 150)
	private String email;
	
	@Column(name="manager_name", nullable = false , length = 150)
	private String managerName;
	
	@Column(name="phone_number_manager", nullable = false , length = 50)
	private int phoneNumberManager;
	
	@Column(name="email_manager", nullable = false , length = 150)
	private String emailManager;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getNit() {
		return nit;
	}

	public void setNit(int nit) {
		this.nit = nit;
	}

	public int getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public int getPhoneNumberManager() {
		return phoneNumberManager;
	}

	public void setPhoneNumberManager(int phoneNumberManager) {
		this.phoneNumberManager = phoneNumberManager;
	}

	public String getEmailManager() {
		return emailManager;
	}

	public void setEmailManager(String emailManager) {
		this.emailManager = emailManager;
	}
	
	
}
