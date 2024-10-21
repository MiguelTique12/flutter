package com.ProyectoGT.CodeByte.Config.Security;

import java.security.SecureRandom;

public class PasswordGenerator {

    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_+=<>?";
    private static final int DEFAULT_LENGTH = 12;

    public static String generarContraseña(int longitud) {
        SecureRandom random = new SecureRandom();
        StringBuilder contraseña = new StringBuilder(longitud);
        
        for (int i = 0; i < longitud; i++) {
            int index = random.nextInt(CHARACTERS.length());
            contraseña.append(CHARACTERS.charAt(index));
        }
        
        return contraseña.toString();
    }

    // Método sobrecargado para longitud por defecto
    public static String generarContraseña() {
        return generarContraseña(DEFAULT_LENGTH);
    }
}
