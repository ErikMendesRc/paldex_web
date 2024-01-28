import 'package:flutter/material.dart';

import '../config/api_client.dart';
import '../models/pal.dart';

class PalProvider with ChangeNotifier {
  List<Pal> _pals = [];

  List<Pal> _filteredPals = [];

  List<Pal> get filteredPals => _filteredPals;

  List<Pal> get pals => _pals;

  final ApiClient _apiClient;

  PalProvider({ApiClient? apiClient}) : _apiClient = apiClient!;

  Future<void> getAllPals() async {
    try {
      final decodedResponse = await _apiClient.getAllPals();
      _pals = decodedResponse.map((palMap) => Pal.fromMap(palMap)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading Pals: $e');
      rethrow;
    }
  }

  Future<Pal> getPalById(int palId) async {
    try {
      Pal pal = await _apiClient.getPalById(palId);
      notifyListeners();
      return pal;
    } catch (e) {
      print('Error loading Pal: $e');
      rethrow;
    }
  }

  Future<void> searchPals(String searchTerm) async {
    try {
      final decodedResponse = await _apiClient.searchPals(searchTerm);
      _pals = decodedResponse.map((palMap) => Pal.fromMap(palMap)).toList();
      _filteredPals.clear();

      _filteredPals.addAll(_pals
          .where((pal) =>
              pal.name.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList());

      notifyListeners();
    } catch (e) {
      print('Erro ao buscar Pals: $e');
      rethrow;
    }
  }
}
