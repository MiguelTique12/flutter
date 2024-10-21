import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mi_app/models/TravelPackage.dart';

class TravelPackageService {
  final String baseUrl;

  TravelPackageService(this.baseUrl);

  // Future<List<TravelPackage>> fetchTravelPackages() async {
  //   try {
  //     final response = await http.get(Uri.parse('$baseUrl/Paquetes turisticos'));

  //     if (response.statusCode == 200) {
  //       List<dynamic> parsed = json.decode(response.body);
  //       return parsed.map((json) => TravelPackage.fromJson(json)).toList();
  //     } else {
  //       throw Exception('Failed to load travel packages');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load travel packages: $e');
  //   }
  // }
}
