import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/pages/dashboard/berita.dart';
import 'package:inamikro_app_v2/pages/dashboard/operasional.dart';
import 'package:inamikro_app_v2/pages/dashboard/slider.dart';
import 'package:inamikro_app_v2/pages/dashboard/transaksi.dart';
import 'package:inamikro_app_v2/pages/kasir_cepat/index.dart';
import 'package:inamikro_app_v2/pages/profile/index.dart';
import 'package:inamikro_app_v2/pages/riwayat/index.dart';
import 'package:inamikro_app_v2/pages/tokoku/index.dart';
import 'package:inamikro_app_v2/widget/app_bar.dart';
import 'package:inamikro_app_v2/widget/bottom_nav.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardContent(),
    const Tokoku(),
    const KasirCepat(),
    const RiwayatTransaksi(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SafeArea(
            child: AppBarWidget(
              titleImg: true,
              colorFilter: ColorFilter.mode(AppPalette.red, BlendMode.srcIn),
              showSearch: false,
              titlePosition: 'beside',
              showNotification: true,
              showBack: false,
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: AppPalette.white),
            child: const Column(
              children: [
                TransaksiWidget(),
                SliderWidget(),
                OperasionalWidget(),
                BeritaWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy content
class LikesContent extends StatelessWidget {
  const LikesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Likes Page'));
  }
}

class KasirCepatContent extends StatelessWidget {
  const KasirCepatContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Kasir Cepat Page'));
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Page 1'));
  }
}
