package com.ProyectoGT.CodeByte.DTO;

import java.time.LocalDateTime;

public interface IUserDTO {

    long getId();
    Boolean getStatus();
    LocalDateTime getCreatedAt();
    LocalDateTime getUpdatedAt();
    LocalDateTime getDeletedAt();
    String getUserName();
    String getProfilePhoto();

    // Métodos adicionales para la información de la persona
    String getNames();
    String getLastName();
    String getDocumentType();
    String getDocument();
    String getDocumentPhoto();
    LocalDateTime getBirthdate();
    String getEmail();
    boolean isGender();
    
    String getContrasenia(); // Asegúrate de incluir la contraseña
}
