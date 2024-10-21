package com.ProyectoGT.CodeByte.Entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;

@MappedSuperclass
public class Base {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "created_at", nullable = false)
	private LocalDateTime createdAt;
	
	@Column(name = "updated_at", nullable = true)
	private LocalDateTime updtatedAt;
	
	@Column(name = "deleated_at", nullable = true)
	private LocalDateTime deletedAt;
	
	@Column(name = "status", nullable = false)
	private Boolean status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdtatedAt() {
		return updtatedAt;
	}

	public void setUpdtatedAt(LocalDateTime updtatedAt) {
		this.updtatedAt = updtatedAt;
	}

	public LocalDateTime getDeleatedAt() {
		return deletedAt;
	}

	public void setDeleatedAt(LocalDateTime deleatedAt) {
		this.deletedAt = deleatedAt;
	}
	
	 @PrePersist
	    public void prePersist() {
	        this.createdAt = LocalDateTime.now();
	        this.updtatedAt = LocalDateTime.now();
	        this.status = true; // Establecer el status como verdadero al crear
	    }

	    @PreUpdate
	    public void preUpdate() {
	        this.updtatedAt = LocalDateTime.now();
	        // Puedes ajustar el status aquí si es necesario, o dejarlo como está
	    }
}
