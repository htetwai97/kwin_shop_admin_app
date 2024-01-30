import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_dimension.dart';
import 'package:kwin_shops_admin_app/view/home/widgets/package_box_widget.dart';

class PackageListView extends StatelessWidget {
  const PackageListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: DIMEN_SIXTEEN),
      separatorBuilder: (context, index) => const SizedBox(
        height: DIMEN_TWENTY,
      ),
      itemCount: 4,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const PackageBoxWidget();
      },
    );
  }
}
