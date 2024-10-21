package com.ProyectoGT.CodeByte.Entity.Operational;

import java.time.LocalDateTime;

import com.ProyectoGT.CodeByte.Entity.Base;
import com.ProyectoGT.CodeByte.Entity.Security.User;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "booking")
public class Booking extends Base{

	@Column(name = "travel_date",nullable = false)
	private LocalDateTime travelDate;
	
	@Column(name = "destination",nullable = false, length = 150)
	private String destination;
	
	@ManyToOne
	@JoinColumn(name="User_id", nullable = false, unique=true)
	private User usearId;
	
	@ManyToOne
	@JoinColumn(name="travel_packages_id", nullable = false, unique=true)
	private TravelPackages travelPackagesId;
	
	@ManyToOne
	@JoinColumn(name = "booking_seats", nullable = false, unique = true)
	private BookingSeats bookingSeats;

	public LocalDateTime getTravelDate() {
		return travelDate;
	}

	public void setTravelDate(LocalDateTime travelDate) {
		this.travelDate = travelDate;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public User getUsearId() {
		return usearId;
	}

	public void setUsearId(User usearId) {
		this.usearId = usearId;
	}

	public TravelPackages getTravelPackagesId() {
		return travelPackagesId;
	}

	public void setTravelPackagesId(TravelPackages travelPackagesId) {
		this.travelPackagesId = travelPackagesId;
	}

	public BookingSeats getBookingSeats() {
		return bookingSeats;
	}

	public void setBookingSeats(BookingSeats bookingSeats) {
		this.bookingSeats = bookingSeats;
	}
	
	
	
}
