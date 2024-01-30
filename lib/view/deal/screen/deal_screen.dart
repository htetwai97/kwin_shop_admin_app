import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_color.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_style.dart';
import 'package:kwin_shops_admin_app/core/core_functions/functions.dart';
import 'package:kwin_shops_admin_app/data/vos/deal_for_list_vo.dart';
import 'package:kwin_shops_admin_app/view/deal/bloc/deal_bloc.dart';
import 'package:kwin_shops_admin_app/view/deal_detail/screen/deal_detail_screen.dart';
import 'package:kwin_shops_admin_app/view/home/screen/home_screen.dart';
import 'package:provider/provider.dart';

class DealScreen extends StatelessWidget {
  final String customerId, customerName;
  const DealScreen({
    Key? key,
    required this.customerId,
    required this.customerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DealBloc(customerId),
      child: Selector<DealBloc, bool>(
        selector: (context, bloc) => bloc.isSwitching,
        builder: (context, isSwitching, child) => Selector<DealBloc, bool>(
          builder: (context, isLoading, child) {
            if (isLoading) {
              return Container(
                color: MATERIAL_COLOR,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Scaffold(
                    backgroundColor:
                        (isSwitching) ? Colors.grey.shade400 : MATERIAL_COLOR,
                    appBar: AppBar(
                      backgroundColor:
                          (isSwitching) ? Colors.grey.shade400 : MATERIAL_COLOR,
                      elevation: 0.0,
                      centerTitle: true,
                      leading: InkWell(
                        onTap: () {
                          Functions.replacementTransition(
                              context, const HomeScreen());
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: BLACK_HEAVY,
                          size: 24,
                        ),
                      ),
                      title: Text(
                        "Deals of $customerName",
                        style: ConfigStyle.boldStyleThree(
                          16,
                          BLACK_HEAVY,
                        ),
                      ),
                    ),
                    body: Selector<DealBloc, List<DealForListVO>?>(
                      selector: (context, bloc) => bloc.dealList,
                      builder: (context, dealList, child) => ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dealList?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                Functions.buildBoxShadow(),
                              ],
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.purple,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${dealList?[index].code}",
                                        style: ConfigStyle.regularStyleThree(
                                          12,
                                          MATERIAL_COLOR,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${dealList?[index].appName}",
                                        style: ConfigStyle.regularStyleThree(
                                          15,
                                          BLACK_HEAVY,
                                        ),
                                      ),
                                      Text(
                                        "Start at ${dealList?[index].projectStartDate?.substring(0, 10)}",
                                        style: ConfigStyle.regularStyleThree(
                                          15,
                                          BLACK_HEAVY,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Switch(
                                    value: dealList?[index].accessible ?? false,
                                    onChanged: (e) {
                                      if (!isSwitching) {
                                        Functions.logoutDialog(context, 80, () {
                                          Navigator.pop(context);
                                        }, () {
                                          Navigator.pop(context);
                                          if (!isSwitching) {
                                            var bloc = Provider.of<DealBloc>(
                                                context,
                                                listen: false);
                                            bloc.onSwitch(
                                                dealList?[index].accessible ??
                                                    false,
                                                dealList?[index].sId ?? "",
                                                dealList?[index].appName ?? "");
                                          }
                                        },
                                            "Manage App Access",
                                            (dealList?[index].accessible ??
                                                    false)
                                                ? "Are you Sure to suspend ${dealList?[index].appName}?"
                                                : "Are you Sure to activate ${dealList?[index].appName}?",
                                            "Cancel",
                                            "OK");
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    Functions.replacementTransition(
                                        context,
                                        DealDetailScreen(
                                            customerName: customerName,
                                            customerId: customerId,
                                            dealId:
                                                dealList?[index].sId ?? ""));
                                  },
                                  child: Container(
                                    width: 90,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Detail",
                                        style: ConfigStyle.boldStyleThree(
                                          16,
                                          MATERIAL_COLOR,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isSwitching,
                    child: Center(
                      child: SpinKitPulse(
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: index.isEven
                                  ? APP_THEME_COLOR_REDUCE
                                  : CARD_FIRST_COLOR,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          },
          selector: (context, bloc) => bloc.isLoading,
        ),
      ),
    );
  }
}
