package com.ProyectoGT.CodeByte.Entity.Operational;

import com.ProyectoGT.CodeByte.Entity.Base;
import com.ProyectoGT.CodeByte.Entity.Parametrizacion.Seats;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "bookings_seats")
public class BookingSeats extends Base{
	
	@ManyToOne
	@JoinColumn(name="booking_id", nullable = false, unique=true)
	private Booking bookingId;
	
	@ManyToOne
	@JoinColumn(name="seats_id", nullable = false, unique=true)
	private Seats seats_id;

	public Booking getBookingId() {
		return bookingId;
	}

	public void setBookingId(Booking bookingId) {
		this.bookingId = bookingId;
	}

	public Seats getSeats_id() {
		return seats_id;
	}

	public void setSeats_id(Seats seats_id) {
		this.seats_id = seats_id;
	}
	

}
