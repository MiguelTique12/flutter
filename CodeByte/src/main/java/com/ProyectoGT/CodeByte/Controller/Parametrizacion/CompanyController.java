package com.ProyectoGT.CodeByte.Controller.Parametrizacion;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ProyectoGT.CodeByte.Controller.ObjectT.ObjectTController;
import com.ProyectoGT.CodeByte.Entity.Parametrizacion.Company;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping ("/Parametrizacion/Empresa")
public class CompanyController extends ObjectTController<Company>{

}
