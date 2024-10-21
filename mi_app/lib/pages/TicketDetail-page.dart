import 'package:flutter/material.dart';
import 'package:mi_app/models/TravelPackage.dart';

class TicketDetailPage extends StatelessWidget {
  final String destino;
  final String numeroTicket;

  TicketDetailPage({required this.destino, required this.numeroTicket, required TravelPackage travelPackage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Ticket'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 5,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Título del ticket
                Center(
                  child: Text(
                    'Ticket de Viaje',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Separador decorativo
                Divider(
                  color: Colors.orange,
                  thickness: 2,
                ),
                SizedBox(height: 20),

                // Detalles del destino y número de ticket
                Text(
                  'Destino:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  destino,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 10),

                Text(
                  'Número del Ticket:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  numeroTicket,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 20),

                // Imagen del destino
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/paisaje.jpg',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),

                // Separador decorativo
                Divider(
                  color: Colors.orange,
                  thickness: 2,
                ),
                SizedBox(height: 20),

                // Más detalles (precio, fecha, lugar)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Precio:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          '\$100',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Fecha:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          '10 de Octubre, 2024',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Text(
                  'Lugar:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  'Cueva del Tigre, Colombia',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
