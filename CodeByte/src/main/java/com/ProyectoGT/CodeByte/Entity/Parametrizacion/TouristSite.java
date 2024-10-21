package com.ProyectoGT.CodeByte.Entity.Parametrizacion;

import com.ProyectoGT.CodeByte.Entity.Base;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "tourisit_site")
public class TouristSite extends Base{

	@Column(name="nae", nullable = false , length = 50)
	private String name;
	
	@Column(name="location", nullable = false , length = 150)
	private String location;
	
	@Column(name="map", nullable = false , length = 150)
	private String map;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}
	
	
}
