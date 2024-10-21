import 'package:flutter/material.dart';
import 'package:mi_app/main.dart';
import 'package:mi_app/models/user.dart';
import 'package:mi_app/service/userService.dart';

class PersonInfo extends StatefulWidget {
  @override
  _PersonInfoState createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordValid = true;

  UserService _userService = UserService();

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

  void _validateEmailInput(String value) {
    if (false) {
      _showAlert('Por favor, ingrese un correo electrónico válido.');
      _emailController.clear();
    }
  }

  void _validatePasswordInput(String value) {
    setState(() {
      _isPasswordValid = value.isNotEmpty && value == _passwordController.text;
    });
  }

  Future<void> _submitForm() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showAlert('Por favor, completa todos los campos requeridos.');
      return;
    }

    // Crea el objeto User con los datos requeridos
    User newUser = User(
      userName: _emailController.text,
      email: _emailController.text,
      contrasenia: _passwordController.text,
    );

    // Convierte el objeto User a un mapa y envía la solicitud
    try {
      await _userService.registerUser(newUser.toJson());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
    } catch (e) {
      _showAlert(e.toString());
    }
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
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 250,
                    ),
                  ),
                  Text(
                    'Información del Usuario',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: _validateEmailInput,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: _validatePasswordInput,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Confirmar contraseña',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: _isPasswordValid ? Colors.grey : Colors.red,
                        ),
                      ),
                    ),
                    onChanged: _validatePasswordInput,
                  ),
                  if (!_isPasswordValid) // Muestra el mensaje de error si es necesario
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Las contraseñas deben ser iguales',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
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