import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_dimension.dart';
import 'package:kwin_shops_admin_app/core/core_functions/functions.dart';
import 'package:kwin_shops_admin_app/data/vos/customer_vo.dart';
import 'package:kwin_shops_admin_app/network/api_service/api_constants.dart';
import 'package:kwin_shops_admin_app/view/deal/screen/deal_screen.dart';
import 'package:kwin_shops_admin_app/view/home/widgets/customer_item_detail_widget.dart';

class CustomerListView extends StatelessWidget {
  final List<CustomerVO>? customerList;
  const CustomerListView({
    required this.customerList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: DIMEN_SIXTEEN),
      itemCount: customerList?.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return CustomerItemDetailWidget(
          name: customerList?[index].name ?? "",
          about: customerList?[index].businessType ?? "",
          phone: customerList?[index].phone ?? "",
          logo: "$IMAGE_BASE_URL/${customerList?[index].logo?.filename}",
          onTap: () {
            Functions.replacementTransition(
              context,
              DealScreen(
                customerId: customerList?[index].sId ?? "",
                customerName: customerList?[index].name ?? "",
              ),
            );
          },
        );
      },
    );
  }
}
