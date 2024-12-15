import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/provider/kasir_cepat_provider.dart';
import 'package:inamikro_app_v2/widget/info_row.dart';
import 'package:inamikro_app_v2/widget/item_row.dart';
import 'package:provider/provider.dart';

class KeranjangWidget extends StatelessWidget {
  const KeranjangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KasirCepatProvider>(
      builder: (context, cart, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 20),
              const Text(
                'Detail Pembayaran',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  InfoRow(
                    label: 'Sub total item',
                    value: 'Rp ${cart.totalPrice}',
                    boldValue: true,
                  ),
                  const SizedBox(height: 20),
                  InfoRow(
                      label: 'Pajak UMKM 0,5%',
                      value: 'Rp ${cart.umkmTax}',
                      boldValue: true),
                  const SizedBox(height: 40),
                  InfoRow(
                    label: 'Total',
                    value: 'Rp ${cart.totalPrice + cart.umkmTax}',
                    boldLabel: true,
                    boldValue: true,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}