package com.ProyectoGT.CodeByte.Entity.Parametrizacion;

import com.ProyectoGT.CodeByte.Entity.Base;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "bus")
public class Bus extends Base{

	@Column(name="placa", nullable = false , length = 10)
	private String placa;
	
	@Column(name="maximum_seats", nullable = false , length = 2)
	private int maximumSeats;
	
	@ManyToOne
	@JoinColumn(name = "company_id", nullable = false, unique = true)
	private Company companyId;

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public int getMaximumSeats() {
		return maximumSeats;
	}

	public void setMaximumSeats(int maximumSeats) {
		this.maximumSeats = maximumSeats;
	}

	public Company getCompanyIdd() {
		return companyId;
	}

	public void setCompanyIdd(Company companyIdd) {
		this.companyId = companyIdd;
	}
	
	
}
