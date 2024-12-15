import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/pages/kasir_pintar/input_barang.dart';
import 'package:inamikro_app_v2/widget/total_price.dart';
import 'package:inamikro_app_v2/provider/kasir_pintar_provider.dart';
import 'package:inamikro_app_v2/provider/search_provider.dart';
import 'package:inamikro_app_v2/widget/app_bar.dart';
import 'package:provider/provider.dart';

class KasirPintar extends StatelessWidget {
  const KasirPintar({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller for managing search text input
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: Column(
        children: <Widget>[
          SafeArea(
            child: AppBarWidget(
              title: "Kasir Pintar",
              colorFilter:
                  const ColorFilter.mode(AppPalette.red, BlendMode.srcIn),
              controller: searchController,
              onSearchChanged: (query) =>
                  context.read<SearchProvider>().filterItems(query),
              showSearch: true,
              titlePosition: 'beside',
            ),
          ),
          const Expanded(
            child: InputBarangWidget(),
          ),
          TotalAndPayWidget<KasirPintarProvider>(
            totalValueExtractor: (cart) => cart.totalPrice.toString(),
            onPayPressed: () {
              Navigator.pushNamed(context, '/kasir-pintar/cart');
            },
          )
        ],
      ),
    );
  }
}
