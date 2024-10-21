package com.ProyectoGT.CodeByte.Entity.Parametrizacion;

import com.ProyectoGT.CodeByte.Entity.Base;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "BusSeats")
public class BusSeats extends Base{

	@ManyToOne
	@JoinColumn(name="seats_id", nullable = false, unique=true)
	private Seats seatsId;
	
	@ManyToOne
	@JoinColumn(name="bus_id", nullable = false, unique=true)
	private Bus busId;

	public Seats getSeatsId() {
		return seatsId;
	}

	public void setSeatsId(Seats seatsId) {
		this.seatsId = seatsId;
	}

	public Bus getBusId() {
		return busId;
	}

	public void setBusId(Bus busId) {
		this.busId = busId;
	}
	
}
