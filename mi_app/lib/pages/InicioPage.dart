import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fondo.png'), // Fondo de pantalla completo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido con desplazamiento
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Imagen de fondo con texto superpuesto
                Stack(
                  children: [
                    // Imagen de fondo en la parte superior
                    Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/cielo.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Textos centrados
                    const Positioned.fill(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 5), // Espacio entre los textos
                            // Texto "Golden Travel"
                            Text(
                              'Bienvenidos',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                    offset: Offset(3.0, 3.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60), // Añadir más espacio entre la imagen y las tarjetas
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Ofertas y viajes',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      // Tarjeta de Ofertas
                      GestureDetector(
                        onTap: () {
                          // Acción al hacer clic en "Ofertas"
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/cielo.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 30,
                                left: 10,
                                child: Text(
                                  'Ofertas',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 5.0,
                                        color: Colors.black,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Tarjeta de Viajes
                      GestureDetector(
                        onTap: () {
                          // Acción al hacer clic en "Viajes"
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/cielo.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 30,
                                left: 10,
                                child: Text(
                                  'Viajes',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 5.0,
                                        color: Colors.black,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40), // Añadir más espacio debajo de las tarjetas
              ],
            ),
          ),
        ],
      ),
    );
  }
}
