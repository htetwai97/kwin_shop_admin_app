import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_color.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_dimension.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_style.dart';
import 'package:kwin_shops_admin_app/core/core_functions/functions.dart';

class TabOptionWidget extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function onTap;
  const TabOptionWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(DIMEN_TWENTY_FOUR),
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? BUTTON_COLOR : Colors.white10,
          borderRadius: BorderRadius.circular(DIMEN_TWENTY_FOUR),
          boxShadow: [
            Functions.buildBoxShadow(),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN,
              isActive ? MATERIAL_COLOR : BLACK_HEAVY,
            ),
          ),
        ),
      ),
    );
  }
}
