package com.ProyectoGT.CodeByte.Entity.Security;

import com.ProyectoGT.CodeByte.Entity.Base;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "payment_method")
public class PaymentMethod extends Base{

	@Column(name = "name",nullable = false, length = 50)
	private String name;
	
	@Column(name = "description",nullable = false, length = 150)
	private String description;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
