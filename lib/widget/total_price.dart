import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inamikro_app_v2/app_palette.dart';

class TotalAndPayWidget<T> extends StatelessWidget {
  final String Function(T provider) totalValueExtractor;
  final VoidCallback onPayPressed;

  const TotalAndPayWidget({
    super.key,
    required this.totalValueExtractor,
    required this.onPayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, provider, child) {
        final totalValue = totalValueExtractor(provider);

        return Container(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
          decoration: const BoxDecoration(
            color: AppPalette.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppPalette.red.withOpacity(0.2),
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(20.0),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 16.0,
                  ),
                  child: Text(
                    'Total: Rp $totalValue',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppPalette.red,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: onPayPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPalette.red, // Warna tombol
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Bayar',
                  style: TextStyle(fontSize: 16.0, color: AppPalette.white2),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
