import 'package:flutter/material.dart';

class ViajesPage extends StatelessWidget {
  // Lista de destinos con título, descripción e imagen
  final List<Map<String, String>> destinos = [
    {
      'titulo': 'Mano Gigante',
      'descripcion': 'Una vista panorámica de las montañas y el río Magdalena.',
      'imagen': 'assets/images/cielo.jpg',
    },
    {
      'titulo': 'San Agustín',
      'descripcion': 'Parque arqueológico con estatuas de gran valor cultural.',
      'imagen': 'assets/images/cielo.jpg',
    },
    {
      'titulo': 'Caverna La Cumbre',
      'descripcion': 'Explora la fascinante caverna bajo la montaña.',
      'imagen': 'assets/images/cielo.jpg',
    },
    {
      'titulo': 'Desierto de la Tatacoa',
      'descripcion': 'Un desierto único con un paisaje impresionante.',
      'imagen': 'assets/images/cielo.jpg',
    },
    {
      'titulo': 'Salto del Mortiño',
      'descripcion': 'Hermosa cascada en medio de las montañas.',
      'imagen': 'assets/images/cielo.jpg',
    },
    {
      'titulo': 'Termales de Rivera',
      'descripcion': 'Aguas termales naturales rodeadas de naturaleza.',
      'imagen': 'assets/images/cielo.jpg',
    },
  ];

  // Función para mostrar el modal con los detalles del destino
  void mostrarDetalles(BuildContext context, Map<String, String> destino) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7, // Tamaño inicial del modal
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (_, controller) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)), // Más redondeado
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Imagen de fondo del modal de detalles
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
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  // Contenido del modal
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(height: 40), // Espacio superior
                        Center(
                          child: Text(
                            destino['titulo']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'DancingScript', // Fuente elegante y atractiva
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Container(
                            width: 60,
                            height: 3,
                            color: Colors.white70, // Línea decorativa
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            destino['descripcion']!,
                            textAlign: TextAlign.center, // Centrar la descripción también
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                              fontFamily: 'Raleway', // Fuente complementaria
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Imagen de fondo de la página
          Positioned.fill(
            child: Image.asset(
              'assets/images/fondo.png', // Imagen de fondo de la página
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              // Título centrado
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 1.0), // Espaciado superior e inferior
                child: Center(
                  child: Text(
                    'Viajes de Oro',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black, // Color del texto
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: destinos.length,
                    itemBuilder: (context, index) {
                      final destino = destinos[index];
                      return GestureDetector(
                        onTap: () {
                          // Mostrar el modal con los detalles del destino
                          mostrarDetalles(context, destino);
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Container(
                            height: 200, // Ajusta la altura para que las tarjetas sean más grandes
                            child: Stack(
                              children: [
                                // Imagen de fondo de la tarjeta
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
                                // Solo muestra el título en la tarjeta principal
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        destino['titulo']!,
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
