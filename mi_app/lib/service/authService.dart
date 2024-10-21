import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mi_app/models/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Importa tu modelo login

class AuthService {
  final String apiUrl = 'http://192.168.1.6:9000/proyectoGT/jwt/auth/login'; // Cambia por la URL de tu API

  Future<login?> loginUser(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        // Guarda el token en SharedPreferences
        final String token = jsonResponse['jwt'];  
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setString('username', username);
        return login.fromJson(jsonResponse);
      } else {
        print('Error al iniciar sesión: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error de conexión: $e');
      return null;
    }
  }
}
