import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/pages/tokoku/info_toko.dart';
import 'package:inamikro_app_v2/pages/tokoku/stok.dart';
import 'package:inamikro_app_v2/widget/app_bar.dart';

class Tokoku extends StatelessWidget {
  const Tokoku({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.red,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SafeArea(
              child: AppBarWidget(
                title: "Tokoku",
                colorFilter: ColorFilter.mode(AppPalette.red, BlendMode.srcIn),
                showSearch: false,
                titlePosition: 'beside',
                showNotification: true,
                showBack: false,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppPalette.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              padding: const EdgeInsets.all(40),
              child: const Column(
                children: [
                  InfoTokoWidget(),
                  SizedBox(
                    height: 40,
                  ),
                  StokWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
