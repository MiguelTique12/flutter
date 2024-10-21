package com.ProyectoGT.CodeByte.Entity.Operational;

import com.ProyectoGT.CodeByte.Entity.Base;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "tickt")
public class Ticket extends Base{

	
	@ManyToOne
	@JoinColumn(name="booking_id", nullable = false, unique=true)
	private Booking bookingId;

	public Booking getBookingId() {
		return bookingId;
	}

	public void setBookingId(Booking bookingId) {
		this.bookingId = bookingId;
	}
	
	
}
