package com.ProyectoGT.CodeByte.Entity.Operational;

import com.ProyectoGT.CodeByte.Entity.Base;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "sales")
public class Sales extends Base {

	@Column(name = "travel_value", nullable = false, length = 50)
	private String travelValue;
	
	@Column(name = "discount", nullable = false)
	private Boolean discount;
	
	@Column(name = "discount_value", nullable = false, length = 20)
	private float dicountValue;
	
	@ManyToOne
	@JoinColumn(name = "booking_id", nullable = false, unique = true)
	private Booking bookingId;

	public String getTravelValue() {
		return travelValue;
	}

	public void setTravelValue(String travelValue) {
		this.travelValue = travelValue;
	}

	public Boolean getDiscount() {
		return discount;
	}

	public void setDiscount(Boolean discount) {
		this.discount = discount;
	}

	public float getDicountValue() {
		return dicountValue;
	}

	public void setDicountValue(float dicountValue) {
		this.dicountValue = dicountValue;
	}

	public Booking getBookingId() {
		return bookingId;
	}

	public void setBookingId(Booking bookingId) {
		this.bookingId = bookingId;
	}
	
	
}
