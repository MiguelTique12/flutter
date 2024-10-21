package com.ProyectoGT.CodeByte.Entity.Operational;

import java.time.LocalDateTime;

import com.ProyectoGT.CodeByte.Entity.Base;
import com.ProyectoGT.CodeByte.Entity.Parametrizacion.Bus;
import com.ProyectoGT.CodeByte.Entity.Parametrizacion.TouristSite;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "travel_packages")
public class TravelPackages extends Base{

	@Column(name = "price",nullable = false)
	private double precie;
	
	@Column(name = "description",nullable = false, length = 150)
	private String description;
	
	@Column(name = "departure_date",nullable = false)
	private LocalDateTime departureDate;
	
	@Column(name = "return_date",nullable = false)
	private LocalDateTime returnDate;
	
	@Column(name = "place_of_departure",nullable = false, length = 50)
	private String placeOfDeparture;
	
	@Column(name = "availability_number",nullable = false)
	private int availabilityNumber;
	
	@ManyToOne
	@JoinColumn(name="tourisit_site_id", nullable = false, unique=true)
	private TouristSite tourisitSiteId;
	
	@ManyToOne
	@JoinColumn(name="bus_id", nullable = false, unique=true)
	private Bus busId;

	public double getPrecie() {
		return precie;
	}

	public void setPrecie(double precie) {
		this.precie = precie;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(LocalDateTime departureDate) {
		this.departureDate = departureDate;
	}

	public LocalDateTime getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(LocalDateTime returnDate) {
		this.returnDate = returnDate;
	}

	public String getPlaceOfDeparture() {
		return placeOfDeparture;
	}

	public void setPlaceOfDeparture(String placeOfDeparture) {
		this.placeOfDeparture = placeOfDeparture;
	}

	public int getAvailabilityNumber() {
		return availabilityNumber;
	}

	public void setAvailabilityNumber(int availabilityNumber) {
		this.availabilityNumber = availabilityNumber;
	}

	public TouristSite getTouristSiteId() {
		return tourisitSiteId;
	}

	public void setTouristSiteId(TouristSite touristSiteId) {
		this.tourisitSiteId = touristSiteId;
	}

	public Bus getBusId() {
		return busId;
	}

	public void setBusId(Bus busId) {
		this.busId = busId;
	}
	
	
}
