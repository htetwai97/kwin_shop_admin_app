import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_color.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_dimension.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_style.dart';

class TitleAndAddNewPackageRowWidget extends StatelessWidget {
  const TitleAndAddNewPackageRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Available Packages",
          style: ConfigStyle.boldStyleThree(
            DIMEN_SIXTEEN,
            BLACK_HEAVY,
          ),
        ),
        MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: LEAVE_SCREEN_COLOR,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onPressed: () {},
          child: Text(
            "Add New +",
            style: ConfigStyle.regularStyleThree(
              DIMEN_FOURTEEN,
              MATERIAL_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}