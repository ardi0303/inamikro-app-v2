import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/models/user_model.dart';
import 'package:intl/intl.dart';

class BalanceWidget extends StatelessWidget {
  final User user; // Add a User parameter

  const BalanceWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,###', 'en_US');

    // Function to format number with periods as thousands separators
    String formatWithPeriod(int value) {
      final formatted = numberFormat.format(value);
      return formatted.replaceAll(',', '.');
    }

    return Container(
      margin: const EdgeInsets.only(left: 28.0, right: 28.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/bg-balance.png'), // Add your image path here
          fit: BoxFit.cover, // Adjust the image's fit as per your requirement
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, left: 28.0, right: 28.0),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Align the icons and text
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Penjualan',
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    formatWithPeriod(user.penjualan.toInt()), // Use the user's balance here
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pengeluaran',
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    formatWithPeriod(user.pengeluaran.toInt()), // Use the user's balance here
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Keuntungan',
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    formatWithPeriod(user.keuntungan.toInt()), // Use the user's balance here
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
