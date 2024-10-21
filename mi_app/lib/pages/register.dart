import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_app/main.dart';
import 'package:mi_app/models/person.dart';
import 'package:mi_app/service/userService.dart'; // Asegúrate de importar tu modelo de Persona

class RegisterPage extends StatefulWidget {
  final Persona persona; // Recibe la persona como argumento

  RegisterPage({required this.persona}); // Constructor que recibe la persona

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isUsernameValid = true;
  bool isEmailValid = true;

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Advertencia'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _validateInput(String inputType) {
    if (inputType == 'username') {
      setState(() {
        isUsernameValid = !RegExp(r'[^a-zA-Z0-9]').hasMatch(usernameController.text);
        if (!isUsernameValid) {
          _showAlert('El nombre de usuario solo puede contener letras y números.');
        }
      });
    } 
  }

  bool _isFormValid() {
    return usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        isUsernameValid &&
        isEmailValid;
  }

  void _registerUser() async {
    // Crear una instancia de UserService
    UserService userService = UserService();

    // Aquí puedes combinar los datos de la persona y del usuario en un solo JSON
    final userData = {
      'userName': usernameController.text,
      'profilePhoto': 'url_o_ruta_de_foto', // Ruta de la foto de perfil si la tienes
      'names': widget.persona.names,
      'lastName': widget.persona.lastName,
      'documentType': widget.persona.documentType,
      'document': widget.persona.document,
      'documentPhoto': 'url_o_ruta_documento', // Asegúrate de almacenar esta información en el modelo de Persona
      'email': widget.persona.email, // Define cómo vas a manejar el género
      'contrasenia': passwordController.text,
    };

    try {
    await userService.registerUser(userData); // Llama al método desde la instancia
    // Navegar a la página principal (Dashboard)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  } catch (e) {
    _showAlert(e.toString()); // Muestra el error si no se pudo registrar
  }

  // Aquí puedes enviar `userData` a tu API o servicio
  print(userData); // Solo para visualizar el JSON en consola
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fondo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Image.asset('assets/images/logo.png', height: 250),
                  ),
                  Text(
                    'Registro',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Nombre de usuario',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorText: isUsernameValid ? null : 'Solo letras y números permitidos',
                    ),
                    onChanged: (value) {
                      _validateInput('username');
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isFormValid() ? () {
                      _registerUser(); // Llama a la función para registrar el usuario
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 152, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Registrarse',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
