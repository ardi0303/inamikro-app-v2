import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/pages/kasir_pintar/nota/invoice.dart';
import 'package:inamikro_app_v2/widget/app_bar.dart';

class KasirPintarNota extends StatelessWidget {
  const KasirPintarNota({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppPalette.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: AppBarWidget(
                title: 'Nota Pembelian.',
                titlePosition: 'below',
                colorFilter:
                    ColorFilter.mode(AppPalette.white, BlendMode.srcIn),
                showSearch: false,
                buttonFill: AppPalette.red,
                backgroundColor: AppPalette.white,
                titleColor: AppPalette.black,
              ),
            ),
            InvoiceWidget(),
          ],
        ),
      ),
    );
  }
}
