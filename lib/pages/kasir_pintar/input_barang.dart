import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inamikro_app_v2/models/barang_model.dart';
import 'package:provider/provider.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/provider/kasir_pintar_provider.dart';
import 'package:inamikro_app_v2/provider/search_provider.dart';

class InputBarangWidget extends StatelessWidget {
  const InputBarangWidget({super.key});

  void _increaseQuantity(BuildContext context, Barang item) {
    context.read<KasirPintarProvider>().addItem(item);
  }

  void _decreaseQuantity(BuildContext context, Barang item) {
    context.read<KasirPintarProvider>().removeItem(item);
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = context.watch<SearchProvider>().filteredItems;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      decoration: const BoxDecoration(
        color: AppPalette.white,
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Consumer<KasirPintarProvider>(
          builder: (context, cart, child) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: AppPalette.white2,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Item Info
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.namaBarang,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            "Rp ${item.hargaBarang}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            "EXP. ${item.tanggalKadaluarsa}",
                            style: const TextStyle(fontSize: 10.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => _decreaseQuantity(context, item),
                            child: Container(
                              height: 24.0,
                              width: 24.0,
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: AppPalette.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: SvgPicture.asset('assets/icons/minus.svg'),
                            ),
                          ),
                          Text('${item.quantity}'), // This should now update
                          InkWell(
                            onTap: () => _increaseQuantity(context, item),
                            child: Container(
                              height: 24.0,
                              width: 24.0,
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: AppPalette.grey,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: SvgPicture.asset('assets/icons/plus.svg'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
