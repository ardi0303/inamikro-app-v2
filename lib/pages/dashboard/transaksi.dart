import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/datas/user_data.dart';
import 'package:intl/intl.dart';

class TransaksiWidget extends StatelessWidget {
  const TransaksiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = userData;

    final currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    return Container(
      padding: const EdgeInsets.only(
        top: 40.0,
        bottom: 40.0,
      ),
      decoration: const BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppPalette.white2,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icons/chart_penjualan.svg',
                            width: 120,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Penjualan\nhari ini',
                              ),
                              Text(
                                currencyFormatter.format(user[0].penjualan),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppPalette.green1,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/icons/up_arrow.svg',
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Keuntungan',
                                      style: TextStyle(color: AppPalette.grey),
                                    ),
                                    Text(
                                      currencyFormatter
                                          .format(user[0].keuntungan),
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: AppPalette.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0), // Spasi antar container
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppPalette.lightRed,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Pengeluaran',
                                style: TextStyle(color: AppPalette.red),
                              ),
                              Text(
                                currencyFormatter.format(user[0].pengeluaran),
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: AppPalette.red),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
