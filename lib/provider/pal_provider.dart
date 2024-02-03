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

  int _currentPage = 0;
  final int _pageSize = 10;

  Future<void> getAllPals() async {
    try {
      final decodedResponse = await _apiClient.getAllPals(_currentPage, _pageSize);
      final List<Pal> newPals = decodedResponse.map((palMap) => Pal.fromMap(palMap)).toList();
      if (_currentPage == 0) {
        _pals = newPals;
      } else {
        _pals.addAll(newPals);
      }
      notifyListeners();
    } catch (e) {
      print('Error loading Pals: $e');
      rethrow;
    }
  }

  Future<void> loadMorePals() async {
    _currentPage++;
    await getAllPals();
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

  Future<void> getPalsByRarityAscending() async {
    try {
      final response = await _apiClient.getPalsByRarityAscending();
      _filteredPals = response.map((palMap) => Pal.fromMap(palMap)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading Pals by rarity (ascending): $e');
      rethrow;
    }
  }

  Future<void> getPalsByRarityDescending() async {
    try {
      final response = await _apiClient.getPalsByRarityDescending();
      _filteredPals = response.map((palMap) => Pal.fromMap(palMap)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading Pals by rarity (descending): $e');
      rethrow;
    }
  }

  // Métodos para filtrar Pals por número
  Future<void> getPalsByNumberAscending() async {
    try {
      final response = await _apiClient.getPalsByNumberAscending();
      _filteredPals = response.map((palMap) => Pal.fromMap(palMap)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading Pals by number (ascending): $e');
      rethrow;
    }
  }

  Future<void> getPalsByNumberDescending() async {
    try {
      final response = await _apiClient.getPalsByNumberDescending();
      _filteredPals = response.map((palMap) => Pal.fromMap(palMap)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading Pals by number (descending): $e');
      rethrow;
    }
  }

  // Método para filtrar Pals por elemento
  Future<void> getPalsByElement(String element) async {
    try {
      final response = await _apiClient.getPalsByElement(element);
      _filteredPals = response.map((palMap) => Pal.fromMap(palMap)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading Pals by element: $e');
      rethrow;
    }
  }

  void clearFilters() {
    _filteredPals.clear();
    _updateFilteredPals();
    notifyListeners();
  }

  // Método para atualizar a lista filtrada
  void _updateFilteredPals() {
    if (_filteredPals.isNotEmpty) {
      _filteredPals.clear();
      _filteredPals.addAll(_pals);
    }
  }
}
