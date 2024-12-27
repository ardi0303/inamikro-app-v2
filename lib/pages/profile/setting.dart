import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inamikro_app_v2/app_palette.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Printer',
                            style: TextStyle(
                              color: AppPalette.black2,
                              fontSize: 16,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/printer.svg',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Bahasa',
                            style: TextStyle(
                              color: AppPalette.black2,
                              fontSize: 16,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/language.svg',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Customer',
                                style: TextStyle(
                                  color: AppPalette.black2,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                'Service',
                                style: TextStyle(
                                  color: AppPalette.black2,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/icons/cs.svg',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/sync.svg'),
              const SizedBox(width: 10),
              const Text(
                "Sinkronisasi Data",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        )
      ],
    );
  }
}
