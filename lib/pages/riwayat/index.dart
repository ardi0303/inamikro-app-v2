import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/pages/riwayat/history_transaksi.dart';
import 'package:inamikro_app_v2/widget/app_bar.dart';

class RiwayatTransaksi extends StatelessWidget {
  const RiwayatTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.red,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SafeArea(
              child: AppBarWidget(
                title: "Riwayat",
                colorFilter: ColorFilter.mode(AppPalette.red, BlendMode.srcIn),
                showSearch: false,
                titlePosition: 'beside',
                showNotification: true,
                showBack: false,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 250,
              decoration: const BoxDecoration(
                color: AppPalette.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              padding: const EdgeInsets.all(40),
              child: const HistoryTransaksiWidget(),
            )
          ],
        ),
      ),
    );
  }
}
