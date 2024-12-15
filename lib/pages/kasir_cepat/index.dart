import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/pages/kasir_cepat/input_barang.dart';
import 'package:inamikro_app_v2/provider/kasir_cepat_provider.dart';
import 'package:inamikro_app_v2/widget/app_bar.dart';
import 'package:inamikro_app_v2/widget/total_price.dart';

class KasirCepat extends StatelessWidget {
  const KasirCepat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.red,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SafeArea(
              child: AppBarWidget(
                title: "Kasir Cepat",
                colorFilter: ColorFilter.mode(AppPalette.red, BlendMode.srcIn),
                showSearch: false,
                titlePosition: 'beside',
                showNotification: true,
              ),
            ),
            InputBarangWidget(),
            TotalAndPayWidget<KasirCepatProvider>(
              totalValueExtractor: (cart) => cart.totalPrice.toString(),
              onPayPressed: () {
                Navigator.pushNamed(context, '/kasir-cepat/cart');
              },
            ),
          ],
        ),
      ),
    );
  }
}
