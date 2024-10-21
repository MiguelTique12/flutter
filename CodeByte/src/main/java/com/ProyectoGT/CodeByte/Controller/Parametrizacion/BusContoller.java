package com.ProyectoGT.CodeByte.Controller.Parametrizacion;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ProyectoGT.CodeByte.Controller.ObjectT.ObjectTController;
import com.ProyectoGT.CodeByte.Entity.Parametrizacion.Bus;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping ("/Parametrizacion/Buses")
public class BusContoller extends ObjectTController<Bus>{

}
