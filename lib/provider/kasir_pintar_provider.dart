import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/models/barang_model.dart';
import 'package:intl/intl.dart';

class KasirPintarProvider extends ChangeNotifier {
  double _totalPrice = 0;
  final List<Barang> _selectedItems = [];

  double get totalPrice => _totalPrice;
  double get umkmTax => _totalPrice * 0.005;
  double get totalPriceWithTax => _totalPrice + umkmTax;
  List<Barang> get selectedItems => _selectedItems;

  String _invoiceNumber = _generateInvoiceNumber();
  String _date = _getCurrentDate();
  String _time = _getCurrentTime();

  String get invoiceNumber => _invoiceNumber;
  String get date => _date;
  String get time => _time;

  static String _generateInvoiceNumber() {
    final random = Random();
    const length = 8;
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  static String _getCurrentDate() {
    final now = DateTime.now();
    return DateFormat('ddMMyy').format(now);
  }

  static String _getCurrentTime() {
    final now = DateTime.now();
    return DateFormat('HH:mm:ss').format(now);
  }

  void updateDateTime() {
    _invoiceNumber = _generateInvoiceNumber(); // Generate new invoice number
    _date = _getCurrentDate(); // Update date
    _time = _getCurrentTime(); // Update time
    notifyListeners();
  }

  void addItem(Barang item) {
    final index =
        _selectedItems.indexWhere((i) => i.namaBarang == item.namaBarang);
    if (index >= 0) {
      _selectedItems[index].quantity++;
    } else {
      _selectedItems.add(item..quantity = 1);
    }
    _calculateTotalPrice();
  }

  void removeItem(Barang item) {
    final index =
        _selectedItems.indexWhere((i) => i.namaBarang == item.namaBarang);
    if (index >= 0) {
      if (_selectedItems[index].quantity > 1) {
        _selectedItems[index].quantity--;
      } else {
        _selectedItems[index].quantity = 0;
        _selectedItems.removeAt(index);
      }
    }
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    _totalPrice = _selectedItems.fold(
        0, (sum, item) => sum + (item.quantity * item.hargaBarang));
    notifyListeners();
  }

  void resetCart() {
    _selectedItems.clear(); 
    _totalPrice = 0; 
    notifyListeners(); 
  }
}
