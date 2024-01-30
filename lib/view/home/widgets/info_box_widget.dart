import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_color.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_dimension.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_style.dart';
import 'package:kwin_shops_admin_app/core/core_functions/functions.dart';

class InfoBoxWidget extends StatelessWidget {
  final String textOne, textTwo;
  final Color colorOne, colorTwo;
  const InfoBoxWidget({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.colorOne,
    required this.colorTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
        backgroundBlendMode: BlendMode.darken,
        gradient: LinearGradient(
          colors: [
            colorOne,
            colorTwo,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            textOne,
            style: ConfigStyle.boldStyleThree(
              DIMEN_TWENTY,
              MATERIAL_COLOR,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            textTwo,
            style: ConfigStyle.regularStyleThree(
              DIMEN_SIXTEEN,
              MATERIAL_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
