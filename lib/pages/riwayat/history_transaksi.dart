import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/provider/kasir_pintar_provider.dart';
import 'package:inamikro_app_v2/provider/kasir_cepat_provider.dart'; // Add your Kasir Cepat provider here
import 'package:provider/provider.dart';

class HistoryTransaksiWidget extends StatefulWidget {
  const HistoryTransaksiWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HistoryTransaksiWidgetState createState() => _HistoryTransaksiWidgetState();
}

class _HistoryTransaksiWidgetState extends State<HistoryTransaksiWidget> {
  bool isKasirPintarSelected = true; // Default to Kasir Pintar

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isKasirPintarSelected = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isKasirPintarSelected
                      ? AppPalette.grey
                      : AppPalette.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Kasir Pintar',
                    style: TextStyle(
                        fontSize: 16,
                        color: isKasirPintarSelected
                            ? AppPalette.white
                            : AppPalette.black2)),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isKasirPintarSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isKasirPintarSelected
                      ? AppPalette.white
                      : AppPalette.grey,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Kasir Cepat',
                    style: TextStyle(
                        fontSize: 16,
                        color: isKasirPintarSelected
                            ? AppPalette.black2
                            : AppPalette.white)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        isKasirPintarSelected
            ? Container(
                decoration: const BoxDecoration(
                  color: AppPalette.white2,
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Riwayat kasir pintar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Consumer<KasirPintarProvider>(
                      builder: (context, kasirProvider, child) {
                        final transactions = kasirProvider.transactions;

                        if (transactions.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                              child: Text('Belum ada transaksi'),
                            ),
                          );
                        }

                        return ListView.builder(
                          shrinkWrap:
                              true, // Prevent ListView from expanding beyond its content
                          padding: EdgeInsets.zero,
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = transactions[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "#${transaction['invoiceNumber']}",
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const Spacer(),
                                      Text("+ Rp${transaction['finalPrice']}"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("${transaction['customerName']}"),
                                      const Spacer(),
                                      Text(
                                          "${transaction['date']}, ${transaction['time']}"),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              )
            : Container(
                decoration: const BoxDecoration(
                  color: AppPalette.white2,
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Riwayat kasir cepat",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Consumer<KasirCepatProvider>(
                      builder: (context, kasirProvider, child) {
                        final transactions = kasirProvider.transactions;

                        if (transactions.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                              child: Text('Belum ada transaksi'),
                            ),
                          );
                        }

                        return ListView.builder(
                          shrinkWrap:
                              true, // Prevent ListView from expanding beyond its content
                          padding: EdgeInsets.zero,
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = transactions[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "#${transaction['invoiceNumber']}",
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const Spacer(),
                                      Text("+ Rp${transaction['finalPrice']}"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("${transaction['customerName']}"),
                                      const Spacer(),
                                      Text(
                                          "${transaction['date']}, ${transaction['time']}"),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
