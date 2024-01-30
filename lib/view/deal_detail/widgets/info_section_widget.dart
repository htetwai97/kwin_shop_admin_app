import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_color.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_style.dart';
import 'package:kwin_shops_admin_app/core/core_functions/functions.dart';

class InfoSectionWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const InfoSectionWidget({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: ConfigStyle.boldStyleThreeWithUnderLine(
              16,
              BLACK_HEAVY,
            ),
          ),
          const SizedBox(height: 10),
          child
        ],
      ),
    );
  }
}
