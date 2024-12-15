import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inamikro_app_v2/app_palette.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 40.0, left: 40.0, right: 40.0),
      decoration: const BoxDecoration(
        color: AppPalette.white,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppPalette.white2,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/rounded_chart.svg',
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kelengkapan data',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lengkapi data diri anda\nsesuai dengan E-KTP.',
                  style: TextStyle(
                    color: AppPalette.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
