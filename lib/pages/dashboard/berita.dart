import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/datas/berita_data.dart';

class BeritaWidget extends StatelessWidget {
  const BeritaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Column(
          children: [
            ...beritaData.asMap().entries.map(
              (entry) {
                final index = entry.key;
                final berita = entry.value;

                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(berita.thumbnail),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 160,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index ==
                          0) // Hanya render "Last update" untuk item pertama
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Last update",
                                style: TextStyle(color: AppPalette.white2),
                              ),
                            ],
                          ),
                        )
                      else
                        const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    AppPalette.black2.withOpacity(1.0),
                                    AppPalette.black2.withOpacity(0.0),
                                  ],
                                ),
                                backgroundBlendMode: BlendMode.srcOver,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    berita.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppPalette.white2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "lorem ipsum dolor sit amet",
                                    style: TextStyle(color: AppPalette.white2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
