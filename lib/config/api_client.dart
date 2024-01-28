import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/pal.dart';

class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  List<dynamic> palList = <dynamic>[];

  Future<List<dynamic>> getAllPals() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/paldex/pal/all'),
      );

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
        palList = List.from(decodedResponse);
        return decodedResponse;
      } else {
        throw Exception('Failed to load Pals');
      }
    } catch (e) {
      print('Error loading Pals: $e');
      rethrow;
    }
  }

  Future<Pal> getPalById(int palId) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/api/paldex/pal/$palId'));

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
        return Pal.fromMap(decodedResponse);
      } else {
        throw Exception('Failed to load Pal');
      }
    } catch (e) {
      print('Erro ao buscar o Pal: $e');
      throw Exception('Erro ao buscar o Pal: $e');
    }
  }

  Future<List<dynamic>> getAllPalsOrderedByName() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/api/paldex/pal/all/orderedByName'));

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
        return decodedResponse;
      } else {
        throw Exception('Failed to load Pals');
      }
    } catch (e) {
      print('Error to load Pal. getAllPalsOrderedByName $e');
      rethrow;
    }
  }

  Future<List<dynamic>> searchPals(String searchTerm) async {
    try {
      final response = await http.get(
          Uri.parse('$baseUrl/api/paldex/pals/search?searchTerm=$searchTerm'));

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
        palList = List.from(decodedResponse);
        return palList;
      } else {
        throw Exception('Failed to load Pal');
      }
    } catch (e) {
      print('Error searching Pals: $e');
      rethrow;
    }
  }
}
