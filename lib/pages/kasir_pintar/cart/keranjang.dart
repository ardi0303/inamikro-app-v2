import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/widget/info_row.dart';
import 'package:inamikro_app_v2/widget/item_row.dart';
import 'package:provider/provider.dart';
import 'package:inamikro_app_v2/provider/kasir_pintar_provider.dart';
class KeranjangWidget extends StatelessWidget {
  const KeranjangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Consumer<KasirPintarProvider>(
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
              // Gunakan ListView.builder untuk daftar item
              cart.selectedItems.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,  // Agar tidak mengisi seluruh ruang
                      itemCount: cart.selectedItems.length,
                      itemBuilder: (context, index) {
                        final item = cart.selectedItems[index];
                        return ItemRow(
                          name: item.namaBarang,
                          price: item.hargaBarang,
                          quantity: item.quantity,
                          satuan: item.satuan!,
                        );
                      },
                    )
                  : const Center(child: Text('Keranjang kosong')), // Menangani jika tidak ada item
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
                    boldValue: true,
                  ),
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
    ),
    );  
  
  }
}
