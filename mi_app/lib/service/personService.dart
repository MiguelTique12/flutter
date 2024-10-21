import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:mi_app/models/person.dart'; 
import 'package:mi_app/pages/dashboard-page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Personservice {
  final String baseUrl = 'http://192.168.1.6:9000/proyectoGT/Seguridad';
  final createdAt = DateTime.now().toIso8601String();

  Future<bool> savePersona(Persona p) async {
    final url = Uri.parse('$baseUrl/Personas/');

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token'); // Recuperar el token

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Agregar el token a las cabeceras
        },
        body: jsonEncode(p.toJson()),
      );
      print('Cuerpo de la solicitud: ${jsonEncode(p.toJson())}');
      print(url);

      if (response.statusCode == 201) {
        return true; // Guardado exitosamente
      } else {
        print('Error: ${response.statusCode}, ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<void> updatePersonData(
    BuildContext context, // Agregado
    String names,
    String lastName,
    String documentType,
    String document,
    String base64Image,
    String birthdate,
    String email,
    bool gender,
    String username, // Nuevo campo
    String profilePhoto // Nuevo campo
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token'); // Recuperar el token
    String? personId = prefs.getString('personId');

    final userData = {
      "status": true,
      "names": names,
      "lastName": lastName,
      "documentType": documentType,
      "document": document,
      "documentPhoto": base64Image,
      "birthdate": birthdate,
      "email": email,
      "gender": gender,
      "createdAt": createdAt
    };

    final response = await http.put(
      Uri.parse('$baseUrl/Personas/$personId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      print('Datos actualizados con éxito.');
      String? userId = prefs.getString('userId');
      await updateUserData(context, userId, username, profilePhoto, personId); 
    } else {
      print('Error al actualizar los datos: ${response.statusCode} ${response.body}');
    }
  }

  Future<void> updateUserData(BuildContext context, String? userId, String userName,
    String profilePhoto, String? personId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token'); // Recuperar el token
    final createdAt = DateTime.now().toIso8601String();
    final roleId = 1; // Cambia esto según el rol adecuado

    final userData = {
      "createdAt": createdAt,
      "status": true,
      "userName": userName,
      "profilePhoto": profilePhoto,
      "personId": {
        "id": personId,
      },
      "roleId": {
        "id": roleId,
      },
    };

    print('$baseUrl/Usuarios/$userId');

    final response = await http.put(
      Uri.parse('$baseUrl/Usuarios/$userId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      print('Datos del usuario actualizados con éxito.');
      // Navegar al Dashboard
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      print('Error al actualizar los datos del usuario: ${response.statusCode} ${response.body}');
    }
  }

  Future<String> imageToBase64(File image) async {
    Uint8List imageBytes = await image.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }
}
