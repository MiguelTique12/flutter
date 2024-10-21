package com.ProyectoGT.CodeByte.Controller.Jwt;

import com.ProyectoGT.CodeByte.DTO.Jwt.AuthenticationRequest;
import com.ProyectoGT.CodeByte.DTO.Jwt.AuthenticationResponse;
import com.ProyectoGT.CodeByte.Service.Jwt.CustomUserDetailsService;
import com.ProyectoGT.CodeByte.Utils.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/jwt/auth")
//cambiar a asterisco para movil, osino el celular no permita 
@CrossOrigin(origins = "*") // Permite CORS solo para este origen
public class AuthenticationController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    @PostMapping("/login")
    public ResponseEntity<?> createAuthenticationToken(@RequestBody AuthenticationRequest authenticationRequest) {
        try {
            // Autenticación del usuario
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(authenticationRequest.getUsername(), authenticationRequest.getPassword())
            );
        } catch (BadCredentialsException e) {
            // Manejar credenciales incorrectas
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Incorrect username or password");
        } catch (Exception e) {
            // Manejar otros errores de autenticación
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Authentication failed");
        }

        // Cargar detalles del usuario y generar token JWT
        UserDetails userDetails = customUserDetailsService.loadUserByUsername(authenticationRequest.getUsername());
        String jwt = jwtUtil.generateToken(userDetails);

        // Retornar el token en la respuesta
        return ResponseEntity.ok(new AuthenticationResponse(jwt));
    }
}
