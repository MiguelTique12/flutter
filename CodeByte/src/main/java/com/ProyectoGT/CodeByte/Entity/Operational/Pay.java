package com.ProyectoGT.CodeByte.Entity.Operational;

import java.time.LocalDateTime;

import com.ProyectoGT.CodeByte.Entity.Base;
import com.ProyectoGT.CodeByte.Entity.Security.PaymentMethod;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "pay")
public class Pay  extends Base{

	@Column(name = "payment_date",nullable = false)
	private LocalDateTime paymentDate;
	
	@Column(name = "code",nullable = false, length=50)
	private String code;
	
	@Column(name = "description",nullable = false, length=150)
	private String description;
	
	@ManyToOne
	@JoinColumn(name="booking_id", nullable = false, unique=true)
	private Booking bookingId;
	
	@ManyToOne
	@JoinColumn(name="payment_method_id", nullable = false, unique=true)
	private PaymentMethod paymentMethodId;

	public LocalDateTime getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(LocalDateTime paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Booking getBookingId() {
		return bookingId;
	}

	public void setBookingId(Booking bookingId) {
		this.bookingId = bookingId;
	}

	public PaymentMethod getPaymentMethodId() {
		return paymentMethodId;
	}

	public void setPaymentMethodId(PaymentMethod paymentMethodId) {
		this.paymentMethodId = paymentMethodId;
	}
	
	
}
