import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_color.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_style.dart';
import 'package:kwin_shops_admin_app/core/core_functions/functions.dart';
import 'package:kwin_shops_admin_app/data/vos/deal_vo.dart';
import 'package:kwin_shops_admin_app/view/deal/screen/deal_screen.dart';
import 'package:kwin_shops_admin_app/view/deal_detail/bloc/deal_detail_bloc.dart';
import 'package:kwin_shops_admin_app/view/deal_detail/widgets/info_section_widget.dart';
import 'package:kwin_shops_admin_app/view/deal_detail/widgets/title_and_text_row_widget.dart';
import 'package:provider/provider.dart';

class DealDetailScreen extends StatelessWidget {
  final String customerId, customerName, dealId;
  const DealDetailScreen({
    Key? key,
    required this.customerName,
    required this.customerId,
    required this.dealId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DealDetailBloc(dealId),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Functions.replacementTransition(
                  context,
                  DealScreen(
                      customerId: customerId, customerName: customerName));
            },
            child: const Icon(
              Icons.arrow_back,
              color: BLACK_HEAVY,
              size: 24,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Deal Detail",
            style: ConfigStyle.boldStyleThree(16, BLACK_HEAVY),
          ),
        ),
        body: Selector<DealDetailBloc, bool>(
          selector: (context, bloc) => bloc.isLoading,
          builder: (context, isLoading, child) => Selector<DealDetailBloc,
                  DealVO?>(
              builder: (context, dealVO, child) {
                if (isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          TitleAndTextRowWidget(
                            title: "App Name",
                            text: dealVO?.appName ?? "",
                          ),
                          TitleAndTextRowWidget(
                            title: "Code",
                            text: dealVO?.code ?? "",
                          ),
                          TitleAndTextRowWidget(
                            title: "Date",
                            text: dealVO?.date?.substring(0, 10) ?? "",
                          ),
                          const SizedBox(height: 20),
                          InfoSectionWidget(
                            title: "Subscription Type",
                            child: Column(
                              children: [
                                TitleAndTextRowWidget(
                                  title: "Code",
                                  text: dealVO?.subscriptionType?.code ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Price",
                                  text: dealVO?.subscriptionType?.price
                                          ?.toString() ??
                                      "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Duration",
                                  text:
                                      "${dealVO?.subscriptionType?.duration?.value} ${dealVO?.subscriptionType?.duration?.type}",
                                ),
                              ],
                            ),
                          ),
                          InfoSectionWidget(
                            title: "Customer",
                            child: Column(
                              children: [
                                TitleAndTextRowWidget(
                                  title: "Business Name",
                                  text: dealVO?.customer?.businessName ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Email",
                                  text: dealVO?.customer?.email ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Phone",
                                  text: dealVO?.customer?.phone ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Attention",
                                  text: dealVO?.customer?.name ?? "",
                                ),
                              ],
                            ),
                          ),
                          InfoSectionWidget(
                            title: "Employee",
                            child: Column(
                              children: [
                                TitleAndTextRowWidget(
                                  title: "Email",
                                  text: dealVO?.employee?.email ?? "",
                                ),
                                // TitleAndTextRowWidget(
                                //   title: "Phone",
                                //   text: dealVO?.employee?.sId ?? "",
                                // ),
                                TitleAndTextRowWidget(
                                  title: "Attention",
                                  text: dealVO?.employee?.givenName ?? "",
                                ),
                              ],
                            ),
                          ),
                          InfoSectionWidget(
                            title: "Price",
                            child: Column(
                              children: [
                                TitleAndTextRowWidget(
                                  title: "Deal Price",
                                  text: dealVO?.dealPrice?.toString() ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Discount",
                                  text:
                                      dealVO?.discount?.value.toString() ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Net Deal Price",
                                  text: dealVO?.netDealPrice?.toString() ?? "",
                                ),
                              ],
                            ),
                          ),
                          InfoSectionWidget(
                            title: "Training",
                            child: Column(
                              children: [
                                TitleAndTextRowWidget(
                                  title: "Training Day",
                                  text: dealVO?.training?.day.toString() ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Person per day",
                                  text:
                                      dealVO?.training?.person.toString() ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Hour per day",
                                  text: dealVO?.training?.hour.toString() ?? "",
                                ),
                              ],
                            ),
                          ),
                          InfoSectionWidget(
                            title: "Other",
                            child: Column(
                              children: [
                                TitleAndTextRowWidget(
                                  title: "Payment Term",
                                  text: dealVO?.paymentTerm ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Project Start Date",
                                  text: dealVO?.projectStartDate
                                          ?.substring(0, 10) ??
                                      "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Free Subscription",
                                  text: dealVO?.freeSubscription?.toString() ??
                                      "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "User Accounts",
                                  text: dealVO?.numOfUser ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Number of Branches",
                                  text: dealVO?.numOfBranch?.toString() ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Request Detail",
                                  text: dealVO?.requestDetail ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Request Price",
                                  text: dealVO?.requestPrice?.toString() ?? "",
                                ),
                                TitleAndTextRowWidget(
                                  title: "Request Time(dead line)",
                                  text: dealVO?.requestTime?.substring(0, 10) ??
                                      "",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
              selector: (context, bloc) => bloc.dealVO),
        ),
      ),
    );
  }
}
