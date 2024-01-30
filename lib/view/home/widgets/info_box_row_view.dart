import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_color.dart';
import 'package:kwin_shops_admin_app/view/home/widgets/info_box_widget.dart';

class InfoBoxRowView extends StatelessWidget {
  const InfoBoxRowView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InfoBoxWidget(
          textOne: "6",
          textTwo: "Subscribed",
          colorOne: MENU_ONE_COLOR,
          colorTwo: MENU_TWO_COLOR,
        ),
        InfoBoxWidget(
          textOne: "2",
          textTwo: "Unsubscribed",
          colorOne: APP_THEME_COLOR_REDUCE,
          colorTwo: APP_THEME_COLOR_TWO_REDUCE,
        ),
      ],
    );
  }
}
