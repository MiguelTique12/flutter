package com.ProyectoGT.CodeByte.Controller.Operational;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ProyectoGT.CodeByte.Controller.ObjectT.ObjectTController;
import com.ProyectoGT.CodeByte.Entity.Operational.Booking;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping ("/Operacional/Reserva")
public class BookingController extends ObjectTController<Booking>{

}
