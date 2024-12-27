import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/pages/profile/info_profile.dart';
import 'package:inamikro_app_v2/pages/profile/setting.dart';
import 'package:inamikro_app_v2/widget/app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.red,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SafeArea(
              child: AppBarWidget(
                title: "Profile",
                colorFilter: ColorFilter.mode(AppPalette.red, BlendMode.srcIn),
                showSearch: false,
                titlePosition: 'beside',
                showNotification: true,
                showBack: false,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
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
                  InfoProfileWidget(),
                  SizedBox(
                    height: 40,
                  ),
                  SettingWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
