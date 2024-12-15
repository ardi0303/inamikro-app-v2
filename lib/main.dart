import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/pages/dashboard/index.dart';
import 'package:inamikro_app_v2/pages/kasir_cepat/cart/index.dart';
import 'package:inamikro_app_v2/pages/kasir_cepat/index.dart';
import 'package:inamikro_app_v2/pages/kasir_cepat/nota/index.dart';
import 'package:inamikro_app_v2/pages/kasir_pintar/cart/index.dart';
import 'package:inamikro_app_v2/pages/kasir_pintar/index.dart';
import 'package:inamikro_app_v2/pages/kasir_pintar/nota/index.dart';
import 'package:inamikro_app_v2/provider/kasir_pintar_provider.dart';
import 'package:inamikro_app_v2/provider/kasir_cepat_provider.dart';
import 'package:inamikro_app_v2/provider/search_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => KasirPintarProvider()),
        ChangeNotifierProvider(create: (_) => KasirCepatProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Dashboard(),
        '/kasir-pintar': (context) => const KasirPintar(),
        '/kasir-pintar/cart': (context) => const KasirPintarCart(),
        '/kasir-pintar/nota': (context) => const KasirPintarNota(),
        '/kasir-cepat': (context) => const KasirCepat(),
        '/kasir-cepat/cart': (context) => const KasirCepatCart(),
        '/kasir-cepat/nota': (context) => const KasirCepatNota(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SanFrancisco',
      ),
    );
  }
}
