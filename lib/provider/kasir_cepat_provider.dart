import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inamikro_app_v2/models/barang_model.dart';

class KasirCepatProvider extends ChangeNotifier {
  double _totalPrice = 0;
  final List<Barang> _items = [];

  String _invoiceNumber = _generateInvoiceNumber();
  String _date = _getCurrentDate();
  String _time = _getCurrentTime();

  // Getters
  double get totalPrice => _totalPrice;
  List<Barang> get items => _items;
  double get umkmTax => _totalPrice * 0.005;

  String get invoiceNumber => _invoiceNumber;
  String get date => _date;
  String get time => _time;
  final String _customerName = 'Name';
  String get customerName => _customerName;

  final List<Map<String, dynamic>> _transactions = [];

  List<Map<String, dynamic>> get transactions => _transactions;

  void saveTransaction() {
    final transaction = {
      'invoiceNumber': _invoiceNumber,
      'date': _date,
      'time': _time,
      'customerName': _customerName,
      'items': _items
          .map((item) => {
                'name': item.namaBarang,
                'quantity': item.quantity,
                'price': item.hargaBarang,
                'satuan': item.satuan,
              })
          .toList(),
      'totalPrice': _totalPrice,
      'umkmTax': umkmTax,
      'finalPrice': _totalPrice + umkmTax,
    };

    _transactions.add(transaction);
    resetCart();
    notifyListeners();
  }

  // Private helper methods for generating values
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

  // Public methods
  void updateDateTime() {
    _invoiceNumber = _generateInvoiceNumber(); // Generate new invoice number
    _date = _getCurrentDate(); // Update date
    _time = _getCurrentTime(); // Update time
    notifyListeners();
  }

  void addItem({
    required String namaBarang,
    required int hargaBarang,
    required int quantity,
    required String satuan,
  }) {
    _items.add(
      Barang(
        namaBarang: namaBarang,
        hargaBarang: hargaBarang,
        quantity: quantity,
        satuan: satuan,
      ),
    );
    _calculateTotalPrice();
  }

  void resetCart() {
    _items.clear();
    _totalPrice = 0;
    updateDateTime(); // Reset invoice, date, and time
    notifyListeners();
  }

  void _calculateTotalPrice() {
    _totalPrice =
        _items.fold(0, (sum, item) => sum + (item.quantity * item.hargaBarang));
    notifyListeners();
  }
}
