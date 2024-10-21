package com.ProyectoGT.CodeByte.Controller.Security;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ProyectoGT.CodeByte.Controller.ObjectT.ObjectTController;
import com.ProyectoGT.CodeByte.Entity.Security.Driver;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping ("/Parametrizacion/conductor")
public class DriverController extends ObjectTController<Driver>{

}
