import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/datas/barang_data.dart';
import 'package:inamikro_app_v2/models/barang_model.dart';

class SearchProvider extends ChangeNotifier {
  List<Barang> _filteredItems = barangData;

  List<Barang> get filteredItems => _filteredItems;

  void filterItems(String query) {
    if (query.isEmpty) {
      _filteredItems = barangData;
    } else {
      _filteredItems = barangData.where((item) {
        return item.namaBarang.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
