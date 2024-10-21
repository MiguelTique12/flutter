import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Asegúrate de agregar esta dependencia en pubspec.yaml

class UserService {
  final String _baseUrl =
      'http://192.168.1.6:9000/proyectoGT/Seguridad/Usuarios'; // Cambia esto según tu URL base

  Future<void> registerUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse(
          '$_baseUrl/GuardarUsuarioJwt'), // Cambia '/register' según tu endpoint
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(userData),
    );

    if (response.statusCode == 200) {
      // Manejo de éxito (puedes agregar lógica adicional aquí si lo necesitas)
      print('Usuario registrado con éxito: ${response.body}');
    } else {
      // Manejo de error
      throw Exception('Error al registrar el usuario: ${response.body}');
    }
  }

  Future<Map<String, dynamic>?> findUserByName(String username) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await http.get(
        Uri.parse(
            '$_baseUrl/encontrarUsuarioNombre?userName=$username'), // Asegúrate de usar 'userName'
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final String personId = jsonResponse['personId']['id'].toString();
        final String userId = jsonResponse['id'].toString();
        await prefs.setString('personId', personId);
        await prefs.setString('userId', userId);
        return jsonDecode(response.body); 
      } else {
        print('Error al encontrar el usuario: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error de conexión: $e');
      return null;
    }
  }
}
