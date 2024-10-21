package com.ProyectoGT.CodeByte.DTO;

import java.time.LocalDateTime;

public class UserDTO implements IUserDTO {
    private long id;
    private Boolean status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private LocalDateTime deletedAt;
    private String userName;
    private String profilePhoto;
    
    // Información de la persona
    private String names;
    private String lastName;
    private String documentType;
    private String document;
    private String documentPhoto;
    private LocalDateTime birthdate;
    private String email;
    private boolean gender;
    
    private String contrasenia;

    // Getters y Setters
    @Override
    public long getId() { return id; }
    @Override
    public Boolean getStatus() { return status; }
    @Override
    public LocalDateTime getCreatedAt() { return createdAt; }
    @Override
    public LocalDateTime getUpdatedAt() { return updatedAt; }
    @Override
    public LocalDateTime getDeletedAt() { return deletedAt; }
    @Override
    public String getUserName() { return userName; }
    @Override
    public String getProfilePhoto() { return profilePhoto; }
    @Override
    public String getNames() { return names; }
    @Override
    public String getLastName() { return lastName; }
    @Override
    public String getDocumentType() { return documentType; }
    @Override
    public String getDocument() { return document; }
    @Override
    public String getDocumentPhoto() { return documentPhoto; }
    @Override
    public LocalDateTime getBirthdate() { return birthdate; }
    @Override
    public String getEmail() { return email; }
    @Override
    public boolean isGender() { return gender; }
    @Override
    public String getContrasenia() { return contrasenia; }

    // Setters
    public void setId(long id) { this.id = id; }
    public void setStatus(Boolean status) { this.status = status; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
    public void setDeletedAt(LocalDateTime deletedAt) { this.deletedAt = deletedAt; }
    public void setUserName(String userName) { this.userName = userName; }
    public void setProfilePhoto(String profilePhoto) { this.profilePhoto = profilePhoto; }
    public void setNames(String names) { this.names = names; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public void setDocumentType(String documentType) { this.documentType = documentType; }
    public void setDocument(String document) { this.document = document; }
    public void setDocumentPhoto(String documentPhoto) { this.documentPhoto = documentPhoto; }
    public void setBirthdate(LocalDateTime birthdate) { this.birthdate = birthdate; }
    public void setEmail(String email) { this.email = email; }
    public void setGender(boolean gender) { this.gender = gender; }
    public void setContrasenia(String contrasenia) { this.contrasenia = contrasenia; }
}
