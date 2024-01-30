import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_color.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_dimension.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_style.dart';
import 'package:kwin_shops_admin_app/data/vos/customer_vo.dart';
import 'package:kwin_shops_admin_app/view/home/bloc/home_bloc.dart';
import 'package:kwin_shops_admin_app/view/home/widgets/customer_list_view.dart';
import 'package:kwin_shops_admin_app/view/home/widgets/package_tab_view.dart';
import 'package:kwin_shops_admin_app/view/home/widgets/tab_option_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPackage = false;
  bool isCustomer = true;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: Selector<HomeBloc, bool>(
        selector: (context, bloc) => bloc.isLoading,
        builder: (context, isLoading, child) => (isLoading)
            ? Container(
                color: MATERIAL_COLOR,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: APP_THEME_COLOR,
                  elevation: 0.0,
                  centerTitle: true,
                  leading: const Icon(
                    Icons.menu,
                    color: MATERIAL_COLOR,
                  ),
                  title: Text(
                    "Home",
                    style: ConfigStyle.regularStyleThree(
                      DIMEN_EIGHTEEN,
                      MATERIAL_COLOR,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: DIMEN_TWENTY),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TabOptionWidget(
                            title: "Customers",
                            isActive: isCustomer,
                            onTap: () {
                              isPackage = false;
                              isCustomer = true;
                              setState(() {});
                            },
                          ),
                          TabOptionWidget(
                            title: "Packages",
                            isActive: isPackage,
                            onTap: () {
                              isPackage = true;
                              isCustomer = false;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: DIMEN_TWENTY),
                      (!isPackage)
                          ? Selector<HomeBloc, List<CustomerVO>?>(
                              selector: (context, bloc) => bloc.customerList,
                              builder: (context, customerList, child) =>
                                  CustomerListView(
                                customerList: customerList,
                              ),
                            )
                          : const PackageTabView(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
