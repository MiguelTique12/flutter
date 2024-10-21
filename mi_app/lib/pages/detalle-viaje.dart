import 'package:flutter/material.dart';

class DetalleViaje extends StatelessWidget {
  final Map<String, String> destino;

  DetalleViaje({required this.destino});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          destino['titulo']!, // Título del destino
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway', // Cambia según tu fuente
          ),
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Imagen de fondo de la página
          Positioned.fill(
            child: Image.asset(
              destino['imagen']!,
              fit: BoxFit.cover,
            ),
          ),
          // Overlay oscuro para resaltar el texto
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          // Contenido de la página
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80), // Espacio para la AppBar
                Text(
                  destino['titulo']!,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  destino['descripcion']!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                // Puedes agregar más información o un botón aquí si lo deseas
              ],
            ),
          ),
        ],
      ),
    );
  }
}
