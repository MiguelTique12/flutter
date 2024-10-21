import 'package:flutter/material.dart';

class welcomeLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Image.asset(
                'assets/images/imagologoblack.png', // Asegúrate de tener tu logo en la carpeta assets
                height: 100,
              ),
            ),
            SizedBox(height: 40),
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de login
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50), // Ancho completo
              ),
              child: Text('Iniciar sesión'),
            ),
            SizedBox(height: 20),
            // Register Button
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de registro
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50), // Ancho completo
              ),
              child: Text('Registrarse'),
            ),
            
          ],
        ),
      ),
    );
  }
}
