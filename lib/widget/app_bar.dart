import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/widget/search.dart';

class AppBarWidget extends StatelessWidget {
  final String? title;
  final ColorFilter? colorFilter;
  final TextEditingController? controller;
  final ValueChanged<String>? onSearchChanged;
  final bool showSearch;
  final String titlePosition; // Add titlePosition parameter
  final Color? backgroundColor;
  final Color? buttonFill;
  final Color? titleColor;
  final Color? bgInputColor;
  final String? filterIconPath;
  final Color? buttonFilterFill;
  final bool showNotification;
  final bool titleImg;
  final bool showBack;

  const AppBarWidget({
    super.key,
    this.title = '',
    this.colorFilter = const ColorFilter.mode(AppPalette.red, BlendMode.srcIn),
    this.controller,
    this.onSearchChanged,
    this.showSearch = false,
    this.titlePosition = 'beside', // Default to 'beside'
    this.backgroundColor = AppPalette.red,
    this.buttonFill = AppPalette.white,
    this.titleColor = AppPalette.white,
    this.bgInputColor = AppPalette.white3,
    this.filterIconPath = 'assets/icons/filter.svg',
    this.buttonFilterFill = AppPalette.white2,
    this.showNotification = false,
    this.titleImg = false,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display title beside or below based on titlePosition
            if (titlePosition == 'beside')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (showBack)
                        GestureDetector(
                          onTap: () => {
                            if (Navigator.canPop(context))
                              {Navigator.pop(context)},
                            if (onSearchChanged != null) {onSearchChanged!('')},
                            if (controller != null) {controller!.clear()}
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 11.0),
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: buttonFill,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(1000)),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/button_back.svg',
                              colorFilter: colorFilter,
                            ),
                          ),
                        ),
                      if (title != null)
                        Text(
                          title!,
                          style: TextStyle(
                            fontFamily: 'SanFrancisco',
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: titleColor,
                          ),
                        ),
                      if (titleImg)
                        SvgPicture.asset(
                          'assets/icons/logo.svg',
                        ),
                    ],
                  ),
                  if (showNotification)
                    Container(
                      width: 40.0,
                      height: 40.0,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppPalette.white2,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/notification.svg',
                      ),
                    ),
                ],
              ),
            if (titlePosition == 'below')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(
                        context), // Tambahkan Navigator.pop langsung di sini
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 11.0),
                      decoration: BoxDecoration(
                        color: buttonFill,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(1000)),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/button_back.svg',
                        colorFilter: colorFilter,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (title != null)
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth *
                                0.75, // 3/4 of the screen width
                          ),
                          child: Text(
                            title!,
                            style: TextStyle(
                              fontFamily: 'SanFrancisco',
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: titleColor,
                            ),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                        );
                      },
                    ),
                ],
              ),
            if (showSearch &&
                controller != null &&
                onSearchChanged != null) ...[
              const SizedBox(height: 40),
              SearchWidget(
                controller: controller!,
                onSearchChanged: onSearchChanged!,
                bgInputColor: bgInputColor,
                filterIconPath: filterIconPath,
                buttonFill: buttonFilterFill,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
