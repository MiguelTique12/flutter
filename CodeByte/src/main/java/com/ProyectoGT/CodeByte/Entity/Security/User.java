package com.ProyectoGT.CodeByte.Entity.Security;

import com.ProyectoGT.CodeByte.Entity.Base;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "users")
public class User extends Base{

	@Column(name = "user_name", nullable = false, length = 50)
    private String userName;

    @Column(name = "contrasenia", nullable = true, length = 150)
    private String contrasenia;

    @Column(name = "profile_photo", columnDefinition = "TEXT")
    private String profilePhoto;

    @ManyToOne
    @JoinColumn(name = "person_id", nullable = false, unique = true)
    private Person personId;

    @ManyToOne
    @JoinColumn(name = "role_id", nullable = false, unique = false)
    private Role roleId;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}

	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

	public Person getPersonId() {
		return personId;
	}

	public void setPersonId(Person personId) {
		this.personId = personId;
	}

	public Role getRoleId() {
		return roleId;
	}

	public void setRoleId(Role roleId) {
		this.roleId = roleId;
	}
    
    
}
