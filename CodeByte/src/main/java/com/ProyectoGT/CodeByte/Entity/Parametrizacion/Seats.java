package com.ProyectoGT.CodeByte.Entity.Parametrizacion;

import com.ProyectoGT.CodeByte.Entity.Base;
import com.ProyectoGT.CodeByte.Entity.Security.Person;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "seats")
public class Seats extends Base{

	@Column(name="row", nullable = false , length = 5)
	private String row;
	
	@Column(name="number_of_seats", nullable = false , length = 5)
	private String numberOfSeats;
	
	@ManyToOne
	@JoinColumn(name = "person_id", nullable = false, unique = true)
	private Person personId;

	public String getRow() {
		return row;
	}

	public void setRow(String row) {
		this.row = row;
	}

	public String getNumberOfSeats() {
		return numberOfSeats;
	}

	public void setNumberOfSeats(String numberOfSeats) {
		this.numberOfSeats = numberOfSeats;
	}

	public Person getPersonId() {
		return personId;
	}

	public void setPersonId(Person personId) {
		this.personId = personId;
	}
	
	
}
