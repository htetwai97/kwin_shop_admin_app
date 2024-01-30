import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_color.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_dimension.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_style.dart';
import 'package:kwin_shops_admin_app/view/home/widgets/info_box_row_view.dart';
import 'package:kwin_shops_admin_app/view/home/widgets/package_list_view.dart';
import 'package:kwin_shops_admin_app/view/home/widgets/title_and_add_new_package_row_widget.dart';

class PackageTabView extends StatelessWidget {
  const PackageTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DIMEN_SIXTEEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "This Month",
            style: ConfigStyle.boldStyleThree(
              DIMEN_SIXTEEN,
              BLACK_HEAVY,
            ),
          ),
          const SizedBox(height: DIMEN_TWENTY),
          const InfoBoxRowView(),
          const SizedBox(height: DIMEN_TWENTY_EIGHT),
          const TitleAndAddNewPackageRowWidget(),
          const PackageListView()
        ],
      ),
    );
  }
}
