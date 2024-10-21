package com.ProyectoGT.CodeByte.Controller.Security;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ProyectoGT.CodeByte.Controller.ObjectT.ObjectTController;
import com.ProyectoGT.CodeByte.Entity.Security.Role;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping ("/Seguridad/Roles")
public class RoleController extends ObjectTController<Role>{

}
