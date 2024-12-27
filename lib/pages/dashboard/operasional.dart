import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inamikro_app_v2/app_palette.dart';

class OperasionalWidget extends StatelessWidget {
  const OperasionalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/kasir-pintar');
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppPalette.white2,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                children: [
                  Transform.translate(
                    offset: const Offset(-25, -25),
                    child: const Image(
                      image: AssetImage('assets/images/kasir_pintar.png'),
                      width: 160,
                    ),
                  ),
                  const Text(
                    "Kasir Pintar",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppPalette.white2,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform.translate(
                        offset: const Offset(-10, -10),
                        child: const Image(
                          image: AssetImage('assets/images/pengeluaran.png'),
                          width: 120,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -25),
                        child: const Text(
                          "Pengeluaran",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/bg_balance.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Balance",
                              style: TextStyle(
                                color: AppPalette.white2.withOpacity(0.5),
                                fontSize: 18,
                              ),
                            ),
                            const Text(
                              "Rp 4.535.000",
                              style: TextStyle(
                                  color: AppPalette.white2,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "-15.000",
                              style: TextStyle(color: AppPalette.red),
                            ),
                            SvgPicture.asset('assets/icons/balance.svg'),
                          ],
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
    );
  }
}
