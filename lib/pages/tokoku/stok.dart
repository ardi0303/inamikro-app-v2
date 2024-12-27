import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StokWidget extends StatelessWidget {
  const StokWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Penjualan bulan ini",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            "Rp 300.000",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset(
                            'assets/icons/chart_penjualan.svg',
                            width: 120,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/icons/karyawan.svg'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Daftar Karyawan",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/icons/pelanggan.svg'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Daftar Pelanggan",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/stok.svg'),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kelola Stok"),
                  Text(
                    "123 Produk",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
