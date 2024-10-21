package com.ProyectoGT.CodeByte.Controller.Security;

import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import com.ProyectoGT.CodeByte.Controller.ObjectT.ObjectTController;
import com.ProyectoGT.CodeByte.DTO.UserDTO;
import com.ProyectoGT.CodeByte.Entity.Security.User;
import com.ProyectoGT.CodeByte.Entity.Security.Person;
import com.ProyectoGT.CodeByte.Entity.Security.Role;
import com.ProyectoGT.CodeByte.Service.Security.UserService;
import com.ProyectoGT.CodeByte.Service.Security.PersonService;
import com.ProyectoGT.CodeByte.Service.Security.RolService;

@CrossOrigin
@RestController
@RequestMapping("/Seguridad/Usuarios")
public class UserController extends ObjectTController<User> {

    private final UserService userService;
    private final PersonService personService;
    private final RolService roleService;
    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserController(UserService userService, PersonService personService, RolService roleService, BCryptPasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.personService = personService;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
    }

    @PostMapping("/GuardarUsuarioJwt")
    public ResponseEntity<String> saveUsuarioJwt(@RequestBody UserDTO userDto) throws Exception {
        // Verificar si el nombre de usuario ya existe
        if (userService.existsByUserName(userDto.getUserName())) {
            return ResponseEntity.badRequest().body("El nombre de usuario ya está en uso.");
        }

        // Buscar o crear el rol "Client"
        Role clientRole = roleService.findByName("Client");
        if (clientRole == null) {
            clientRole = new Role();
            clientRole.setName("Client");
            clientRole.setCreatedAt(LocalDateTime.now());
            roleService.save(clientRole);
        }

        // Crear la nueva persona
        Person person = new Person();
        person.setNames(userDto.getNames());
        person.setLastName(userDto.getLastName());
        person.setDocumentType(userDto.getDocumentType());
        person.setDocument(userDto.getDocument());
        person.setDocumentPhoto(userDto.getDocumentPhoto());
        person.setBirthdate(userDto.getBirthdate());
        person.setEmail(userDto.getEmail());
        person.setGender(userDto.isGender());

        // Guardar la persona
        person = personService.save(person);

        // Crear y guardar el nuevo usuario
        User user = new User();
        user.setUserName(userDto.getUserName());
        
        // Encriptar la contraseña
        String encodedPassword = passwordEncoder.encode(userDto.getContrasenia());
        user.setContrasenia(encodedPassword);
        
        user.setProfilePhoto(null); // O asigna una foto de perfil por defecto
        user.setPersonId(person);
        user.setRoleId(clientRole);
        user.setCreatedAt(LocalDateTime.now());

        userService.save(user);

        return ResponseEntity.ok("Usuario registrado exitosamente.");
    }

    @GetMapping("/validar-datos-personales-llenos")
    public Integer validarDatosPersonalesPersona(@RequestParam Integer usuarioId) {
        return userService.validarDatosPersonalesPersona(usuarioId);
    }

    @GetMapping("/encontrarUsuarioNombre")
    public Optional<User> findByUserName(@RequestParam String userName) {
        return userService.findByUserName(userName);
    }
}
