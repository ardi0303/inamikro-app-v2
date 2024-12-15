import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/pages/kasir_pintar/cart/keranjang.dart';
import 'package:inamikro_app_v2/provider/kasir_pintar_provider.dart';
import 'package:inamikro_app_v2/widget/app_bar.dart';
import 'package:provider/provider.dart';

class KasirPintarCart extends StatelessWidget {
  const KasirPintarCart({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppPalette.white,
      body: Column(
        children: <Widget>[
          SafeArea(
            child: AppBarWidget(
              title: 'Keranjang Belanja.',
              titlePosition: 'below',
              colorFilter:
                  const ColorFilter.mode(AppPalette.white, BlendMode.srcIn),
              showSearch: true,
              buttonFill: AppPalette.red,
              backgroundColor: AppPalette.white,
              titleColor: AppPalette.black,
              bgInputColor: AppPalette.black2.withOpacity(0.1),
              filterIconPath: 'assets/icons/filter2.svg',
              buttonFilterFill: AppPalette.grey,
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: KeranjangWidget(),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            left: 40.0, right: 40.0, bottom: 40.0, top: 20.0),
        child: SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              // Pindah ke halaman berikutnya atau tindakan lainnya
              Navigator.pushNamed(context, '/kasir-pintar/nota');
              context.read<KasirPintarProvider>().updateDateTime();
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              backgroundColor: AppPalette.red,
            ),
            child: const Text(
              'Checkout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
