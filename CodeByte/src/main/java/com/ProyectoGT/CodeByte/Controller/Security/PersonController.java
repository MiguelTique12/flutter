package com.ProyectoGT.CodeByte.Controller.Security;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ProyectoGT.CodeByte.Controller.ObjectT.ObjectTController;
import com.ProyectoGT.CodeByte.Entity.Security.Person;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping ("/Seguridad/Personas")
public class PersonController extends ObjectTController<Person>{

}
