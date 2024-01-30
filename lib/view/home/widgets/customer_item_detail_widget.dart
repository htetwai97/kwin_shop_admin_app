import 'package:flutter/material.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_color.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_dimension.dart';
import 'package:kwin_shops_admin_app/core/core_config/config_style.dart';
import 'package:kwin_shops_admin_app/core/core_functions/functions.dart';

class CustomerItemDetailWidget extends StatelessWidget {
  final String name, about, phone, logo;
  final Function onTap;
  const CustomerItemDetailWidget({
    required this.name,
    required this.about,
    required this.phone,
    required this.logo,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: DIMEN_TWENTY),
      padding: const EdgeInsets.symmetric(
          horizontal: DIMEN_FOURTEEN, vertical: DIMEN_FOURTEEN),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              logo,
              fit: BoxFit.cover,
              width: 120,
              height: 100,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: ConfigStyle.boldStyleThree(
                  DIMEN_SIXTEEN,
                  BLACK_HEAVY,
                ),
              ),
              Text(
                about,
                style: ConfigStyle.boldStyleThree(
                  DIMEN_FOURTEEN,
                  BLACK_LIGHT,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    size: DIMEN_TWENTY,
                    color: BLACK_LIGHT,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    phone,
                    style: ConfigStyle.regularStyleThree(
                      DIMEN_FOURTEEN,
                      BLACK_LIGHT,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              onTap();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.shade100,
              ),
              child: const Icon(
                Icons.arrow_forward,
                size: DIMEN_EIGHTEEN,
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
}
