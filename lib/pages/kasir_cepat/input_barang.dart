import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/provider/kasir_cepat_provider.dart';
import 'package:inamikro_app_v2/widget/custom_button.dart';
import 'package:inamikro_app_v2/widget/item_row.dart';
import 'package:provider/provider.dart';

class InputBarangWidget extends StatelessWidget {
  InputBarangWidget({super.key});

  final TextEditingController namaController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController satuanController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  void _addToCart(BuildContext context) {
    final cart = Provider.of<KasirCepatProvider>(context, listen: false);

    final String namaBarang = namaController.text;
    final int? quantity = int.tryParse(quantityController.text);
    final String satuan = satuanController.text;
    final int? hargaBarang = int.tryParse(hargaController.text);

    if (namaBarang.isEmpty ||
        quantity == null ||
        hargaBarang == null ||
        satuan.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap isi semua kolom dengan benar')),
      );
      return;
    }

    cart.addItem(
      namaBarang: namaBarang,
      hargaBarang: hargaBarang,
      quantity: quantity,
      satuan: satuan,
    );

    // Bersihkan input setelah berhasil menambah barang
    namaController.clear();
    quantityController.clear();
    satuanController.clear();
    hargaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KasirCepatProvider>(
      builder: (context, cart, child) {
        return Container(
          padding: const EdgeInsets.only(
            top: 40.0,
            left: 40.0,
            right: 40.0,
            bottom: 60.0,
          ),
          decoration: const BoxDecoration(
            color: AppPalette.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                labelText: 'Nama produk',
                hintText: 'Nama produk',
                controller: namaController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: 'Banyak produk',
                hintText: 'Kuantitas',
                controller: quantityController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: 'Satuan produk',
                hintText: 'Satuan produk',
                controller: satuanController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: 'Harga per item',
                hintText: 'Rp xxx',
                controller: hargaController,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: 'Masukkan keranjang',
                  color: AppPalette.grey,
                  textColor: Colors.white,
                  isBold: true,
                  onPressed: () => _addToCart(context),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Keranjang',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: cart.items.map((item) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemRow(
                        name: item.namaBarang,
                        price: item.hargaBarang,
                        quantity: item.quantity,
                        satuan: item.satuan!,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppPalette.black2.withOpacity(0.1),
            hintStyle: const TextStyle(
              fontFamily: 'SanFrancisco',
              fontSize: 16.0,
              color: AppPalette.black2,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
          ),
          style: const TextStyle(
            fontFamily: 'SanFrancisco',
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
