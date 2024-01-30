import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_color.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_style.dart';

class TitleAndTextRowWidget extends StatelessWidget {
  final String title, text;
  const TitleAndTextRowWidget({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            title,
            style: ConfigStyle.regularStyleThree(
              14,
              BLACK_HEAVY,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 200,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: ConfigStyle.regularStyleThree(
              14,
              BLACK_LIGHT,
            ),
          ),
        ),
      ],
    );
  }
}
