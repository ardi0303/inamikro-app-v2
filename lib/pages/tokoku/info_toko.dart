import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inamikro_app_v2/app_palette.dart';

class InfoTokoWidget extends StatelessWidget {
  const InfoTokoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppPalette.white2,
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Toko',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    'HENOCH Apparel',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pemilik',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alamat',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    'Jl. Malioboro, No. 27',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset('assets/icons/button_edit.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
