import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inamikro_app_v2/app_palette.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearchChanged;
  final Color? bgInputColor;
  final Color? buttonFill;
  final String? filterIconPath;

  const SearchWidget({
    super.key,
    required this.controller,
    required this.onSearchChanged,
    this.bgInputColor = AppPalette.white3,
    this.buttonFill = AppPalette.white2,
    this.filterIconPath = 'assets/icons/filter.svg',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onSearchChanged, // Call onChange function
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 16.0,
                  left: 20.0,
                  right: 10.0,
                ),
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: bgInputColor,
              hintStyle: const TextStyle(
                fontFamily: 'SanFrancisco',
                fontSize: 16.0,
                color: AppPalette.black2,
              ),
            ),
            style: const TextStyle(
              fontFamily: 'SanFrancisco',
              fontSize: 16.0,
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 56.0,
          width: 56.0,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: buttonFill,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SvgPicture.asset(
              filterIconPath!,
            ),
          ),
        ),
      ],
    );
  }
}
